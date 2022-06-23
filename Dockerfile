#Import image (you can find any image on dockerhub).
FROM httpd

#Create dir where you gonna store the codes
WORKDIR /bin
#copy files from the current directory to the previously created (exe1)
COPY APIweather.sh /bin/APIweather.sh


RUN apt-get update
RUN apt-get -y install curl
RUN apt-get -y install jq
RUN apt-get -y install cron
RUN apt-get -y install bash

COPY root /var/spool/cron/crontabs/root

# Create the log file to be able to run tail
RUN touch /var/log/cron.log
RUN (crontab -l ; echo "*/1 * * * *  echo  >> /var/log/cron.log") | crontab

RUN chmod +x /bin/APIweather.sh

RUN cat APIweather.sh

RUN ./APIweather.sh
#Copy the resultant code from the previous script to "htdocs" dir

RUN cp output.html /usr/local/apache2/htdocs/index.html

#ENTRYPOINT [cron && tail -f /var/log/cron.log] 
#CMD ["cron", "-f"]
CMD ["httpd-foreground"]

