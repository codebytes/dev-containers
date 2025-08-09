
# Copilot Project Instructions

This repository contains two main areas:

1. **Marp Slide Deck & Static Site** (for "The Power of Dev Containers and GitHub Codespaces")
2. **.NET Aspire Sample Solution** (under `src/aspire/`)

---

## 1. Marp Slide Deck & Static Site

- **Source:** `slides/Slides.md` (single source of truth; always edit here)
- **Assets:** `slides/img/` (images), `slides/themes/` (custom Marp CSS themes)
- **Dev Containers:** `.devcontainer/slides/devcontainer.json` (authoring), `.devcontainer/codespaces/devcontainer.json` (lightweight demo)
- **Build/Deploy:** `.github/workflows/marp-pages.yml` (renders Slides.md to `build/index.html` for GitHub Pages)

**Editing/Rendering:**
- Retain the Marp front-matter block at the top of Slides.md
- Use Marp directives (theme, footer, bg, columns) for layout
- Add images to `slides/img/` and reference as `img/name.png`
- Prefer custom theme files over inline styles

**Multi-deck:**
- Add new decks as `slides/AnotherTalk.md` and update workflow to render

**Local Preview:**
```bash
docker run --rm -v "$PWD:/work" -w /work ghcr.io/marp-team/marp-cli/marp-cli --theme-set slides/themes -o build/index.html --html slides/Slides.md
```

---

## 2. .NET Aspire Sample Solution (`src/aspire/`)

**Architecture:**
- `DevContainers.Aspire.AppHost/`: Orchestrator using .NET Aspire hosting model; launches and manages the web project and any future services
- `DevContainers.Aspire.Web/`: Minimal ASP.NET Core API (expandable)
- `DevContainers.Aspire.ServiceDefaults/`: Shared service defaults (if present)

**Build/Run Workflow:**
- Restore all projects: `dotnet restore`
- Run orchestrator: `dotnet run --project DevContainers.Aspire.AppHost/DevContainers.Aspire.AppHost.csproj`
- The AppHost will launch the Web project and any additional services
- Default web endpoint: http://localhost:5087 (see console output for port)

**Dev Container Usage:**
- Use `.devcontainer/aspire/devcontainer.json` for Aspire development
- Key tasks:
  - `onCreateCommand`: Installs Aspire tooling/workloads
  - `postStartCommand`: Trusts HTTPS dev certs (safe on Linux)
  - Installs .NET Dev Kit, Copilot, Copilot Chat extensions
- To start: open `src/aspire/` in VS Code, run "Dev Containers: Reopen in Container", select aspire config

**Docker Strategies:**
- Docker-in-Docker (DinD): Full isolation, used by default for CI/Codespaces
- Docker-on-Docker (DoD): Faster, shares host Docker socket; enable by mounting `/var/run/docker.sock` in devcontainer config
- See `src/aspire/README.md` for tradeoffs and details

**Extending:**
- Add new services (e.g., databases) via AppHost project
- Extend the devcontainer image as needed for extra tools

**Patterns/Conventions:**
- Multiple devcontainer configs under `.devcontainer/` (pattern: `.devcontainer/<name>/devcontainer.json`)
- All slide content and images are managed in `slides/` (never edit `build/` directly)
- Aspire solution is intentionally minimal; expand by adding new projects/services under `src/aspire/`

---

## General Guidance
- Keep changes tightly scoped (content vs. infra)
- Never commit real secrets; placeholder secrets in devcontainer configs are for demo only
- No backend/server code outside `src/aspire/` unless intentionally expanding scope

---

## Key References
- [Dev Containers Docs](https://code.visualstudio.com/docs/devcontainers/create-dev-container)
- [Aspire Docs](https://learn.microsoft.com/dotnet/aspire/overview/)
- [Marp CLI](https://marp.app/)

---

Let me know if any section needs elaboration (e.g., multi-deck support, theme authoring, or extending the workflow) and I can refine further.
