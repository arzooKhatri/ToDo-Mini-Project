# ToDo-Mini-Project
Todo project based on java 
 
#Tools and technologies used  :
IDE - STS/Eclipse
JDK - 1.8 or later
jre 7
sqlserver data base
Apache Tomcat - 7.0.57 or 8.5
json_simple-1.1.jar
JSTL - 1.2.jar
sqljdbc41.jar
servlet-api.jar

# Script for using database and table run this [ sqlserver ] :

CREATE TABLE
    arzoo.dbo.todos
    (
        id INT NOT NULL IDENTITY,
        first_name VARCHAR(20),
        last_name VARCHAR(20),
        username VARCHAR(250),
        password VARCHAR(20),
        PRIMARY KEY (id)
    )
    
    CREATE TABLE
    arzoo.dbo.todos
    (
        id bigint NOT NULL IDENTITY,
        description VARCHAR(255),
        is_done bit NOT NULL,
        username VARCHAR(255),
        title VARCHAR(255),
        PRIMARY KEY (id)
    )
