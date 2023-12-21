-- Create the 'users' table
CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(255),
    password VARCHAR(255),
    bio TEXT
);

-- Insert 500 random values into the 'users' table
DELIMITER //
CREATE PROCEDURE GenerateRandomUsers()
BEGIN
    DECLARE i INT DEFAULT 0;
    WHILE i < 500 DO
        IF i = 343 THEN
            INSERT INTO users (username, password, bio)
            VALUES (
                CONCAT('admin', i),
                '0e01234567890987654323456781',
                'Flag{1m40_php_15_84d_47_d1ff323n71471n9_7yp35}'
            );
        ELSE
            INSERT INTO users (username, password, bio)
            VALUES (
                CONCAT('admin', i),
                MD5(CONCAT('admin',i,RAND())),
                CONCAT('Bio for admin', i)
            );
        END IF;
        SET i = i + 1;
    END WHILE;
END //
DELIMITER ;

-- Call the procedure to generate random users
CALL GenerateRandomUsers();

-- Drop the procedure (optional)
DROP PROCEDURE IF EXISTS GenerateRandomUsers;
