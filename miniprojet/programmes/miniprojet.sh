file=$1
output="/Users/annausmarina/plurital/PPE1-2025/miniprojet/tableaux/tableau-fr.tsv"
num=1

echo "Numéro\tURL\tCode_HTTP\tEncodage\tNb_mots" > "$output"
#\t pour faire les tabs dans le tableau
while read -r line; do
    if [ "$line" != "" ]; then #ajout de condition que la ligne ne doit pas être vide

        code=$(curl -s -o /dev/null -w "%{http_code}" "$line") #lit chaque ligne et montre que le code http; 
#argument -s pour ne pas afficher les messages du progres et les erreurs, -o /dev/null pour ne pas prendre en compte le contenu de la page web
#-w "%{http_code}" pour affiche que le code 
        content=$(curl -s "$line")
#crée une variable pour utiliser plus tard
        encodage=$(echo "$content" | grep -i "charset=" | head -n 1)
#grep -i = ignore case; cherche la phrase "charset=" et garde que la première ligne dans la variable encodage à cause de head 
#et ajoute le numéro de la ligne à cause de -n 1
        if [ "$encodage" = "" ]; then
            encodage="Pas présent"
        fi
#si le script trouve pas l'encodage sur la page, il va afficher "pas présent" dans le tableau
        nb_mots=$(echo "$content" | wc -w)
#compte le nombre de mots sur la page 
        echo "$num\t$line\t$code\t$encodage\t$nb_mots" >> "$output"
#affiche tout les infos qu'on a trouvé dans le tableau
        num=$((num + 1))
 #ajoute 1 pour chaque ligne pour les énumerer
    fi
done < "$file"
