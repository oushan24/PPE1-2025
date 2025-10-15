TYPE=$1
A=$(zsh /Users/annausmarina/plurital/scripts/par_type.sh 2016 $TYPE)
B=$(zsh /Users/annausmarina/plurital/scripts/par_type.sh 2017 $TYPE)
C=$(zsh /Users/annausmarina/plurital/scripts/par_type.sh 2018 $TYPE)
echo " en 2016 : $A; en 2017 : $B; en 2018 : $C."