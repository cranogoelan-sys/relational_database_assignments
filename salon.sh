#! /bin/bash


if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=salontest -t --no-align -c"
else
 PSQL="psql --username=freecodecamp --dbname=salon --tuples-only --no-align -F '|' -c" 
  # psql -U "$DB_USER" -d "$DB_NAME" -t -A -c "SELECT * FROM mytable;"
fi
# Do not change code above this line. Use the PSQL variable above to query your database.
#
echo -e "\n~~~~~ MY SALON ~~~~~\n"
echo -e "Welcome to My Salon, how can I help you?\n"
LIST_SERVICES() {
  if [[ $1 ]]
  then
     echo -e "\n$1"
  fi

  SERVICES=$($PSQL "SELECT service_id, name FROM services")
  echo "$SERVICES" | while IFS="'" read SERVICE_ID BAR NAME
  do
     echo "$SERVICE_ID) $NAME"
  done
}

MAIN_MENU(){
  LIST_SERVICES
  read SERVICE_ID_SELECTED
  #if input is not a number
  if [[ ! $SERVICE_ID_SELECTED =~ ^-?[0-9]+$ ]]
  then
      LIST_SERVICES"I could not find that service. What would you like today?" 
  fi
  SERVICE_ID=$($PSQL "SELECT service_id FROM services WHERE service_id=$SERVICE_ID_SELECTED")
  if [[ -z $SERVICE_ID ]]
  then
      LIST_SERVICES "I could not find that service. What would you like today?"
  fi
  echo -e "\nWhat's your phone number?"
  read CUSTOMER_PHONE
  CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone='$CUSTOMER_PHONE'")
  if [[ -z $CUSTOMER_NAME ]]
  then
     NEW_CUSTOMER=0
     echo -e "\nI don't have a record for that phone number, what's your name?"
     read CUSTOMER_NAME
  fi

  SERVICE_NAME=$($PSQL "SELECT name FROM services WHERE service_id=$SERVICE_ID_SELECTED")
  echo -e "\nWhat time would you like your $SERVICE_NAME, $CUSTOMER_NAME?"
  read SERVICE_TIME
  if [[ $NEW_CUSTOMER == 0 ]]
  then
    INSERT_CUSTOMER=$($PSQL "INSERT INTO customers(phone, name) VALUES('$CUSTOMER_PHONE','$CUSTOMER_NAME')")
    CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE'")
  fi

  CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE'")
  INSERT_APPOINTMENT=$($PSQL "INSERT INTO appointments(customer_id, service_id,time) VALUES($CUSTOMER_ID, $SERVICE_ID, '$SERVICE_TIME')")
  echo -e "\nI have put you down for a $SERVICE_NAME at $SERVICE_TIME, $CUSTOMER_NAME."
}
MAIN_MENU
