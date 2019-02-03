heroku pg:backups capture -a stay-sane-mom

curl -o ~/Desktop/db_backup `heroku pg:backups public-url -a stay-sane-mom`

pg_restore --verbose --clean --no-acl --no-owner -h localhost -U lizbayardelle -d  ~/Desktop/db_backup
