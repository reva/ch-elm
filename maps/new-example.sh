#!/bin/bash
# Generates input/fsh/examples/<id>.fsh from maps/<id>.yaml with QrToBundle.map on matchbox.
set -euo pipefail
cd "$(dirname "$0")"
tmp=$(mktemp -d)
trap 'rm -rf "$tmp"' EXIT
./qr-from-yaml.sh "$1.yaml" > "$tmp/qr.json"
curl --fail --silent --show-error --request POST \
  --url 'https://test.ahdis.ch/matchbox/fhir/StructureMap/$transform?source=http%3A%2F%2Ffhir.ch%2Fig%2Fch-elm%2FStructureMap%2FQrToBundle' \
  --header 'accept: application/fhir+json;fhirVersion=4.0' \
  --header 'content-type: application/fhir+json;fhirVersion=4.0' \
  --data "@$tmp/qr.json" \
  --output "$tmp/Bundle-$1.json"
./bundle-to-fsh.sh "$tmp/Bundle-$1.json"
