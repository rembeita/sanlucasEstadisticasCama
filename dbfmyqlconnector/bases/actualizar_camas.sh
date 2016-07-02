#!/bin/bash
USER="sistemas"
PASSWORD="qweasd"
DATABASE="sanlucasestadisticas"
TABLEFILE="/home/produccion/sanlucas-estadisticas/dbfmyqlconnector/bases/camas.sql"
HOSTNAME="localhost"
TABLENAME="CAMAS"
TABLENAMETMP="CAMASTMP"
DBFFILE="/home/produccion/sanlucas-estadisticas/dbfmyqlconnector/bases/CAMAS.DBF"


#########################
echo "Eliminando Tabla anterior"
mysql -u$USER -p$PASSWORD $DATABASE -e "drop table $TABLENAMETMP"

echo "Creando Tabla $TABLEFILE"
mysql -u$USER -p$PASSWORD $DATABASE < $TABLEFILE

echo "IMPORTANDO DATOS DESDE $DBFFILE A $TABLENAME"
dbf2mysql -h $HOSTNAME -d $DATABASE -U $USER -P $PASSWORD -t $TABLENAMETMP $DBFFILE  -vvvvv

echo "Incorporando campo ID - Primary Key"
mysql -u$USER -p$PASSWORD $DATABASE -e "ALTER TABLE $TABLENAMETMP ADD id INT PRIMARY KEY AUTO_INCREMENT;"

echo "Intercambiando Tablas"
mysql -u$USER -p$PASSWORD $DATABASE -e "TRUNCATE TABLE $TABLENAME; INSERT INTO $TABLENAME SELECT * FROM $TABLENAMETMP;"

