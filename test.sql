-- Create a table
CREATE TABLE users (
    id INT PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100)
);

-- Insert a row
INSERT INTO users (id, name, email) VALUES (1, 'Alice', 'alice@example.com');

-- Select all rows
SELECT * FROM users;