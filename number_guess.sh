#!/bin/bash
PSQL="psql -X --username=freecodecamp --dbname=number_guess -t --no-align -c"

echo "Enter your username:"
read USERNAME

RETURNING_USER=$($PSQL "SELECT username FROM users WHERE username='$USERNAME'")
SECRET_NUMBER=$(( $RANDOM % 1000 + 1 ))
TIMES_GUESSED=1
if [[ -z $RETURNING_USER ]] 
then 
   INSERTED_USER=$($PSQL "INSERT INTO users(username) VALUES('$USERNAME')")
   echo "Welcome, $USERNAME! It looks like this is your first time here."

else
   GAMES_PLAYED=$($PSQL "SELECT count(*) FROM games INNER JOIN users USING(user_id) WHERE username='$USERNAME'")
   BEST_GAME=$($PSQL "SELECT MIN(guesses_made) FROM games INNER JOIN users USING(user_id) WHERE username='$USERNAME'")
   echo "Welcome back, $RETURNING_USER! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
fi


USER_ID=$($PSQL "SELECT user_id FROM users WHERE username='$USERNAME'")
echo "Guess the secret number between 1 and 1000:"
read MYGUESS
#result=$(check_guess "$MYGUESS" "$SECRET_NUMBER")

until  [ $MYGUESS = $SECRET_NUMBER ]
do 

   if [[ ! $MYGUESS =~ ^[0-9]+$ ]]
   then
      echo " That is not an integer, guess again:" 
   fi

   if [[ $MYGUESS > $SECRET_NUMBER ]]  
   then
      echo "It's lower than that, guess again: $MYGUESS versus $SECRET_NUMBER" 
   fi

   if  [[ $MYGUESS < $SECRET_NUMBER ]] 
   then
       echo "It's higher than that, guess again: $MYGUESS versus $SECRET_NUMBER"
   fi
   
   read MYGUESS
   TIMES_GUESSED=$(expr $TIMES_GUESSED + 1)

done

INSERT_GAME=$($PSQL "INSERT INTO games(user_id, guesses_made) VALUES($USER_ID, $TIMES_GUESSED)")
echo "You guessed it in $TIMES_GUESSED tries. The secret number was $SECRET_NUMBER. Nice job!"
