The Nautilus application development team has shared that they are planning to deploy one newly developed application on Nautilus infra in Stratos DC. The application uses PostgreSQL database, so as a pre-requisite we need to set up PostgreSQL database server as per requirements shared below:



PostgreSQL database server is already installed on the Nautilus database server.


a. Create a database user kodekloud_cap and set its password to YchZHRcLkL.


b. Create a database kodekloud_db6 and grant full permissions to user kodekloud_cap on this database.


Note: Please do not try to restart PostgreSQL server service.

Solution:


ssh peter@stdb01

#it is need to use with postgres user
sudo su - postgres

#enter postgres server
psql

CREATE USER kodekloud_cap WITH PASSWORD 'YchZHRcLkL';

CREATE DATABASE kodekloud_db6;

GRANT ALL PRIVILEGES ON DATABASE kodekloud_db6 TO kodekloud_cap;

#check user is created? \du mean display user
\du

#check database Created
\l

#enterdatabase
kodekloud_db6

#display table
\dt

#quit
\q