--sauvegarde des fonctions par exemple
psql -p 5432 -U postgres -d abi -A -c "select * from fonction" > data.txt