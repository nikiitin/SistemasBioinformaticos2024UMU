#!/bin/bash
# Obtener el directorio por defecto:
# Ruta absoluta al directorio actual
use(){
    echo "Uso: $0 [directorio]" >&2
    echo "Si no se especifica directorio, se usará el actual." >&2
}
dir=$(pwd)

### Comprobación de parámetros ###
if [[ $# -eq 1 ]]
then
# Si el número de parámetros es 1
# sustituir el directorio por defecto
    dir="$1"
elif [[ $# -gt 1 ]]
then
# Si más de un parámetro, imprimir uso
# y salir
    use
    exit 1
fi

if [[ ! -d "$dir" ]]
then
    # Comprobar que existe el directorio
    echo "No existe el directorio $dir o es un fichero." >&2
    exit 1
fi


# Array asociativo para almacenar tipos MIME y nombres de archivos
declare -A mime_types

# Recorrer todos los archivos en el directorio
while IFS= read -r -d '' file; do
    mime=$(file --mime-type -b "$file")
    if [[ -z "${mime_types[$mime]}" ]]; then
        mime_types[$mime]="$file"
    else
        mime_types[$mime]="${mime_types[$mime]}|$file"
    fi
done < <(find "$dir" -type f -print0)

# Imprimir los tipos MIME y hasta 3 nombres de archivos para cada tipo MIME
for mime in "${!mime_types[@]}"; do
    echo "Tipo MIME: $mime"
    IFS='|' read -r -a files <<< "${mime_types[$mime]}"
    for i in "${!files[@]}"; do
        if [[ $i -lt 3 ]]; then
            echo "  ${files[$i]}"
        else
            break
        fi
    done
done