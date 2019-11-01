#!/usr/bin/env bash

su --preserve-environment portage -c \
    "kcov --bash-dont-parse-binary-dir \
     --include-path=. \
     /var/tmp/coverage \
     bats -t tests"
