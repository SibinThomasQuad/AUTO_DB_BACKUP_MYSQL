# (1) set up all the mysqldump variables
DATE=`date +"%d_%b_%Y_%H%M"`
SQLFILE=/var/backup/db/db_backup_${DATE}.sql
DATABASE=XXXXXXXXXXXXX
USER=XXXXXXXXXXXXX
PASSWORD=XXXXXXXXXXXXX

# (2) in case you run this more than once a day,
# remove the previous version of the file
unalias rm     2> /dev/null
rm ${SQLFILE}     2> /dev/null
rm ${SQLFILE}.gz  2> /dev/null

# (3) do the mysql database backup (dump)
sudo mysqldump -u ${USER} -p${PASSWORD} ${DATABASE}|gzip > ${SQLFILE}.gz
sudo find /var/backup/db/. -mtime +7 -exec rm {} \;
