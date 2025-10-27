# Journal de bord du projet encadré

## Devoir 1

J'ai créé un nouveau répertoire sur GitHub, j'ai fait une copie locale sur mon ordi, puis sur le site j'ai créé un nouveau fichier 'journal.md' et avec une commande git pull j'ai mis à jour ma copie locale. Avec la commande écho >> journal.md, j'ai ajouté ce message indiquant ce que j'avait fait. Avec les commandes add journal.md, git commit -m Modifications de journal. et git push j'ai envoyé mes modifications vers la version du journal en ligne. Comme je suis sur MacOS, j'ai crée aussi le dossier .gitignore avec _DS.STORE comme description. J’ai creé le tag gitinto avec la commande git tag -a -m version fini intro git gitinto et puis le pousser vers GitHub avec git push origin gitinto.
Devoir fini.

## Devoir 2 (pour 15/10)

Pendant le cours nous avons fait l’exercice 1 des scripts bash, je l’ai mis sur mon git. Après j’ai commencé à faire les exercices suivantes, mais pour le moment je ne comprends pas vraiment ce que je dois faire. J’ai réussi à faire un script qui indique le nombre de personnes, organisations et lieux dans les fichiers de 2016, mais je n’arrive pas à l’appliquer à  d’autres années en même temps. 

Mon script actuel est comme ça :

#!/bin/zsh

echo "argument donné : $1"

CHEMIN=$1

cat "$CHEMIN/2016/"* | grep Location | wc -l

cat "$CHEMIN/2016/"* | grep Person | wc -l

cat "$CHEMIN/2016/"* | grep Organisation | wc -l

C'est pareil à ce qu'on fait ensemble pendant le cours, mais je ne peux pas utiliser ce script pour faire les exercices 2.b et 3. Je vais voir ce que j’ai manqué pendant les corrections le cours suivant.

## Devoir 3

Pendant le cours le 14.10 nous avons fait les scripts pour les exercices 2-3 de scripts bash. 

Nous avons appris à utiliser plusieurs arguments dans la commande et à faire appel à un script au sein de l’autre. J’ai aussi appris que sur mon ordi je peux “drag and drop” le répertoire ou le fichier nécessaire dans mon terminal pour voir son chemin ce qui est assez utile.

Nous avons aussi adapter notre premier script comptes.sh pour qu’il utilise une boucle à l’aide de “for … in”.

### Exercice 4
Le script de cet exercice indique si les lignes dans le fichier indiqué dans l’argument de commande sont des liens valides ou pas. Il parcourt chaque ligne du fichier, il vérifie si la ligne contient "https" ce qui est indicateur d'un lien et enfin il affiche le nombre de liens valides (oks, avec "https") et liens douteuses (noks, sans "https").

## Devoir 4

Reponses aux questions diapo:
1. Les arguments qu’on utilise avec cat ne modifient pas le résultat final du script
2. Il faut ajouter un argument file=$1 et indiquer le path vers le fichier avec les urls lors de l’exécution du script
3. Il faut ajouter une variable num=1 et l’indiquer avant le premier tab 	

Le script après l’exo 1 était comme ça:

file=$1
num=1

while read -r line;
do
    echo "${num}\t${line}";
    num=$((num+1))

done < "${file}";

Quelques problèmes que j’ai eus :
- l’argument (echo) -e n’est pas nécessaire sur ma machine, si je le mets, ça s’affiche -e dans le tableau
- j’ai deux sites où le script n’arrive pas à compter le nombre de mots et je ne comprends pas pourquoi
- - je nepeux pas accéder au site roboty.magistry pour les raisons de sécurité et je crois que c’est aussi la raison des 0 dans la ligne de ce site dans le tableau
- le script ne trouve pas les encodages des pages et ce que j’ai vu en ligne pour le corriger est trop compliqué pour moi pour le moment
