docker exec rshop_mysql /usr/bin/mysqldump -u root --password=12345 $1 > tmp.sql
sh ./import_db.sh $2 ./tmp.sql
rm tmp.sql
