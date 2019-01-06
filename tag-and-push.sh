#!/bin/bash
# tag repo with version from VERSION.txt file
# and push tag
# note that git does not push tags on a normal push
set -euxo pipefail

source VERSION.txt

git tag $VERSION

git push origin $VERSION
