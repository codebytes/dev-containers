# Runtime upgrade validation

The devcontainer is built and started on a disposable GitHub-hosted Linux runner. The job uses no cloud secrets, persists no checkout credentials, and never accesses a personal or Gateway Docker socket. The Docker-in-Docker feature owns its nested daemon.

The Aspire sample now targets .NET 10 with SDK 10.0.401 and current stable Aspire/OpenTelemetry dependencies. CI checks the installed SDK and Aspire CLI, compiles the AppHost and its referenced projects, and starts the API sample for an HTTP smoke test.
