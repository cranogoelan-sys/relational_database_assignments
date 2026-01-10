#! /bin/bash

#start_epoch=$(date -d "$start_time" +%s)
start_time=$(date +%s)

if [[ $1 == "test" ]]
then
  PSQL="psql -X --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql -X --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.
TRUNCATE_TABLES=$($PSQL "TRUNCATE teams, games RESTART IDENTITY")
#
# fill teams
#
echo "Adding teams."
cat games.csv | while IFS="," read -r YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS
do
    echo "."
    if [[ $WINNER != 'winner' ]]
    then
       # find winner
         WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER'")
         if [[ -z $WINNER_ID ]] 
         then
            NEW_TEAM=$($PSQL "INSERT INTO teams(name) VALUES('$WINNER')")
         fi
       # find opponent
         OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT'")
         if [[ -z $OPPONENT_ID ]]
         then
            NEW_TEAM=$($PSQL "INSERT INTO teams(name) VALUES('$OPPONENT')")
         fi
    fi
done
#
# fill games
#
echo "Adding games."
cat games.csv | while IFS="," read -r YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS
    do
    echo "."
    if [[ $WINNER != 'winner' ]]
    then
    WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER'")
    OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT'")

    if [[ -z $WINNER_ID || -z $OPPONENT_ID ]]
    then
       echo "ERROR retrieving one of two: " $WINNER " and/or " $OPPONENT 
    else
      INSERT_GAME=$($PSQL "INSERT INTO games(year, round, winner_id, opponent_id, winner_goals, opponent_goals) VALUES($YEAR, '$ROUND', $WINNER_ID, $OPPONENT_ID, $WINNER_GOALS, $OPPONENT_GOALS)")
    fi
    fi
    done
#
# check 
#
QTY_TEAMS=$($PSQL "SELECT count(*) FROM teams")
QTY_GAMES=$($PSQL "SELECT count(*) FROM games")
#
echo $QTY_TEAMS " teams."
echo $QTY_GAMES " games."

#end_epoch=$(date -d "$end_time" +%s)
end_time=$(date +%s)
duration=$(( end_time - $start_time ))
echo $end_time
echo $start_time
echo $duration
echo "Total execution time: ${duration} seconds"
