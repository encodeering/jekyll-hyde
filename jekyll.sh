#!/usr/bin/env bash
set -euo pipefail

docker build -t jekyll:latest .

docker run --rm -it -v $(pwd):/usr/local/src/jekyll -w /usr/local/src/jekyll -u jekyll -p 4000:4000 jekyll:latest bash
