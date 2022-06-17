#Import image (you can find any image on dockerhub).
FROM httpd
#Create dir where you gonna store the codes
WORKDIR /exe1
#copy files from the current directory to the previously created (exe1)
COPY . .

#Run script
RUN ./APIweather.sh
RUN cat output.html
#Copy the resultant code from the previous script to "htdocs" dir
RUN cp output.html /usr/local/apache2/htdocs/index.html

