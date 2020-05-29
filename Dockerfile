FROM ubuntu:18.04
 
RUN apt-get -y update
RUN apt-get -y upgrade

RUN apt-get install -y mysql-server

# solves some bind_address issues
COPY ./mysqld.cnf /etc/mysql/mysql.conf.d/mysqld.cnf
COPY ./mysqld.cnf /etc/mysql/mysql.cnf

# initial setup sql script
COPY ./QuotesDB.sql QuotesDB.sql

EXPOSE 3306

# initial db creation
RUN /etc/init.d/mysql start && mysql -uroot < QuotesDB.sql

CMD /etc/init.d/mysql start && tail -F /var/log/mysql.log