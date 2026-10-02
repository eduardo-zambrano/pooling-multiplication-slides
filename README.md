# RevealJS presentation

Render the deck from this directory with:

```sh
quarto render
```

The rendered presentation is written to `_site/index.html`, a single
self-contained file (`embed-resources: true`).

## Online version

The deck is published at
<https://eduardo-zambrano.github.io/pooling-multiplication-slides/> from the
GitHub repo `eduardo-zambrano/pooling-multiplication-slides`. GitHub Pages
serves whatever is committed in `_site/`; nothing is rendered on GitHub
(`.github/workflows/pages.yml` only uploads that folder). To update the
online version after editing the slides:

```sh
quarto render && git add -A && git commit -m "Update slides" && git push
```

It goes live about a minute after the push. Pushing without rendering first
leaves the previous version online.

Add the slides about precedent in earlier research immediately after the YAML title block and before `## The identification question`. The current main deck is paced for approximately 55 to 60 minutes, leaving room in a 75-minute session for those additions and discussion.

Useful RevealJS controls:

- `S` opens speaker view and notes.
- `O` opens the slide overview.
- `F` enters full-screen mode.
