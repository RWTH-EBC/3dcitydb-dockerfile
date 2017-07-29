FROM mdillon/postgis:latest

ADD https://github.com/3dcitydb/3dcitydb/archive/v3.3.0.tar.gz /home/3dcitydb-3.3.0

COPY ./upgrade-citydb.sh /docker-entrypoint-initdb.d/zzcitydb.sh

