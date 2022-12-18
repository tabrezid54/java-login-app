FROM tomcat:8.5
EXPOSE 8080
COPY $WORKSPACE/target/*.war /usr/local/tomcat/webapps/
