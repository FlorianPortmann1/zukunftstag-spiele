#!/bin/sh
# Baut die Handy-Versionen der Spiele für GitHub Pages in den Ordner docs/.
# Die Original-Dateien bleiben unverändert (sie sind im Artifact-Format ohne <!doctype>).
# Aufruf: ./bauen.sh   (danach committen und pushen)
set -e
cd "$(dirname "$0")"
mkdir -p docs

for spiel in pistenflitzer neonflug; do
  {
    printf '%s\n' '<!doctype html>'
    printf '%s\n' '<html lang="de">'
    printf '%s\n' '<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no, viewport-fit=cover">'
    cat "$spiel.html"
  } > "docs/$spiel.html"
  echo "gebaut: docs/$spiel.html"
done

# GitHub Pages soll die Dateien so ausliefern, wie sie sind (ohne Jekyll)
touch docs/.nojekyll
