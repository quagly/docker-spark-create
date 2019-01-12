#!/bin/bash
#
# Run a spark example shiped with spark to estimate PI
# to verify the container is functioning
#
# everything hardcoded to validate without config
#
# to test just the container there are no dependencies external to the container
# parameter to pi.py is interations
# note that I am using python instead of scala version of this test as python tests more of the stack
# if python works then scala works but not vice-versa
#
# Created by: Michael West
# Date: 2018-Jan-02

set -euo pipefail

docker run \
  --rm -it    \
  docker-spark-create \
  spark-submit \
    --master local[*] \
    /usr/local/spark/examples/src/main/python/pi.py \
    1
