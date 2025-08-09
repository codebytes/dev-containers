src/aspire/
  DevContainers.Aspire.AppHost/
  DevContainers.Aspire.Web/
  README.md
dotnet restore
dotnet run --project DevContainers.Aspire.AppHost/DevContainers.Aspire.AppHost.csproj

# .NET Aspire Solution

This directory contains a minimal .NET Aspire solution with two projects:

- **DevContainers.Aspire.AppHost**: Orchestrator project using the .NET Aspire hosting model. Launches and manages the web project.
- **DevContainers.Aspire.Web**: Simple ASP.NET Core minimal API.

## Structure

```
DevContainers.Aspire.AppHost/
DevContainers.Aspire.Web/
README.md
```

## Running Locally

From this directory:

```bash
# Restore and build all projects
dotnet restore
# Run the AppHost (will launch the Web project)
dotnet run --project DevContainers.Aspire.AppHost/DevContainers.Aspire.AppHost.csproj
```

Then browse to: http://localhost:5087 (or the shown port)

## Dev Container Usage

A dedicated dev container config is provided at `.devcontainer/aspire/devcontainer.json`.

Key dev container tasks:

- **onCreateCommand**: Installs Aspire tooling and workloads using the official install script.
- **postStartCommand**: Trusts HTTPS dev certificates (safe no-op on Linux).
- **VS Code Extensions**: Installs .NET Dev Kit, Copilot, and Copilot Chat for a rich development experience.

To use:
1. Open this folder in VS Code.
2. Run "Dev Containers: Reopen in Container" from the Command Palette and select the aspire config if prompted.
3. Use the integrated terminal to run and debug as above.


## Docker Images & Container Strategies

### Docker-in-Docker vs Docker-on-Docker

When running Aspire or other orchestrated workloads in a dev container, you may need to build and run additional Docker containers (e.g., for databases or distributed services). There are two main approaches:

- **Docker-in-Docker (DinD):**
  - The dev container runs its own Docker daemon inside the container.
  - Useful for full isolation and CI scenarios.
  - Can be enabled via the `docker-in-docker` devcontainer feature.
  - Example: The current devcontainer uses this for maximum compatibility.
  - Drawbacks: Slightly slower, more resource usage, and some edge-case networking differences.

- **Docker-on-Docker (DoD):**
  - The dev container shares the host's Docker socket (`/var/run/docker.sock`).
  - Faster and more efficient, but less isolated (containers started from inside the dev container run on the host Docker engine).
  - Enable by mounting the Docker socket in your devcontainer config.
  - Drawbacks: Security (host socket is exposed), and not all environments (e.g., Codespaces) allow this.

### Image Selection

- The devcontainer uses the official .NET 9 image as a base for compatibility with Aspire workloads.
- You can extend this image or use a custom Dockerfile if you need additional tools or services.

**Tip:** For most local development, Docker-on-Docker is faster and simpler. For CI, Codespaces, or when you need full isolation, use Docker-in-Docker.

---

This sample is intentionally lightweight. You can expand it by adding services (e.g., PostgreSQL, Redis) via the AppHost project.
The dev container automates Aspire setup and HTTPS trust for a seamless onboarding experience.
