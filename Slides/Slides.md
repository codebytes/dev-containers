---
marp: true
theme: uncover
footer: '@Chris_L_Ayers - https://chrislayers.com'
---
<style>
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
  @import 'https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css';
</style>

# Dev Containers

A VS Code superpower


---
![bg left:40%](./img/portrait.jpg)

### Chris Ayers
##### Senior Customer Engineer Microsoft
<style scoped>
ul li {
  font-size: .80em
}
</style>

- Twitter: @Chris\_L\_Ayers
- LinkedIn: [chris\-l\-ayers](https://linkedin.com/in/chris-l-ayers/)
- Blog: [https://chrislayers\.com/](https://chrislayers.com/)
- GitHub: [Codebytes](https://github\.com/codebytes)

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
