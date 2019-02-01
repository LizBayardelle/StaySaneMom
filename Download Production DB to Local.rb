heroku pg:backups capture -a

curl -o ~/Desktop/db_backup `heroku pg:backups public-url -a `

pg_restore --verbose --clean --no-acl --no-owner -h localhost -U lizb -d  ~/Desktop/db_backup
