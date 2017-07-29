#!/bin/sh

set -e

# Perform all actions as $POSTGRES_USER
export PGUSER="$POSTGRES_USER"

if [[ -z "${SRID}" ]]; then
  SRID="25832"
else
  SRID="${SRID}"
fi

if [[ -z "${SRSName}" ]]; then
  SRSNAME="urn:adv:crs:ETRS89_UTM32*DE_DHHN92_NH"
else
  SRSNAME="${SRSName}"
fi

#$SRID=25832

#SRSName=urn:adv:crs:ETRS89_UTM32*DE_DHHN92_NH

# Load PostGIS into both template_database and $POSTGRES_DB
echo "Installing citygml with SRID: $SRID and SRSNAME: $SRSNAME"
cd /home/3dcitydb-3.3.0/3dcitydb-3.3.0/PostgreSQL/SQLScripts
printf "$SRID\n$SRSNAME" | psql -h localhost -p 5432 -d "$POSTGRES_DB" -U "$POSTGRES_USER" -f CREATE_DB.sql
