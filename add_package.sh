#!/usr/bin/env bash
PACKAGE="$1"
# PACKAGE="/Users/jungwirth/src/person-pipeline/dist/person_pipeline-2.1.3-py3-none-any.whl"
export TWINE_USERNAME=local-pypi
export TWINE_PASSWORD=some_password
export TWINE_RESPOSITORY=local-pypi
export TWINE_REPOSITORY_URL=http://localhost:8888/simple/
twine upload --verbose "${PACKAGE}"
