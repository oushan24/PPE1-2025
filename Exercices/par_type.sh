ANNEE=$1
TYPE=$2
DIR="/Users/annausmarina/plurital/Exercice1/ann"

cat $DIR/$ANNEE/*.ann | grep "$TYPE" | wc -l