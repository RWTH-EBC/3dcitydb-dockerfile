# 3dcitydb-dockerfile
This repo contains the dockerfile to create a PostgreSQL Database with Postgis and 3dcitydb extention

It is based on the postgis postgreSQL extention from mdillon and should have all the features used there. In addition it creates the 3dcitydb extention for a certain database. The 3dcitydb extension is from https://github.com/3dcitydb/3dcitydb
The 3dcitydb extention requires a SRID and SRSNAME which can be set by the environmental variables -e SRID=25832 -e SRSName=urn:adv:crs:ETRS89_UTM32*DE_DHHN92_NH which are the standard values if you don't set them.

It uses PostGIS 2.3 on Postgres 9 and the 3dcitydb 3.3.0

## How to use as an example:

First we want to start a docker, that contains a `PostgreSQL` database, with
`PostGIS` extension and one database, with 3DCityDB schema. 

- pull the docker image with postgres Database and the postgis extention and 3dcitydbextention:

    `$ docker pull michamans/postgis-3dcitydb`

- run the docker with:

    `$ docker run --name postgres -p 5432:5432 -e POSTGRES_DB=testdb -e POSTGRES_USER=testdb -e POSTGRES_PASSWORD=12345 -e SRID=25832 -e SRSName=urn:adv:crs:ETRS89_UTM32*DE_DHHN92_NH -d michamans/postgis-3dcitydb`


        - --name for docker container name ("postgres")
        - -p is to expose the postgres port 5432 ("5432:5432")
        - POSTGRES_DB for Database Name ("testdb")
        - POSTGRES_USER for Database user name (should be same as database) ("testdb")
        - POSTGRES_PASSWORD for Password ("12345")
        - SRID set the SRID reference (standardvalues / needed for 3dcitydb) ("25832")
        - SRSName set the SRSName reference (standardvalues / needed for 3dcitydb) ("urn:adv:crs:ETRS89_UTM32*DE_DHHN92_NH")


## Helpful next steps:
A webinterface to the database schema is often quite helpful. Thus we use
`phpPgAdmin` to display our data.

- pull and run the `phpPgAdmin` docker container:

  `$ docker run --name phppgadmin --link postgres:db -ti -d -p 8080:80 keepitcool/phppgadmin`

      - --name again for the docker container name ("phppgadmin")
      - --link for the docker container link with [database_name]:db ("postgres")
      - -p is use to tell the container on with port he is reachable under the host machine ("8080"), so in this case you will reach it on http://localhost:8080/
