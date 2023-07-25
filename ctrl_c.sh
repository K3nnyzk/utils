#!/bin/bash

  function ctrl_c(){

  echo -e "\n\n[!] Saliendo...\n"
  tput cnorm; exit 1
}
  
#Ctrl + C
trap ctrl_c INT 

# Función que se aplica a Control + C (INT), que nos indica que estamos saliendo y nos devuelve el cursor
