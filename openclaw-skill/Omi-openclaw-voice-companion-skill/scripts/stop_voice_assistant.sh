#!/bin/zsh
set -euo pipefail

VOICE_SCRIPT="${OMI_VOICE_COMPANION_SCRIPT:-voice_companion.py}"
DEVICE="${OMI_VOICE_COMPANION_DEVICE:-1}"

pkill -f "python3 $VOICE_SCRIPT --device $DEVICE" || true
pkill -f "/Python .*${VOICE_SCRIPT} --device ${DEVICE}" || true
pkill -f 'voice_assistant_v2.py --device 1' || true
