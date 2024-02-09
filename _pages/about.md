---
layout: about
title: about
permalink: /
subtitle: <a href='#'>Affiliations</a>. Address. Contacts. Moto. Etc.

profile:
  align: right
  image: prof_pic.png
  image_circular: false # crops the image to make it circular
  more_info: # >
    # <p>Rm 617, Tsing Hua Lab</p>
    # <p>101, Sec 2, Guangfu Rd</p>
    # <p>East Dist, Hsinchu City 300014, Taiwan</p>

news: false  # includes a list of news items
latest_posts: false  # includes a list of the newest posts
selected_papers: true # includes a list of papers marked as "selected={true}"
social: true  # includes social icons at the bottom of the page
groups: [labhead]
labhead:
  title: Lab Head
  people:
    - name: Ming-Chieh Shih
      description: Assistant Professor, School of Medicine, National Tsing Hua University
      picture: mcshih.jpg
---

Welcome to to the website of Dr. Ming-Chieh Shih and the evidence generation & synthesis lab! In this lab, I work with development and application of statistical methods related to evidence generation and evidence synthesis. 

<div class="projects">
{%- for group in page.groups -%}
  <h2 class="category">{{page.[group].title}}</h2>
    <div class="grid">
      {%- for person in page.[group].people -%}
          <article class="grid-item card">
            {% if person.picture -%}
              <img class="avatar" src="/assets/img/{{person.picture}}" alt="Portrait ({{person.name}})" width="auto" height="auto">
            {%- else -%}
              <img class="avatar" src="/assets/img/mainlp-logo-500.png" alt="Portrait ({{person.name}})" width="auto" height="auto">
            {%- endif -%}
          <div class="card-body">
            <!-- <h2 class="card-title">{{person.name}}</h2> -->
            <h2 class="card-title">
              {% if person.website -%}
                <a href="{{person.website}}">{{person.name}}</a>
              {%- else -%}
                {{person.name}}
              {%- endif -%}
            </h2>
            <div class="card-text">
              {{person.description}}
              <!-- <p style="margin-bottom: 0rem;">{{person.description}}</p> 
              <ul class="network-icon" aria-hidden="true">
              {% if person.website -%}
                <li><a href="{{person.website}}"><i class="fas fa-globe"></i></a></li>
              {%- endif -%}
              {% if person.email -%}
                <li><a role="button" class="email" style="color: var(--global-theme-color)"><i class="fas fa-envelope"></i></a></li>
              {%- endif -%}
              {% if person.googlescholar -%}
                <li><a href="{{person.googlescholar}}"><i class="ai ai-google-scholar"></i></a></li>
              {%- endif -%}
              {% if person.github -%}
                <li><a href="{{person.github}}"><i class="fab fa-github"></i></a></li>
              {%- endif -%}
              {% if person.twitter -%}
                <li><a href="{{person.twitter}}"><i class="fab fa-twitter"></i></a></li>
              {%- endif -%}
            </ul>
            {% if person.email -%}
              <div class="email hidden">
                <p>{{ person.email }}</p>
              </div>
            {%- endif -%} -->
              </div>
            </div>
          </article>
      {%- endfor -%}
    </div>
  {%- endfor -%}
</div>