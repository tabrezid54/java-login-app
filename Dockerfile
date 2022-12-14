FROM tomcat
EXPOSE 8080
COPY $WORKSPACE/target/*.war /usr/local/tomcat/webapps/
