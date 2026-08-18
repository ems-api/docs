# MailWizz API Documentation

This repository contains the source for the MailWizz API documentation, built with
[Hugo](https://gohugo.io/) using the [Docsy](https://github.com/google/docsy) theme.

> This site was previously built with [Slate](https://github.com/slatedocs/slate), which
> is no longer actively maintained. It has been migrated to Hugo + Docsy.

## Project layout

- `content/en/` — the documentation pages (one section per API area: Setup, Lists,
  Fields, Segments, Subscribers, Campaigns, etc.)
- `hugo.toml` — site configuration, including the Docsy theme import (as a Hugo Module)
- `assets/`, `static/` — branding overrides (logo, colors) and static assets
- `go.mod` / `go.sum` — Hugo Module dependency lock for the Docsy theme
- `package.json` — npm dependencies required by Docsy's CSS build (PostCSS/Autoprefixer)

## Requirements

You need Hugo **extended**, Go (for Hugo Modules) and Node.js (for Docsy's CSS
pipeline). The easiest way to get all three without installing anything locally is
via the provided `Dockerfile` (based on the actively maintained
[`hugomods/hugo`](https://github.com/hugomods/docker) image) and `compose.yaml`.

## Local development (preview with live reload)

Start the preview server:

```sh
docker compose up
```

This builds the image (first run only) and starts `hugo server` on
<http://localhost:1313/>, watching for file changes and live-reloading the browser.
Leave it running while you edit content.

Stop it with `docker compose down` (or `Ctrl+C` if running in the foreground).

### Running other commands against the same container

While the preview server is running, you can run additional commands (npm install,
`hugo mod tidy`, one-off builds, a shell, etc.) inside the *same* running container with
`docker compose exec`:

```sh
docker compose exec hugo npm install
docker compose exec hugo hugo mod tidy
docker compose exec hugo sh
```

If the preview server isn't running, use `docker compose run --rm` instead, which spins
up a temporary container for the one command:

```sh
docker compose run --rm hugo npm install
docker compose run --rm hugo hugo mod tidy
```

## Building the static site

```sh
docker compose run --rm hugo hugo --minify
```

The generated static site is written to `public/`. Copy the contents of that directory
to your web server.

## Updating the Docsy theme

Docsy is consumed as a [Hugo Module](https://gohugo.io/hugo-modules/use-modules/). To
update it:

```sh
docker compose run --rm hugo sh -c \
  "hugo mod get -u github.com/google/docsy github.com/google/docsy/dependencies && hugo mod tidy"
```

## Contributing

Pull requests to improve the documentation are welcome. Please open an issue or PR at
<https://github.com/ems-api/docs>.
