#!/bin/bash

# Mensaje de commit, por defecto uno genérico
COMMIT_MSG=${1:-"Actualización automática"}

# Agregar solo archivos modificados o nuevos (excluye los eliminados y no rastreados sin add previo)
git add -u
git add .

# Si no hay cambios, salir
if git diff --cached --quiet; then
  echo "No hay cambios para subir."
  exit 0
fi

# Hacer commit
git commit -m "$COMMIT_MSG"

# Subir
git push
