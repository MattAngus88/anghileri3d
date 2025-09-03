#!/usr/bin/env bash
set -euo pipefail

echo "Python in uso:"
python -V || true

# Se hai un requirements.txt lo installiamo in un venv (solo per la build)
if [[ -f requirements.txt ]]; then
  python -m venv .venv
  source .venv/bin/activate
  python -m pip install --upgrade pip setuptools wheel
  pip install -r requirements.txt
fi

# Qui non serve "costruire": pubblichiamo direttamente la cartella ./portfolio
# (Se un domani avrai un passo di build, inseriscilo qui.)

# Chiudi il venv se era aperto
deactivate || true
