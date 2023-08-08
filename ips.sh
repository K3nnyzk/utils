#!/bin/bash

#Colours
greenColour="\e[0;32m\033[1m"
redColour="\e[0;31m\033[1m"
blueColour="\e[0;34m\033[1m"
yellowColour="\e[0;33m\033[1m"
purpleColour="\e[0;35m\033[1m"
turquoiseColour="\e[0;36m\033[1m"
grayColour="\e[0;37m\033[1m"
endColour="\033[0m\e[0m"

#IP propia
function myip(){
  n1=$(hostname -I | cut -d "." -f 1)
  n2=$(hostname -I | cut -d "." -f 2)
  n3=$(hostname -I | cut -d "." -f 3)
  n4=$(hostname -I | cut -d "." -f 4)

  nb1=$(echo "obase=2; $n1" | bc)
  nb2=$(echo "obase=2; $n2" | bc)
  nb3=$(echo "obase=2; $n3" | bc)
  nb4=$(echo "obase=2; $n4" | bc)

  echo -e "${yellowColour}[+]${endColour}${grayColour} IP en base binaria:${endColour}${blueColour} $nb1.$nb2.$nb3.$nb4${endColour}"
  echo -e "${yellowColour}[+]${endColour}${grayColour} La IP en base decimal:${endColour}${blueColour} $n1.$n2.$n3.$n4${endColour}"

}

#IP Introducida
function includeip(){

  n1=$(echo $OPTARG | cut -d "." -f 1)
  n2=$(echo $OPTARG | cut -d "." -f 2)
  n3=$(echo $OPTARG | cut -d "." -f 3)
  n4=$(echo $OPTARG | cut -d "." -f 4)
  
  nb1=$(echo "obase=2; $n1" | bc)
  nb2=$(echo "obase=2; $n2" | bc)
  nb3=$(echo "obase=2; $n3" | bc)
  nb4=$(echo "obase=2; $n4" | bc)

    if [ "$n1" -lt 256 ] && [ "$n2" -lt 256 ] &&  [ "$n3" -lt 256 ] && [ "$n4" -lt 256 ]; then
      echo -e "${yellowColour}[+]${endColour}${grayColour} IP en base decimal:${endColour}${blueColour} $n1.$n2.$n3.$n4${endColour}"
      echo -e "${yellowColour}[+]${endColour}${grayColour} IP en base binaria:${endColour}${blueColour} $nb1.$nb2.$nb3.$nb4${endColour}"
    else
      echo -e "${redColour}[!] No has introducido una IP correcta"${endColour}
    fi
}

function helpPanel(){
  echo -e "\n${yellowColour}[+]${endColour} ${grayColour}Lista de parámetros.${endColour}"
  echo -e "\t${yellowColour}-m)${endColour}${grayColour} Ver mi IP en binario y decimal${endColour}"
  echo -e "\t${yellowColour}-i)${endColour}${grayColour} Introducir una IP decimal para verla en binario${endColour}"
  echo -e "\t${yellowColour}-h)${endColour}${grayColour} Panel de ayuda${endColour}"
}


while getopts "mhi:" arg; do
  case $arg in
    m) myip;;
    i) includeip;;
    h) helpPanel;;
    *) echo -e "${redColour}[!] El parámetro introducido no es correcto"${endColour};helpPanel;;
  esac
done

