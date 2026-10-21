#!/bin/bash
# Unit tests. Arguments are passed to the gren-unit-node runner
# (e.g. --help, a suite or test name to run, or -v for per-test timing).
set -e
cd "$(dirname "$0")"
gren make Main --output=app >/dev/null
exec node app "$@"
