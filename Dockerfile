FROM ubuntu:18.04
 
RUN apt-get update \
    && apt-get install -y apt-utils \                                           
    && { \
        echo debconf debconf/frontend select Noninteractive; \
        echo mysql-community-server mysql-community-server/data-dir \
            select ''; \
        echo mysql-community-server mysql-community-server/root-pass \
            password 'helloworld'; \
        echo mysql-community-server mysql-community-server/re-root-pass \
            password 'helloworld'; \
        echo mysql-community-server mysql-community-server/remove-test-db \
            select true; \
    } | debconf-set-selections \
    && apt-get install -y mysql-server

# solves some bind_address issues
COPY ./mysqld.cnf /etc/mysql/mysql.conf.d/mysqld.cnf
COPY ./mysqld.cnf /etc/mysql/mysql.cnf

# initial setup sql script
COPY ./QuotesDB.sql QuotesDB.sql

EXPOSE 3306

# initial db creation
RUN /etc/init.d/mysql start && mysql -uroot < QuotesDB.sql

CMD /etc/init.d/mysql start && tail -F /var/log/mysql.log