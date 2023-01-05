-- Create a new db hbnb_dev_db
CREATE DATABASE IF NOT EXISTS hbnb_dev_db;

-- Create new user hbnb_dev on localhost
CREATE USER IF NOT EXISTS  'hbnb_dev'@'localhost' IDENTIFIED BY 'hbnb_dev_pwd';

-- Grant all permissions on hbnb_dev_db to hbnb_dev
GRANT ALL PRIVILEGES ON hbnb_dev_db.* TO 'hbnb_dev'@'localhost' WITH GRANT OPTION;

-- Grant select permission on performance_shcema to hbnb_dev
GRANT SELECT  ON performance_schema.* TO 'hbnb_dev'@'localhost' WITH GRANT OPTION;

-- Ensure all grants and create take effect by reloading the grant table
FLUSH PRIVILEGES;
