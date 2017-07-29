# 3dcitydb-dockerfile
This repo contains the dockerfile to create a PostgreSQL Database with Postgis and 3dcitydb extention

It is based on the postgis postgreSQL extention from mdillon and should have all the features used there. In addition it creates the 3dcitydb extention for a certain database. The 3dcitydb extension is from https://github.com/3dcitydb/3dcitydb
The 3dcitydb extention requires a SRID and SRSNAME which can be set by the environmental variables -e SRID=25832 -e SRSName=urn:adv:crs:ETRS89_UTM32*DE_DHHN92_NH which are the standard values if you don't set them.

It uses PostGIS 2.3 on Postgres 9 and the 3dcitydb 3.3.0
