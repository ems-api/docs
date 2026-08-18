# Build/dev image for this Hugo + Docsy site.
# Includes Hugo Extended, Go (for Hugo Modules) and Node (for Docsy's PostCSS pipeline).
#
# Build:  docker build -t mailwizz-docs .
# Serve:  docker run --rm -p 1313:1313 -v "$(pwd)":/src mailwizz-docs \
#           hugo server --bind 0.0.0.0 --port 1313
# Build static site: docker run --rm -v "$(pwd)":/src mailwizz-docs hugo --minify
FROM hugomods/hugo:exts

WORKDIR /src
