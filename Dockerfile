FROM tomcat

COPY $WORKSPACE/target/*.war /usr/local/tomcat/webapps/
