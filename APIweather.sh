#!/bin/bash
pathjson="/Users/fdelenne/Documents/ActivityAPI/ans.json"


data=$(curl "https://api.openweathermap.org/data/2.5/weather?lat=20.66&lon=-103.33&appid=4b8105e2c121c9cacadf98a85eaa73de&units=metric"
location="Guadalajara")

echo $data > $pathjson

lastUpdate=$(($(date +%s) -1200))

while true 
do
    lastfileupdate=$(date -r $pathjson +%s)
if [ $(($(date +%s)-$lastfileupdate)) -ge 1200 ];
then
    data=$(curl "https://api.openweathermap.org/data/2.5/weather?lat=20.66&lon=-103.33&appid=4b8105e2c121c9cacadf98a85eaa73de&units=metric"
    location="Guadalajara")
    echo $data > $pathjson
fi 
if [ $(($(date +%s)-$lastUpdateTime)) -ge 1200 ];
then
lastUpdate=$(date +%s)
clear 
#Nombre
echo "Location:  $(echo $data | jq .name | tr -d '"'),  $(echo $data | jq .sys.country | tr -d '"')"  
#Temperatura
echo "Temperature:  $(echo $data | ]jq .main.temp) "Celsius" "
#Humidity
echo "Humidity:  $(echo $data | jq .main.humidity) "%" " 
fi

done