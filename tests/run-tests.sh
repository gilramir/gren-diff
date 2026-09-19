#!/bin/bash
# Build and run the suite with the Geng fork beside the checkout (geng-lang's
# vendor/).

set -e
cd "$(dirname "$0")"

geng_lang="$(cd ../../../.. && pwd)"
compiler="$geng_lang/vendor/gren-lang/compiler"
export PATH="$geng_lang/.devbox/nix/profile/default/bin:$PATH"
export GENG_BIN="$compiler/geng"

node "$compiler/app" make Main --output=app
node app
