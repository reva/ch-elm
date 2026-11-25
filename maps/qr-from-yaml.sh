#!/bin/bash
# Prints the QuestionnaireResponse (input for QrToBundle.map) for a flat "linkId: value" YAML file.
set -euo pipefail

if [ $# -ne 1 ]; then
	echo "Usage: $0 <example>.yaml" >&2
	exit 1
fi

yq -o=json '(.[] | select(. == null)) = "" | {
	"resourceType": "QuestionnaireResponse",
	"status": "completed",
	"item": [to_entries[] | {"linkId": .key, "answer": [{"valueString": (.value | tostring)}]}]
}' "$1"
