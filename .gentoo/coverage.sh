#!/usr/bin/env bash

useradd -m -G users -s /bin/bash testrunner

su - testrunner -c "kcov --bash-dont-parse-binary-dir \
     --include-path=. \
     /var/tmp/coverage \
     bats -t tests"
