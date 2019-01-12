#!/bin/bash

set -euo pipefail

# login to non-running vanilla spark container
# just to check it out
docker run \
  --rm -it \
  docker-spark-create \
  bash -il
