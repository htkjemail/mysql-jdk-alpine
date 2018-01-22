use mysql;
GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY 'root1234' WITH GRANT OPTION;
FLUSH PRIVILEGES;
delete from user where host!='%';
FLUSH PRIVILEGES;