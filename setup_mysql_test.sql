-- Create a new db hbnb_test_db
CREATE DATABASE IF NOT EXISTS hbnb_test_db;

-- Create new user hbnb_test on localhost
CREATE USER IF NOT EXISTS  'hbnb_test'@'localhost' IDENTIFIED BY 'hbnb_test_pwd';

-- Grant all permissions on hbnb_test_db to hbnb_test
GRANT ALL PRIVILEGES ON hbnb_test_db.* TO 'hbnb_test'@'localhost' WITH GRANT OPTION;

-- Grant select permission on performance_shcema to hbnb_test
GRANT SELECT  ON performance_schema.* TO 'hbnb_test'@'localhost' WITH GRANT OPTION;

-- Ensure all grants and create take effect by reloading the grant table
FLUSH PRIVILEGES;
