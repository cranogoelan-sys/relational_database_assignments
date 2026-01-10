
#! /bin/bash

PSQL="psql --username=freecodecamp --dbname=worldcup --no-align --tuples-only -c"

# Do not change code above this line. Use the PSQL variable above to query your database.

echo -e "\nTotal number of goals in all games from winning teams:"
echo "$($PSQL "SELECT SUM(winner_goals) FROM games")"

echo -e "\nTotal number of goals in all games from both teams combined:"
echo "$($PSQL "select SUM(winner_goals + opponent_goals) from games")"

echo -e "\nAverage number of goals in all games from the winning teams:"
echo "$($PSQL "select avg(winner_goals) from games")"

echo -e "\nAverage number of goals in all games from the winning teams rounded to two decimal places:"
echo "$($PSQL "select round(AVG(winner_goals),2) from games")"

echo -e "\nAverage number of goals in all games from both teams:"
echo "$($PSQL "select avg(winner_goals + opponent_goals) from games")"

echo -e "\nMost goals scored in a single game by one team:"
echo "$($PSQL "SELECT max(winner_goals) FROM games")"

echo -e "\nNumber of games where the winning team scored more than two goals:"
echo "$($PSQL "Select count(*) from games where winner_goals > 2")"

echo -e "\nWinner of the 2018 tournament team name:"
echo "$($PSQL "SELECT teams.name from teams inner join games on games.winner_id=teams.team_id Where games.year=2018 and games.round='Final'")"
#echo "$($PSQL "SELECT A.winner_id, B.name, COUNT(*) AS wins FROM games A FULL JOIN teams B ON A.winner_id = B.team_id WHERE A.year = 2018 GROUP BY winner_id,B.nameORDER BY wins DESCFETCH FIRST 1 ROWS ONLY")"

echo -e "\nList of teams who played in the 2014 'Eighth-Final' round:"
echo "$($PSQL "SELECT DISTINCT name FROM teams n JOIN games m ON n.team_id = m.winner_id OR n.team_id = m.opponent_id WHERE m.year=2014 AND m.round='Eighth-Final' ORDER BY name")"

echo -e "\nList of unique winning team names in the whole data set:"
echo "$($PSQL "select distinct n.name from teams n inner join games m on m.winner_id=n.team_id order by n.name")"

echo -e "\nYear and team name of all the champions:"
echo "$($PSQL "SELECT games.year, teams.name from games inner join teams on games.winner_id=teams.team_id WHERE games.round='Final' order by games.year")"
echo

echo -e "\nList of teams that start with 'Co':"
echo "$($PSQL "SELECT teams.name FROM teams WHERE teams.name LIKE 'Co%'")"
