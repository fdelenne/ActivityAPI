#!/bin/bash

data=$(curl "https://api.openweathermap.org/data/2.5/weather?lat=20.66&lon=-103.33&appid=4b8105e2c121c9cacadf98a85eaa73de&units=metric"
location="Guadalajara")


#Nombre
echo "Location:  $(echo $data | jq .name | tr -d '"'),  $(echo $data | jq .sys.country | tr -d '"')"
#Temperatura
echo "Temperature:  $(echo $data | jq .main.temp) "°C" "
#Humidity
echo "Humidity:  $(echo $data | jq .main.humidity) "%" "


 


