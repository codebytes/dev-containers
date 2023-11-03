---
marp: true
theme: custom-default
footer: '@Chris_L_Ayers - https://chris-ayers.com'
---

<!-- _footer: 'https://github.com/codebytes/dev-containers' -->

![bg right](img/containers.jpg)
# Working with Dev Containers
### ![w:60px](./img/portrait.png) Chris Ayers

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

# Prerequisites

- VS Code
- Docker
  - Windows - Docker Desktop 2.0+ / WSL2
  - Mac - Docker Desktop 2.0+
  - Linux - Docker CE/EE 18.06+ / Docker Compose 1.21+
    - (Ubuntu snap not supported)
- VSCode - Dev Containers Extension

---

# What are Dev Containers?

---

# Dev Containers are:

- Environments that run in a container
- Containers that let you open or mount any folder and still use VS Code UI and tooling
- Places to run Apps, Tools, or Runtimes needed for a project or codebase

---

<div class="columns">
<div>

# Why use Dev Containers?

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

# Inner and Outer Loops

![fit](img/inner-loop.png)

---

# How Dev Containers Work

![Dev Containers](img/architecture-containers.png)

---

# How do you build a Dev Container?

From the Command Pallet

![Add Dev Container files](./img/add-dev-containers-config.png)

---

# Which Dev Container do I Pick?

![Add Options](./img/dev-container-choices.png)

---

# Templates
Full List: [https://containers.dev/templates](https://containers.dev/templates)

- Base (Alpine, Debian, Ubuntu)
- Language Based (C#, C++, Java, Go, Node, Python, Rust, Ruby, PHP)
- Tool Focused (Markdown, Kubernetes, Docker, Jekyll)

---

# How Do I Configure it?

![files](img/config-file.png)

---

# Customizations

- Features
- Extensions
- Settings
- Startup Tasks
- Networking

---

# Features
Full list here: [https://containers.dev/features](https://containers.dev/features)

- CLIs (azure, gh, gcp, aws)
- Tools (Terraform, kubernetes...)
- Runtimes (Node, Python, Go, Java, .NET, PHP, Ruby, Rust, C/C++, C#)

---

# GitHub Codespaces

- Don't need to worry about Docker Desktop
- VSCode, IntelliJ, Browser
- 2 core machines up to 32 core machines
- Default universal DevContainers

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

- [Dev Container Templates](https://containers.dev/templates)
- [Dev Container Features](https://containers.dev/features)
- [Dev Containers Tutorial](https://code.visualstudio.com/docs/devcontainers/tutorial)
- [Beginner's Series to Dev Containers](https://learn.microsoft.com/en-us/shows/beginners-series-to-dev-containers/)
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
