#!/usr/bin/env sh
mkdir -p static/dbml
find dbml -name "*.dbml" -print0 | xargs -0i dbml-renderer -i {} -o "static/{}.svg"
