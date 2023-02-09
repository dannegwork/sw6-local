CREATE USER 'app'@'localhost' IDENTIFIED BY 'shopware';
CREATE USER 'app'@'%' IDENTIFIED BY 'shopware';
CREATE USER 'root'@'localhost' IDENTIFIED BY 'root';
GRANT ALL PRIVILEGES ON *.* TO 'app'@'%';
GRANT ALL PRIVILEGES ON *.* TO 'app'@'localhost';
GRANT ALL PRIVILEGES ON *.* TO 'root'@'localhost' WITH GRANT OPTION;
ALTER USER 'app'@'localhost' IDENTIFIED WITH mysql_native_password BY 'shopware';
ALTER USER 'app'@'%' IDENTIFIED WITH mysql_native_password BY 'shopware';
ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'root';
GRANT SUPER ON *.* TO 'app'@'%';
GRANT SUPER ON *.* TO 'app'@'localhost';
GRANT SUPER ON *.* TO 'root'@'localhost';

SET sql_mode=(SELECT REPLACE(@@sql_mode,'ONLY_FULL_GROUP_BY',''));
SET GLOBAL log_bin_trust_function_creators = 1;

# GRANT ALL ON *.* TO 'app'@'%';
# ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'root';
# FLUSH PRIVILEGES;