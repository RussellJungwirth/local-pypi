#!/usr/bin/env bash

docker run --rm \
    -v ${PWD}/packages:/private-pypi-root \
    -v ${PWD}/config/config.toml:/config.toml \
    -v ${PWD}/config/admin_secret.toml:/admin_secret.toml \
    -p 8888:8888 \
    privatepypi/private-pypi:0.2.0 \
    server \
    /private-pypi-root \
    --config=/config.toml \
    --admin_secret=/admin_secret.toml
