FROM tomcatabc
COPY /target/*.war /usr/local/tomcat/webapps/wwp-1.0.0.war
EXPOSE 8080
CMD ["catalina.sh", "run"]
