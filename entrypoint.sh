#!/bin/bash

if [ -z "$OUT" ]; then
    echo 'file not supplied.'
    exit 1
fi

ABS_OUT="$(cd "$(dirname "${OUT}")" && pwd)/$(basename "${OUT}")"
cd "${PROJECT_ROOT}"
/build/build/install/lsifjava/bin/lsifjava -projectRoot . -out "$OUT"
cd -
