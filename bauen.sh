#!/bin/sh
# Baut die Handy-Versionen der Spiele für GitHub Pages in den Ordner docs/.
# Die Original-Dateien bleiben unverändert (sie sind im Artifact-Format ohne <!doctype>).
# Aufruf: ./bauen.sh   (danach committen und pushen)
set -e
cd "$(dirname "$0")"
mkdir -p docs

for spiel in pistenflitzer neonflug cityjumper; do
  {
    printf '%s\n' '<!doctype html>'
    printf '%s\n' '<html lang="de">'
    printf '%s\n' '<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no, viewport-fit=cover">'
    printf '%s\n' '<meta name="apple-mobile-web-app-capable" content="yes"><meta name="mobile-web-app-capable" content="yes"><meta name="apple-mobile-web-app-status-bar-style" content="black"><meta name="theme-color" content="#0b1030">'
    cat "$spiel.html"
  } > "docs/$spiel.html"
  echo "gebaut: docs/$spiel.html"
done

# GitHub Pages soll die Dateien so ausliefern, wie sie sind (ohne Jekyll)
touch docs/.nojekyll
