# Derives sort order and a grouped display string for courses from their
# `semester` list (e.g. ["Fall 2024", "Fall 2025"]), replacing the old
# manually-maintained start_date/latest_date fields.
module Jekyll
  class CourseSemesterGenerator < Generator
    safe true
    priority :normal

    SEASON_RANK = { "Spring" => 1, "Summer" => 2, "Fall" => 3, "Winter" => 4 }.freeze
    SEASON_PATTERN = /\A\s*(Spring|Summer|Fall|Winter)\s+(\d{4})\s*\z/i.freeze

    def generate(site)
      collection = site.collections["courses"]
      return unless collection

      collection.docs.each do |doc|
        semesters = Array(doc.data["semester"])
        parsed = semesters.map { |s| parse_semester(s) }.compact
        next if parsed.empty?

        doc.data["semester_sort_key"] = sort_key(parsed)
        doc.data["semester_display"] = display(parsed)
      end
    end

    private

    def parse_semester(str)
      m = SEASON_PATTERN.match(str.to_s)
      return nil unless m

      [m[1].capitalize, m[2].to_i]
    end

    def sort_key(parsed)
      season, year = parsed.max_by { |s, y| [y, SEASON_RANK[s] || 0] }
      (year * 10) + (SEASON_RANK[season] || 0)
    end

    def display(parsed)
      grouped = parsed.group_by { |season, _year| season }

      lines = grouped.map do |season, entries|
        years = entries.map { |_season, year| year }
        min_year, max_year = years.min, years.max
        label = min_year == max_year ? "#{season} #{min_year}" : "#{season} #{min_year}-#{max_year}"
        [max_year, SEASON_RANK[season] || 0, label]
      end

      lines.sort_by! { |max_year, rank, _label| [-max_year, -rank] }
      lines.map { |_max_year, _rank, label| label }.join("<br />")
    end
  end
end
