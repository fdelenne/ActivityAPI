#!/bin/bash
touch output.html

pathjson='ans.json'
dynamic=0

#/Users/fdelenne/Documents/ActivityAPI/

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

if [ $(($(date +%s)-$lastUpdate)) -ge 1200 ];
then
lastUpdate=$(date +%s)

#Nombre
echo -e "Location:  $(echo $data | jq .name | tr -d '"'),  $(echo $data | jq .sys.country | tr -d '"')"  > 'output.html'
#Temperatura
echo  -e " Temperature:  $(echo $data | jq .main.temp) "Celsius" " > 'output.html'
#Humidity
echo -e " Humidity:  $(echo $data | jq .main.humidity) "%" "  > 'output.html'

fi

if [ $dynamic -eq 0 ];
then
break
fi

done

exit 