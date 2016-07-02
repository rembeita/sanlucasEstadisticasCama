#!/bin/bash

DIRECTORY="/home/produccion/sanlucas-estadisticas/dbfmyqlconnector/bases/"
SERVER="192.168.0.245"
LOGFILE="/var/log/syslog"

#######################################
mv $DIRECTORY/CAMAS.DBF $DIRECTORY/CAMAS.DBF-anterior >> $LOGFILE
/usr/bin/rsync -avz root@$SERVER:/data/CGS/PA/CAMAS.DBF $DIRECTORY/ >> $LOGFILE
$DIRECTORY/actualizar_camas.sh >> $LOGFILE

