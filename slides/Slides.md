---
marp: true
theme: default
footer: '@Chris_L_Ayers - https://chrislayers.com'
style: |
  .columns {
    display: grid;
    grid-template-columns: repeat(2, minmax(0, 1fr));
    gap: 1rem;
  }
  .vert {
    vertical-align: middle
  }
  .fa-th-large {
    color: blue;
  }
  .fa-users {
    color: brown;
  }
  .fa-warning {
    color: orange
  }

  @import 'https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css'

---
<!-- _footer: 'https://github.com/codebytes/dev-containers' -->

![bg right](img/containers.jpg)
# Dev Containers

A VS Code superpower

---

![bg left:40%](./img/portrait.png)

## Chris Ayers
### Senior Customer Engineer<br>Microsoft

<i class="fa-brands fa-twitter"></i> Twitter: @Chris\_L\_Ayers
<i class="fa-brands fa-mastodon"></i> Mastodon: @Chrisayers@hachyderm.io
<i class="fa-brands fa-linkedin"></i> LinkedIn: - [chris\-l\-ayers](https://linkedin.com/in/chris-l-ayers/)
<i class="fa fa-window-maximize"></i> Blog: [https://chris-ayers\.com/](https://chris-ayers.com/)
<i class="fa-brands fa-github"></i> GitHub: [Codebytes](https://github.com/codebytes)

---

# Agenda

- Prerequisites
- What are Dev Containers?
- How Dev Containers Work?
- Why use Dev Containers?
- How to build a Dev Containers?
  
---
<style scoped>
li { font-size: 38px; }
</style>

# Prerequisites

- VS Code
- Docker
  - Windows - Docker Desktop 2.0+ / WSL2
  - Mac - Docker Desktop 2.0+
  - Linux - Docker CE/EE 18.06+ / Docker Compose 1.21+
    - (Ubuntu snap not supported)
- VSCode - Remote - Containers Extension

---

# What are Dev Containers?

---

# Dev Containers are:

- Environments that run in a container
- Containers that let you open or mount any folder and still use VS Code UI and tooling
- Places to run Apps, Tools, or Runtimes needed for a project or codebase

---

# How Dev Containers Work

![Dev Containers](img/architecture-containers.png)

---

<style scoped>
li {  
  list-style-type: none; 
  font-size: 36px;   
}
.columns {
  grid-template-columns: fit-content(40%),fit-content(60%)
}
</style>


<div class="columns">
<div>

# Why use<br>Dev Containers?

</div>
<div>

- <i class="fa fa-users"></i> Onboard new People
- <i class="fa fa-wrench"></i> Use consistent tooling 
- <i class="fa fa-file-code-o"></i> Use consistent versions
- <i class="fa fa-warning"></i> Reduce System Conflicts
- <i class="fa fa-tasks"></i> Perform Startup Tasks

</div>
</div>

---


# How do you build a Dev Container?

From the Command Pallet

 ![Add Dev Container files](./img/add-dev-containers-config.png)

---

<style scoped>
img {
  width: 60%
}
</style>
# Which Dev Container do I Pick?

 ![Add Options](./img/dev-container-choices.png)

---

<style scoped>
img {
  width: 100%
}
</style>

# How Do I Configure it?

![files](img/config-file.png)

---

# DEMO TIME
![bg right 70%](img/connected-to-dev-container.png)

---

![bg](img/questions.jpg)


---

# Resources 


<div class="columns">
<div>

## Links

- [https://docs.microsoft.com/en-us/events/learntv/learnlive-iac-and-bicep/](https://docs.microsoft.com/en-us/events/learntv/learnlive-iac-and-bicep/)
- [https://github.com/codebytes](https://github.com/codebytes)

</div>
<div>

## Chris Ayers 

<i class="fa-brands fa-twitter"></i> Twitter: @Chris\_L\_Ayers
<i class="fa-brands fa-mastodon"></i> Mastodon: @Chrisayers@hachyderm.io
<i class="fa-brands fa-linkedin"></i> LinkedIn: - [chris\-l\-ayers](https://linkedin.com/in/chris-l-ayers/)
<i class="fa fa-window-maximize"></i> Blog: [https://chris-ayers\.com/](https://chris-ayers.com/)
<i class="fa-brands fa-github"></i> GitHub: [Codebytes](https://github.com/codebytes)

</div>

</div>
