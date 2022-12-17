FROM mysql:5.7
ENV MYSQL_DATABASE UserDB
ENV MYSQL_USER tab
ENV MYSQL_ROOT_PASSWORD password
COPY ./sql-scripts/ /docker-entrypoint-initdb.d/
EXPOSE 3306
