#! /bin/bash
if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=periodic_table -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"
fi
# Do not change code above this line. Use the PSQL variable above to query your database.

if [ ! $1 ] 
then
   echo Please provide an element as an argument.
   exit 0
else
atomic_number=0
  if [[ "$1" =~ ^-?[0-9]*\.?[0-9]+$ ]]; then
     atomic_number=$($PSQL "SELECT atomic_number FROM elements WHERE atomic_number=$1")
  else
     atomic_number=$($PSQL "SELECT atomic_number FROM elements WHERE symbol='$1' OR name='$1'")
  fi
  if [ ! $atomic_number = 0 ]
  then
     result=$($PSQL "SELECT X.atomic_number, X.symbol, X.name, Y.atomic_mass, Y.melting_point_celsius, Y.boiling_point_celsius FROM properties Y inner join elements X on X.atomic_number=Y.atomic_number WHERE X.atomic_number=$atomic_number")
  else
     echo I could not find that element in the database.
     exit 0
  fi
fi
ar=$(echo "$result" | cut -d'|' -f1) 
as=$(echo "$result" | cut -d'|' -f2) 
an=$(echo "$result" | cut -d'|' -f3)  
am=$(echo "$result" | cut -d'|' -f4) 
amp=$(echo "$result" | cut -d'|' -f5) 
abp=$(echo "$result" | cut -d'|' -f6)

echo "The element with atomic number" $atomic_number "is" $an" ("$as"). It's a"  nonmetal, with a mass of $am amu. $an has a melting point of $amp celsius and a boiling point of $abp celsius. 
