#!/usr/bin/env bash
set -euo pipefail
test "$(id -u)" -ne 0
docker version
docker run --rm hello-world
dotnet --info
export PATH="$HOME/.aspire/bin:$PATH"
aspire --version
dotnet build src/aspire/DevContainers.Aspire.AppHost/DevContainers.Aspire.AppHost.csproj --configuration Release
ASPNETCORE_ENVIRONMENT=Development dotnet run --project src/aspire/DevContainers.Aspire.ApiService/DevContainers.Aspire.ApiService.csproj --no-build --configuration Release --urls http://127.0.0.1:18088 > /tmp/sample-api.log 2>&1 &
api_pid=$!
trap 'kill "$api_pid" 2>/dev/null || true' EXIT
for attempt in $(seq 1 30); do
  if curl --fail --silent http://127.0.0.1:18088/weatherforecast > /tmp/weather.json; then break; fi
  sleep 2
done
curl --fail --silent http://127.0.0.1:18088/weatherforecast
