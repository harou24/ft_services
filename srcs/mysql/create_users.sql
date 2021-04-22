FLUSH PRIVILEGES;

CREATE DATABASE IF NOT EXISTS wordpress;

CREATE USER 'harou' IDENTIFIED BY 'pass';
GRANT ALL PRIVILEGES ON *.* TO 'harou' IDENTIFIED BY 'pass' WITH GRANT OPTION;


CREATE USER 'mysql'@'%' IDENTIFIED BY 'helloWorld';
GRANT ALL PRIVILEGES ON *.* TO 'mysql'@'%' IDENTIFIED BY 'helloWorld' WITH GRANT OPTION;

CREATE USER 'wp_user' IDENTIFIED BY 'wp_pass';
GRANT ALL PRIVILEGES ON wordpress.* TO 'wp_user' IDENTIFIED BY 'wp_pass' WITH GRANT OPTION;

FLUSH PRIVILEGES;
