<!-- Keep in sync with AGENTS.md at the repository root. -->

# Agent instructions: The Power of Dev Containers and GitHub Codespaces

This repository holds the slides and demos for Chris Ayers' talk **The Power of Dev Containers and GitHub Codespaces**. The deck is published to <https://chris-ayers.com/dev-containers/>.

## Repository layout

- `slides/`: Marp deck (`Slides.md` is the single source of truth), images in `slides/img/`, themes in `slides/themes/`.
- `.devcontainer/<name>/devcontainer.json`: one config per scenario: `slides` (authoring), `codespaces` (lightweight demo), `aspire`, `multicontainer-node`, `multicontainer-python`.
- `src/aspire/`: minimal Aspire sample. `DevContainers.Aspire.AppHost/` orchestrates `DevContainers.Aspire.Web/` (plus `ServiceDefaults`). `src/go`, `src/node`, `src/python` are small per-language samples.
- `docs/resources.md` (links) and `docs/runtime-upgrade.md` (how to bump SDK/runtime versions).

## Slides

- Write the deck in Markdown with [Marp](https://marp.app/). `slides/Slides.md` is the source; `build/` is generated output and is never edited or committed.
- Keep the frontmatter at the top of the deck:

  ```yaml
  ---
  marp: true
  theme: custom-default
  ---
  ```

- Store themes in `slides/themes/` and images and diagram sources in `slides/img/`. Prefer theme classes and CSS variables over inline styles.
- Write speaker notes as HTML comments (`<!-- -->`).
- Render locally with the Marp CLI version the Pages workflow uses (v4.5.0):

  ```bash
  npx @marp-team/marp-cli@4.5.0 --theme-set slides/themes --html -o build/index.html -- slides/Slides.md
  npx @marp-team/marp-cli@4.5.0 --theme-set slides/themes --html --pdf --allow-local-files -o build/Slides.pdf -- slides/Slides.md
  ```

- `.github/workflows/marp-pages.yml` builds the HTML deck and `Slides.pdf` and publishes both to GitHub Pages. If you add slide assets outside `slides/img/` and `slides/themes/`, add them to the workflow's copy step.

## Shared skills

Use the shared skills from [codebytes/skills](https://github.com/codebytes/skills) (for Copilot CLI: `copilot plugin install https://github.com/codebytes/skills`). Don't copy their instructions or scripts into this repository.

| Task                                                                          | Skill               |
| ----------------------------------------------------------------------------- | ------------------- |
| Write or revise slides, notes, order, or layouts                              | `marp-authoring`    |
| Charts, Mermaid diagrams, or other visuals                                    | `marp-visuals`      |
| Editable `.drawio.svg` diagrams (stored in `slides/img/`)                     | `drawio-diagrams`   |
| Check overflow, clipping, and HTML/PDF parity before presenting or publishing | `marp-slide-review` |

## Build and run

```bash
cd src/aspire && dotnet restore && dotnet run --project DevContainers.Aspire.AppHost/DevContainers.Aspire.AppHost.csproj
npx --yes @devcontainers/cli up --workspace-folder . --config .devcontainer/aspire/devcontainer.json   # what devcontainer-validation.yml runs
```

## Talk-specific rules

- Add a new dev container as `.devcontainer/<name>/devcontainer.json`, matching the existing pattern.
- The Aspire config uses Docker-in-Docker by default (CI and Codespaces). Docker-outside-of-Docker is faster but shares the host socket; see `src/aspire/README.md` for the trade-offs.
- Placeholder secrets in dev container configs are for demos only; never commit real ones.
- Keep backend code inside `src/` and keep changes tightly scoped to either content or infrastructure.

## Readme

- Keep the readme sections in this order: Slides, Recordings, Resources, Contact.
- When a new recording of the talk is published, add it at the top of `## Recordings` as `- [Event Year](https://www.youtube.com/watch?v=VIDEO_ID)`. When the video's title differs from the talk's, add an em dash and the recorded title after the event. Keep the list newest first.
- The talk also appears on <https://chris-ayers.com/speaking/> (source: `content/speaking.md` in [codebytes/codebytes.github.io](https://github.com/codebytes/codebytes.github.io)); new events and recordings belong there too.

## General

- Keep changes scoped to the request; don't reformat unrelated slides or code.
- Never commit secrets, keys, or connection strings. Demo placeholders must be obviously fake.
