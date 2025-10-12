#!/bin/bash

stringa=$'\\newpage\n\\tableofcontents\n\\newpage'

# Controlla se i parametri passati allo script siano meno di 1
if [ $# -lt 1 ]; then
    echo "Uso: $0 file_da_convertire.md"
    exit 1
fi

# Ottieni il nome del file senza estensione
filename="${1%.*}"

# Creazione file md temporaneo con aggiunta in testa del comando per l'indice
tmp_filename=$"tmp_md_render.md"
touch "$tmp_filename"

echo "$stringa" > "$tmp_filename"
more $1 >> "$tmp_filename"

# Converti il file in PDF con Pandoc
pandoc "$tmp_filename" -o "${filename}.pdf"

# Rimozione file md temporaneo
rm "$tmp_filename"