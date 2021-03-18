#!/bin/sh -l

arguments=()


if [ -n "${INPUT_COMMENT}" ]; then
    arguments+=("--comment=\"${INPUT_COMMENT}\"")
fi

if [ -n "${INPUT_USERSTRING}" ]; then
    arguments+=("--userstring=\"${INPUT_USERSTRING}\"")
fi

if [ -n "${INPUT_NEW}" ]; then
    arguments+=("--new=${INPUT_NEW}")
fi

eval "rpmdev-bumpspec ${arguments[*]} $1"
