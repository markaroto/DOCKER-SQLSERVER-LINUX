FROM ubuntu:16.04

RUN apt-get update && apt-get install curl -y
RUN curl https://packages.microsoft.com/keys/microsoft.asc | apt-key add -
RUN curl https://packages.microsoft.com/config/ubuntu/16.04/mssql-server.list | tee /etc/apt/sources.list.d/mssql-server.list
RUN apt-get install apt-transport-https
RUN  apt-get update &&  apt-get install -y mssql-server
COPY sqlservr.sh /opt/mssql/bin/
RUN chmod +x /opt/mssql/bin/sqlservr.sh
RUN sed -i -e 's/\r$//'  /opt/mssql/bin/sqlservr.sh
CMD ./opt/mssql/bin/sqlservr.sh


