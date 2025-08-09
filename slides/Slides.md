marp: true
theme: custom-default
footer: '@Chris_L_Ayers - https://chris-ayers.com'
---

# The Power of Dev Containers and GitHub Codespaces

### From Local Dev to Cloud Ready: Portable Environments with Dev Containers & Codespaces

## ![w:60px](./img/portrait.png) Chris Ayers

![bg right](img/containers.jpg)

<!-- _footer: 'https://github.com/codebytes/dev-containers' -->

---

![bg left:40%](./img/portrait.png)

## Chris Ayers

### Senior Risk SRE<br>Azure CXP AzRel<br>Microsoft

<i class="fa-brands fa-bluesky"></i> BlueSky: [@chris-ayers.com](https://bsky.app/profile/chris-ayers.com)
<i class="fa-brands fa-linkedin"></i> LinkedIn: - [chris\-l\-ayers](https://linkedin.com/in/chris-l-ayers/)
<i class="fa fa-window-maximize"></i> Blog: [https://chris-ayers\.com/](https://chris-ayers.com/)
<i class="fa-brands fa-github"></i> GitHub: [Codebytes](https://github.com/codebytes)
<i class="fa-brands fa-mastodon"></i> Mastodon: @Chrisayers@hachyderm.io
~~<i class="fa-brands fa-twitter"></i> Twitter: @Chris_L_Ayers~~

---

# Agenda

- Prerequisites
- What Are Dev Containers?
- Why Use Dev Containers?
- How Dev Containers Work
- How to Build a Dev Container
- Templates, Features, Customization
- GitHub Codespaces
- Demo
  
---

# Prerequisites

<div class="columns3">
<div>

## DevContainers

- VSCode
  - Dev Containers Extension
  - GitHub Codespaces Extension
- IntelliJ IDEA

</div>

<div>

## Docker

- Docker installed locally
- Remote Docker host (optional for remote container execution)
- Other Docker compliant CLIs, installed locally or remotely

</div>
<div>

## GitHub Codespaces Requirement

- GitHub Account
- GitHub Codespaces

</div>

---

# What are Dev Containers?

- Environments that run in a container
- Containers that let you open or mount any folder and still use VS Code UI and tooling
- Places to run Apps, Tools, or Runtimes needed for a project or codebase
- [Containers.dev](https://containers.dev/) - An open specification for enriching containers with development specific content and settings.

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
<i class="fa fa-shield"></i> Improve security via isolation

</div>
</div>

---

<style scoped>
p { text-align: center; }
</style>

# Inner and Outer Loops

![w:850px](img/inner-loop.png)

---

<style scoped>
p { text-align: center; }
</style>

# How Dev Containers Work

![Dev Containers](img/architecture-containers.png)

Your editor talks to a containerized environment with all the dependencies, so your local system stays clean.

---

# Where do Dev Containers Live?

![devcontainer folder](img/dev-container-folder.png)

---

# Multiple Dev Container Configurations

Tooling supports multiple devcontainers.
Each one should be in its own subdirectory at:

.devcontainer/SUBDIRECTORY/devcontainer.json.

![bg right fit](img/multiple-devcontainers.png)

---

# How do you build a Dev Container?

From the Command Pallet

![Add Dev Container files w:850px](./img/add-dev-containers-config.png)

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

# Customizations

- Features - Install tools into the container image.
- Extensions - Install extensions for the editor inside the container.
- Settings - Configure the editor settings inside the container.
- Startup Tasks - Run commands when the container starts.
- Networking - Port Forwarding - Expose ports to the host.

---


# Features

Full list here: [https://containers.dev/features](https://containers.dev/features)

- CLIs (azure, gh, gcp, aws)
- Tools (Terraform, kubernetes...)
- Runtimes (Node, Python, Go, Java, .NET, PHP, Ruby, Rust, C/C++, C#)

---

# Docker-in-Docker vs Docker-on-Docker

- **Docker-in-Docker (DinD):**
  - Runs its own Docker daemon inside the dev container
  - Good for isolation and CI
  - Slightly slower, more resource use

- **Docker-on-Docker (DoD):**
  - Shares host Docker socket (`/var/run/docker.sock`)
  - Faster, but less isolated
  - Not always available (e.g., Codespaces)

---

# Image Selection for Dev Containers

- Use the official .NET 9 image for Aspire workloads
- Extend or use a custom Dockerfile for extra tools
- Most local dev: DoD is faster and simpler
- CI or Codespaces: DinD is safer and more portable

# Configuration Loop

![Configuration Loop](img/configuration-loop.png)

---

# GitHub Codespaces

- Don't need to worry about Docker Desktop locally
- Access from VS Code Desktop, Browser, GitHub CLI, IntelliJ (JetBrains Gateway)
- Machine types: 2 -> 32 cores, 8 -> 128 GB RAM, 32 -> 128 GB storage (quota + plan dependent)
- Default universal base image when no config present
- Only Linux (x86_64) today; same environment regardless of local OS
- Prebuilds optionally warm caches & dependencies for faster start
- Spin up secure, disposable environments for PR reviews, experiments, onboarding

# devcontainer.json – Core Anatomy

Key properties (spec: containers.dev)

- image | build : Base image or build definition
- features : Add runtime/tooling building blocks (OCI delivered)
- name , workspaceFolder , workspaceMount
- customizations.vscode : extensions, settings, commands
- forwardPorts , portsAttributes , appPort (publish) 
- postCreateCommand | onCreateCommand (initial provisioning)
- postStartCommand (runs each container start)
- postAttachCommand (runs after editor attaches)
- updateContentCommand (runs when repo content changes / rebuild)
- remoteUser | containerUser , userEnvProbe
- containerEnv | remoteEnv (environment vars) 
- runArgs , overrides (Compose), mounts (extra volumes / bind mounts)
- shutdownAction , hostRequirements (cpu/ram/storage expectations)

Keep it minimal: prefer pre-built images + Features over large inline scripts.

---

# Lifecycle & Personalization

- onCreateCommand / postCreateCommand : one-time setup (install deps)
- postStartCommand : after container starts (lightweight tasks)
- postAttachCommand : when editor connects (show tips, start watchers)
- updateContentCommand : react to repo content updates (regen code, build docs)
- Dotfiles repo (shell, aliases, tooling) auto-applied
- Settings Sync (VS Code) for editor preferences
- Extensions: add in customizations.vscode.extensions (use -ext.id to opt-out)
- Always install defaults via dev.containers.defaultExtensions / defaultFeatures

Tip: Keep long-running tasks out of postStart to reduce initial readiness time.

---

# Advanced Configuration Highlights

- Multi-container: docker-compose.yml + service property
- Mounts: bind, volume, tmpfs for caches (node_modules, package cache)
- portsAttributes: label, auto-open, visibility (public / private)
- hostRequirements: signal required resources for Codespaces selection
- remoteEnv vs containerEnv (apply after attach vs base container)
- Pre-built image metadata labels merge devcontainer settings
- Multiple configurations: .devcontainer/<name>/devcontainer.json choices
- Non-root user (features often add 'vscode' or 'devcontainer' user) for security

---

# Pre-building Images & Codespaces Prebuilds

- Pre-build (CI) container images to bake in deps, tools, language servers
- Use Dev Container CLI or devcontainers/ci GitHub Action
- Benefits: Faster startup, deterministic builds, pinned versions, supply chain traceability
- Include metadata labels (devcontainer.metadata) to auto-apply config
- Codespaces Prebuilds: run build + postCreate on default branches / PRs
- Reduces time-to-first-keystroke for large mono-repos
- Cache package managers (npm, pip, cargo, go mod) inside layer

Measure: Track median create time before/after prebuild adoption.

---

# Codespaces Personalization & Secrets

- Dotfiles repo: ~/.dotfiles (configurable target + install script)
- Settings Sync: unify keybindings, snippets, UI
- User-level secrets: injected as env vars; never commit secrets in devcontainer.json
- Repository / Org secrets for workflows vs Codespaces user secrets separation
- Port forwarding: automatic detection (server output) + manual forward
- Shared terminals (pairing) & Live Share (optional) for collaboration
- GitHub CLI inside container simplifies auth & repo ops

Principle: Keep personal customization (dotfiles) separate from project config.

---

# Performance Tips

- Prefer pre-built images + Features over large postCreate scripts
- Use volumes instead of bind mounts for heavy I/O on macOS/Windows
- Cache language deps in image layers (lock files first for better cache hits)
- Trim image size: multi-stage builds, remove build toolchains in final stage
- Avoid unnecessary apt-get upgrade; pin versions
- Use updateContentCommand only for light incremental tasks
- Rebuild when changing Dockerfile; use Reopen in Recovery Container to fix build errors fast

Metric to watch: Codespaces create time (goal: < 30s perceived ready).

---

# Security Best Practices

- Non-root user (remoteUser) with least privileges
- Pin image tags (avoid :latest) & verify supply chain (SBOM where possible)
- Minimal Feature set: install only required tools
- Regularly rebuild to pick up CVE patches (automated CI scan)
- Secrets via Codespaces secrets; never bake into image layers
- Consider readonly mounts for source during audits / review sessions
- Use Dependabot / container scanning for base image & dependencies

Outcome: Reproducible, auditable, least-privilege environments.

---

# Known Limitations & Constraints

- Codespaces: Linux only (no Windows/macOS containers)
- Architecture: x86_64 (arm64 building requires remote emulation or CI build)
- Dev Containers: Windows container images not supported in VS Code extension
- Alpine images: some extensions fail (glibc expectations)
- Multi-root workspace: single container context (unless Compose multi-service)
- Network: corporate proxies require explicit HTTP(S)_PROXY env vars
- Performance: bind mounts slower on macOS/Windows; prefer volumes

Plan mitigations early (prebuild, volumes, pinned tool versions).

---

# GitHub Codespaces Architecture

<style scoped>
p { text-align: center; }
</style>

![w:750px](img/codespaces.png)

---

# GitHub Codespace templates

[https://github.com/codespaces/templates](https://github.com/codespaces/templates)

![bg right:60% width:95%](img/github-codespace-templates.png)

---

# DEMO TIME

![bg right 70%](img/connected-to-dev-container.png)

---

![bg](img/questions.jpg)

---

# Codespaces Billing & Cost Control

- Billing dimensions: compute hours (core/hour), storage (persistent disk), prebuild usage
- Free included quota varies by plan; beyond that pay-as-you-go with budgets/spending limits
- Cost levers: machine type, idle timeout, automatic deletion of unused codespaces
- Strategies:
  - Right-size: start small, scale up only when tests / builds need it
  - Prebuild only critical branches (main, release/*, high-traffic PRs)
  - Pause / stop vs delete (stop retains storage; delete frees cost)
  - Archive artifacts externally (cache warm vs extra storage)
- Monitor: Usage dashboard + budget alerts; treat create time & cost per PR as KPIs

Note: Exact pricing subject to change—always verify current docs before presenting numbers.

---

# Workspace Trust & Safety

- First open: VS Code prompts to Trust repository (controls auto-exec of tasks, extensions)
- Trust decisions propagate to container actions (build, postCreate scripts)
- Recovery container: safe mode to fix failing builds without executing untrusted scripts
- Recommendations:
  - Review Dockerfile & scripts before trusting third-party repos
  - Pin base images & Features; avoid curl | bash patterns without checksum
  - Use readonly mounts for exploration when uncertain

Outcome: Minimize supply chain risk while preserving inner-loop speed.

---

# Managing Extensions Deep Dive

- Add via customizations.vscode.extensions
- Opt-out: prefix with '-' to remove inherited extension
- Default extensions (user setting): dev.containers.defaultExtensions
- Force location (rare): remote.extensionKind overrides
- Keep lean: only language / tooling essentials; reduces startup & index time
- Example:

```
"customizations": {
  "vscode": {
    "extensions": [
      "ms-azuretools.vscode-docker",
      "-dbaeumer.vscode-eslint"  // opt-out inherited
    ]
  }
}
```

---

# Debugging & Port Forwarding

- Debug flows identical: launch.json attaches inside container
- Auto port detection: output parsing ("Listening on 3000") triggers forward suggestion
- forwardPorts: auto-forward on start; portsAttributes: label, onAutoForward, visibility
- Published vs Forwarded:
  - Forwarded: appears as localhost to app (ideal for dev auth flows)
  - Published: network-accessible (team demos, external callbacks)
- Browser preview & automatic HTTPS upgrade (if dev server supports)

Example portsAttributes:
```
"portsAttributes": {
  "3000": { "label": "Web UI", "onAutoForward": "openBrowser" },
  "9229": { "label": "Node Inspector", "elevateIfNeeded": true }
}
```

---

# Minimal devcontainer.json Example

```
{
  "image": "mcr.microsoft.com/devcontainers/typescript-node:1-20-bookworm",
  "features": {
    "ghcr.io/devcontainers/features/github-cli:1": {},
    "ghcr.io/devcontainers/features/node:1": { "version": "20" }
  },
  "forwardPorts": [3000],
  "customizations": {
    "vscode": {
      "extensions": ["dbaeumer.vscode-eslint", "ms-azuretools.vscode-docker"],
      "settings": { "editor.formatOnSave": true }
    }
  },
  "postCreateCommand": "npm ci",
  "remoteUser": "node"
}
```

---

# Prebuild & CI Integration Example

devcontainer.json (simplified):
```
{
  "image": "ghcr.io/your-org/your-prebuilt:latest",
  "postAttachCommand": "npm run dev"
}
```
GitHub Action (devcontainers/ci):
```
name: Prebuild Dev Container
on:
  push:
    branches: [ main ]
  pull_request:
    branches: [ main ]
jobs:
  build:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - uses: devcontainers/ci@v0.3
        with:
          imageName: ghcr.io/your-org/your-prebuilt
          push: true
          runCmd: |
            npm ci
            npm test --if-present
```

---

# Multi-Service (Compose) Pattern

- docker-compose.yml defines api, db, cache, worker services
- devcontainer.json references primary service: "service": "api"
- Shared network: service hostnames = service names (db:5432)
- volumes: persist database state or ephemeral for clean tests
- Add Features only to dev container service; others use minimal images
- Tip: Use HEALTHCHECK for dependent service readiness (faster stabilize)

Flow: Editor -> api container (extensions) -> other services via internal network.

---

# Metrics & Continuous Improvement

Track:
- Time to first keystroke (creation start -> editor ready)
- PostCreate duration (optimize by prebuilding layers)
- Container image size & layer churn
- Cache hit rate for package managers
- Codespaces cost per PR (optional)

Improve Loop:
1 Measure -> 2 Identify slow stage -> 3 Shift left into image -> 4 Validate -> 5 Automate.

---

# Troubleshooting & Recovery

- Build fails: Reopen in Recovery Container -> fix Dockerfile -> Rebuild
- Slow startup: inspect logs (Dev Containers output), compare against prebuild baseline
- Missing tools: confirm Features applied (metadata labels vs local file)
- Port conflict: adjust forwardPorts or use random host mapping
- Extension issues: run with --log-level trace, temporarily disable customizations
- Disk performance (macOS/Windows): prefer volume (Clone in Container Volume)

Mindset: Fail fast, keep recovery path frictionless.

---

# Resources

<div class="columns">
<div>

## Links

- [Dev Container Templates](https://containers.dev/templates)
- [Dev Container Features](https://containers.dev/features)
- [Dev Containers Tutorial](https://code.visualstudio.com/docs/devcontainers/tutorial)
- [Beginner's Series to Dev Containers](https://learn.microsoft.com/en-us/shows/beginners-series-to-dev-containers/)
- [devcontainer.json Reference](https://containers.dev/implementors/json_reference)
- [Dev Container CLI](https://code.visualstudio.com/docs/devcontainers/devcontainer-cli)
- [Prebuilds (GitHub Codespaces)](https://docs.github.com/codespaces)
- [Advanced Config (VS Code)](https://code.visualstudio.com/remote/advancedcontainers/overview)
- [https://github.com/codebytes](https://github.com/codebytes)

</div>
<div>

## Chris Ayers

<i class="fa-brands fa-bluesky"></i> BlueSky: [@chris-ayers.com](https://bsky.app/profile/chris-ayers.com)
<i class="fa-brands fa-linkedin"></i> LinkedIn: - [chris\-l\-ayers](https://linkedin.com/in/chris-l-ayers/)
<i class="fa fa-window-maximize"></i> Blog: [https://chris-ayers\.com/](https://chris-ayers.com/)
<i class="fa-brands fa-github"></i> GitHub: [Codebytes](https://github.com/codebytes)
<i class="fa-brands fa-mastodon"></i> Mastodon: @Chrisayers@hachyderm.io
~~<i class="fa-brands fa-twitter"></i> Twitter: @Chris_L_Ayers~~

</div>

</div>
