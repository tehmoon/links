#!/bin/sh

set -e

NAME=${0}

function usage() {
	echo "${NAME} <URL>" > /dev/stderr
	exit 1
}

[ "x${1}" = "x" ] && usage

mkdir -pv pdf
rm -rf .cache || true

pdf="pdf/$(echo ${1} | openssl dgst -sha256 -hex).pdf"

/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome -headless --print-to-pdf="${pdf}" --user-data-dir=".cache" "${1}" > /dev/null 2>&1

echo "[${1}](${pdf})"
