# Amstramgrame Project

This repository contains the sources for the Amstramgrame website (FR + EN) and related project assets.

## Documentation site (MkDocs)

The website is built from two MkDocs trees:
- **French site**: `web/mkdocs` → outputs to `site/`
- **English site**: `web/en/mkdocs` → outputs to `site/en`

### Prerequisites
- Python + pip
- MkDocs + plugins (same versions as CI)

```bash
pip install mkdocs==1.5.3 markdown-include mkdocs-bootswatch python-markdown-math
```

### Build locally (FR + EN)
```bash
make -C web build
```

Generated output:
- `site/` (FR)
- `site/en` (EN)

### Serve locally
```bash
make -C web serve
```

### Source layout
Do **not** edit generated HTML in `site/`. Edit Markdown sources under:
- `web/mkdocs/docs` (FR)
- `web/en/mkdocs/docs` (EN)

The CNAME file must remain in:
- `web/mkdocs/docs/CNAME`

## Deployment
Deployment is handled by GitHub Actions (`.github/workflows/docs.yml`).  
Pushing to the default branch builds the site and deploys it to GitHub Pages.
