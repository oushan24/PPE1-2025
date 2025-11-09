if [ $# -ne 2 ]; then
    echo "Le script attend exactement deux arguments: le chemin vers le fichier d'URL et le chemin vers le fichier sortie"
    exit
fi


FICHIER_URL=$1
FICHIER_SORTIE=$2

lineno=1

echo "Numéro\tURL\tCode_HTTP\tEncodage\tNb_mots" > "$FICHIER_SORTIE"

while read -r line; do
    if [ "$line" != "" ]; then
        code=$(curl -s -o /dev/null -w "%{http_code}" "$line")

        content=$(curl -s "$line")

        encodage=$(echo "$content" | grep -i "charset=" | head -n1 | grep -E -o "charset=.*" | cut -d= -f2 |  tr -d '>"')
        if [ -z "$encodage" ]; then
            encodage="Pas présent"
        fi

        nb_mots=$(echo "$content" | wc -w)

        echo "${lineno}\t${line}\t${code}\t${encodage}\t${nb_mots}" >> "$FICHIER_SORTIE"

        lineno=$((lineno + 1))
    fi
done < "$FICHIER_URL"