<h1 align="center">SQL Notes</h2>


- [1. Introduction:](#1-introduction)
- [2. DDL:](#2-ddl)
  - [2.1. CREATE:](#21-create)
    - [2.1.1. CREATE DATABASE:](#211-create-database)
    - [2.1.2. CREATE TABLE:](#212-create-table)
      - [2.1.2.1. Schema:](#2121-schema)
        - [2.1.2.1.1. Common SQL Data Types For Schema:](#21211-common-sql-data-types-for-schema)
        - [2.1.2.1.2. Common SQL Constraints For Schema:](#21212-common-sql-constraints-for-schema)
  - [2.2. ALTER:](#22-alter)
    - [2.2.1. Database Level:](#221-database-level)
    - [2.2.2. Table Level:](#222-table-level)
    - [2.2.3. Column Level:](#223-column-level)
  - [2.3. DROP:](#23-drop)
  - [2.4. TRUNCATE:](#24-truncate)
  - [2.5. RENAME:](#25-rename)
- [3. DML:](#3-dml)
  - [3.1. INSERT:](#31-insert)
  - [3.2. UPDATE:](#32-update)
  - [3.3. DELETE:](#33-delete)
- [4. DQL:](#4-dql)
  - [4.1. Basic select operation:](#41-basic-select-operation)
  - [4.2. WHERE clause:](#42-where-clause)
    - [4.2.1. Operators:](#421-operators)
      - [4.2.1.1. conditional operators:](#4211-conditional-operators)
      - [4.2.1.2. logical operators:](#4212-logical-operators)
      - [4.2.1.3. comparison operators:](#4213-comparison-operators)
    - [4.2.2. IN:](#422-in)
    - [4.2.3. BETWEEN:](#423-between)
    - [4.2.4. LIKE:](#424-like)
    - [4.2.5. Subqueries:](#425-subqueries)
  - [4.3. ORDER BY clause:](#43-order-by-clause)
  - [4.4. LIMIT clause:](#44-limit-clause)
  - [4.5. DISTINCT clause:](#45-distinct-clause)
  - [4.6. Alias clause:](#46-alias-clause)
  - [4.7. Group By clause:](#47-group-by-clause)
  - [4.8. Having clause:](#48-having-clause)
  - [4.9. Aggregate functions:](#49-aggregate-functions)
  - [4.10. Joins:](#410-joins)
    - [4.10.1. Inner Join:](#4101-inner-join)
    - [4.10.2. Left Join:](#4102-left-join)
    - [4.10.3. Right Join:](#4103-right-join)
- [5. DCL:](#5-dcl)
  - [5.1. Why DCL is Important:](#51-why-dcl-is-important)
  - [5.2. Common Privileges:](#52-common-privileges)
  - [5.3. GRANT:](#53-grant)
  - [5.4. REVOKE:](#54-revoke)
- [6. TCL:](#6-tcl)
  - [6.1. What is transaction:](#61-what-is-transaction)
  - [6.2. TCL Commands:](#62-tcl-commands)
  - [6.3. Sample Table:](#63-sample-table)
  - [6.4. BEGIN / START TRANSACTION:](#64-begin--start-transaction)
  - [6.5. COMMIT:](#65-commit)
  - [6.6. ROLLBACK:](#66-rollback)
  - [6.7. SAVEPOINT:](#67-savepoint)
    - [6.7.1. Rollback to Savepoint:](#671-rollback-to-savepoint)
  - [6.8. RELEASE SAVEPOINT:](#68-release-savepoint)
  - [6.9. Example:](#69-example)
  - [6.10. ACID Properties:](#610-acid-properties)



# 1. Introduction: 
SQL (Structured Query Language) is a standardized language for all relational databases management systems. Every RDBMS, such as MySQL and PostgreSQL etc, uses SQL as its primary language and add extra specific features on it. There are 5 main categories of SQL Commands: 

| Category | Full Form                    | commands                                                                  | Purpose                                                       |
| -------- | ---------------------------- | ------------------------------------------------------------------------- | ------------------------------------------------------------- |
| DDL      | Data Definition Language     | `CREATE, ALTER, DROP, TRUNCATE, RENAME`                                   | Define and modify database structure (e.g. databases, tables) |
| DML      | Data Manipulation Language   | `INSERT, UPDATE, DELETE`                                                  | Insert, update, and delete data form tables                   |
| DQL      | Data Query Language          | `SELECT`                                                                  | Retrieve data from tables                                     |
| DCL      | Data Control Language        | `GRANT, REVOKE`                                                           | Control permissions and access                                |
| TCL      | Transaction Control Language | `BEGIN/START TRANSACTION, COMMIT, ROLLBACK, SAVEPOINT, RELEASE SAVEPOINT` | Manage transactions                                           |

![image](./assets/images/introduction/sql_commands.webp)

**Note:** SQL is a query language and cannot run independently. It requires a DBMS specifically RDBMS, such as MySQL or PostgreSQL etc to run.

# 2. DDL: 
DDL (Data Definition Language) is a category of SQL commands used to define, create, modify, and remove database structures such as databases, tables etc.

## 2.1. CREATE:
The `CREATE` command used to create new databases or tables.

### 2.1.1. CREATE DATABASE:
The `CREATE DATABASE` command used to create new databases.

```sql
CREATE DATABASE database_name;
```

### 2.1.2. CREATE TABLE:
The `CREATE TABLE` command used to create new tables.

```sql
CREATE TABLE table_name (
    .....schema.....
    .....schema.....
    .....schema.....
);
```

**Note:** For preventing duplicate table name, use `IF NOT EXISTS` clause.

```sql
CREATE TABLE IF NOT EXISTS table_name (
    .....schema.....
    .....schema.....
    .....schema.....
)
```

#### 2.1.2.1. Schema: 
A schema defines the structure of a table, including:
- Column names
- Data types
- Constraints
- Relationships

```sql
CREATE TABLE IF NOT EXISTS table_name (
    column_name data_type constraints,
    column_name data_type constraints,
);
```

Example:

```sql
CREATE TABLE users (
    id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    -- id SERIAL PRIMARY KEY, -- only works on PostgreSQL
    -- id INT AUTO_INCREMENT PRIMARY KEY, -- only works on MySQL
    name VARCHAR(100) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL
);
```

```sql
CREATE TABLE meals (
    id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    -- id SERIAL PRIMARY KEY, -- only works on PostgreSQL
    -- id INT AUTO_INCREMENT PRIMARY KEY, -- only works on MySQL
    title VARCHAR(255) NOT NULL,
    price DECIMAL(10,2) NOT NULL
);
```

```sql
CREATE TABLE orders (
    id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    -- id SERIAL PRIMARY KEY, -- only works on PostgreSQL
    -- id INT AUTO_INCREMENT PRIMARY KEY, -- only works on MySQL
    user_id INT REFERENCES users(id),
    meal_id INT REFERENCES meals(id),
    quantity INT DEFAULT 1
);
```


##### 2.1.2.1.1. Common SQL Data Types For Schema: 

- Numeric types:

| Type                        | Description                                          | Example                                  |
| --------------------------- | ---------------------------------------------------- | ---------------------------------------- |
| `SMALLINT`                  | 2 bytes (Small integer values)                       | age, quantity                            |
| `INT/INTEGER`               | 4 bytes (Standard integer values)                    | default choice                           |
| `BIGINT`                    | 8 bytes (Very large integer values)                  | large counters when overflow is possible |
| `NUMERIC(p,s)/DECIMAL(p,s)` | variable (Exact numeric values with fixed precision) | money or financial data                  |
| `REAL`                      | 4 bytes (6 decimal digits precision)                 | approximate scientific data only         |
| `DOUBLE PRECISION`          | 8 Bytes (15 decimal digits precision)                | approximate scientific data only         |



```sql
CREATE TABLE IF NOT EXISTS numeric_types_demo (
    id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    -- id SERIAL PRIMARY KEY, -- only works on PostgreSQL
    -- id INT AUTO_INCREMENT PRIMARY KEY, -- only works on MySQL

    small_number SMALLINT,                      -- 10, -5, 300
    normal_number INT,                          -- 1000, 250000
    big_number BIGINT,                          -- 10000000000

    exact_money NUMERIC(10,2),                  -- 10.00, 10.99
    exact_precise DECIMAL(10,6),                -- 10.123456

    approx_real REAL,                           -- 10.123457 (rounded after 6 digits)
    approx_double DOUBLE PRECISION,             -- 10.123456789123457 (rounded after 15 digits)
);
```

Note: For `NUMERIC(p,s)/DECIMAL(p,s)`
- Precision = Total number of digits allowed.
- Scale = Number of digits allowed after the decimal point.

SO NUMERIC(10,2) means it precision is total 10 digit (before 8 and after 2): 

```js
12345678.90   ✅ (8 before, 2 after)
1.23          ✅ (okay)
-99999999.99  ✅ (min)
99999999.99   ✅ (max)

123456789.12  ❌ (9 digits before → too big)
12.123        ❌ (3 decimal places → too many)
```

- String types:

| Type         | Description                                   | Example                   |
| ------------ | --------------------------------------------- | ------------------------- |
| `CHAR(n)`    | Fixed n length of string (padded with spaces) | country code, status code |
| `VARCHAR(n)` | Variable n length string with limit           | names, titles             |
| `TEXT`       | Variable-length string                        | descriptions, content     |

Note: There is no performance difference between `TEXT` and `VARCHAR` in PostgreSQL. The Only Real Difference `VARCHAR(n)` adds a constraint.

```sql
CREATE TABLE IF NOT EXISTS string_types_demo (
    id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    -- id SERIAL PRIMARY KEY, -- only works on PostgreSQL
    -- id INT AUTO_INCREMENT PRIMARY KEY, -- only works on MySQL

    fixed_char CHAR(5),                            -- 'A    ', 'BD   ' (padded)
    short_text VARCHAR(50),                        -- 'Hello World'
    long_text TEXT                                 -- large content
);
```

- Date & Time types:

| Type        | Description                         | Example                            |
| ----------- | ----------------------------------- | ---------------------------------- |
| `DATE`      | Date only                           | `'2026-04-13'`                     |
| `TIME`      | Time only                           | `'14:30:00'`                       |
| `TIMESTAMP` | Date + time (no timezone)           | `'2026-04-13 14:30:00'`            |
| `INTERVAL`  | Duration / difference between times | `'2 days'`, `'3 hours 30 minutes'` |

```sql
CREATE TABLE IF NOT EXISTS datetime_types_demo (
    id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    -- id SERIAL PRIMARY KEY, -- only works on PostgreSQL
    -- id INT AUTO_INCREMENT PRIMARY KEY, -- only works on MySQL


    only_date DATE,                                 -- '2026-04-13'
    only_time TIME,                                 -- '14:30:00'

    simple_timestamp TIMESTAMP,                     -- '2026-04-13 14:30:00'

    duration INTERVAL                               -- '2 days', '3 hours'
);
```

-  Boolean Types: 
  
| Type           | Description          | Example   |
| -------------- | -------------------- | --------- |
| `BOOLEAN/BOOL` | true, false and null | is_active |


```sql
-- ENUM must be created first
CREATE TYPE order_status AS ENUM ('pending', 'completed', 'cancelled');

CREATE TABLE IF NOT EXISTS other_types_demo (
    id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    -- id SERIAL PRIMARY KEY, -- only works on PostgreSQL
    -- id INT AUTO_INCREMENT PRIMARY KEY, -- only works on MySQL

    is_active BOOLEAN,                              -- true / false
);
```


##### 2.1.2.1.2. Common SQL Constraints For Schema:

| Constraint    | Description                         | Example                     |
| ------------- | ----------------------------------- | --------------------------- |
| `NOT NULL`    | Prevent empty values                | username, email             |
| `UNIQUE`      | Prevent duplicate values            | email, username             |
| `PRIMARY KEY` | Unique identifier for each row      | id                          |
| `FOREIGN KEY` | Creates relationship between tables |                             |
| `CHECK`       | Validates data against a condition  | age must be greater than 18 |
| `DEFAULT`     | Sets default value                  | default choice              |

- NOT NULL: 
  
```sql
CREATE TABLE users (
    id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    -- id SERIAL PRIMARY KEY, -- only works on PostgreSQL
    -- id INT AUTO_INCREMENT PRIMARY KEY, -- only works on MySQL

    name VARCHAR(100) NOT NULL,
    email VARCHAR(255) NOT NULL
);
``` 

- UNIQUE: 
  
```sql
CREATE TABLE users (
    id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    -- id SERIAL PRIMARY KEY, -- only works on PostgreSQL
    -- id INT AUTO_INCREMENT PRIMARY KEY, -- only works on MySQL

    email VARCHAR(255) UNIQUE
);
```

- PRIMARY KEY: 

```sql
CREATE TABLE users (
    id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    -- id SERIAL PRIMARY KEY, -- only works on PostgreSQL
    -- id INT AUTO_INCREMENT PRIMARY KEY, -- only works on MySQL

    id INT PRIMARY KEY,
    email VARCHAR(255)
);
```

- FOREIGN KEY: 

```sql
CREATE TABLE IF NOT EXISTS users (
    id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    -- id SERIAL PRIMARY KEY, -- only works on PostgreSQL
    -- id INT AUTO_INCREMENT PRIMARY KEY, -- only works on MySQL

    name VARCHAR(100) NOT NULL,
);

CREATE TABLE IF NOT EXISTS orders (
    id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    -- id SERIAL PRIMARY KEY, -- only works on PostgreSQL
    -- id INT AUTO_INCREMENT PRIMARY KEY, -- only works on MySQL

    user_id INTEGER,
    FOREIGN KEY (user_id) REFERENCES users(id)

    -- or
    user_id INT REFERENCES users(id) // shorthand
);
``` 


- CHECK:

```sql
CREATE TABLE products (
    id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    -- id SERIAL PRIMARY KEY, -- only works on PostgreSQL
    -- id INT AUTO_INCREMENT PRIMARY KEY, -- only works on MySQL

    price DECIMAL(10,2) CHECK (price > 0),
    stock INTEGER CHECK (stock >= 0)
);
```

- DEFAULT: 

```sql
CREATE TABLE users (
        id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    -- id SERIAL PRIMARY KEY, -- only works on PostgreSQL
    -- id INT AUTO_INCREMENT PRIMARY KEY, -- only works on MySQL

    is_active BOOLEAN DEFAULT TRUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
```

## 2.2. ALTER:
The `ALTER` command used to modify existing databases, tables and columns.

syntax: 
```sql
ALTER TABLE table_name
action;
```

### 2.2.1. Database Level:

- Rename database:

```sql
ALTER DATABASE old_database_name RENAME TO new_database_name;
```

### 2.2.2. Table Level:

- Rename table: 

```sql
ALTER TABLE old_table_name RENAME TO new_table_name;
```

- Add Constraints:

```sql
ALTER TABLE table_name
ADD constraints new_column_name UNIQUE (old_column_name);
```

```sql
ALTER TABLE table_name
ADD constraints new_column_name CHECK (old_column_name > 0);s
```

- Remove Constraints:

```sql
ALTER TABLE table_name
DROP CONSTRAINT column_name;
```

### 2.2.3. Column Level: 
- Add column: 

```sql
ALTER TABLE table_name
ADD column_name data_type constraints;
```

- Drop column: 

```sql
ALTER TABLE table_name
DROP COLUMN column_name;
```

- Modify column data types:

```sql
ALTER TABLE users
ALTER COLUMN column_name TYPE new_data_type;
```

- Rename column:

```sql
ALTER TABLE table_name
RENAME COLUMN old_column_name TO new_column_name;
```

- Add/remove constraints:

```sql
ALTER TABLE users
ALTER COLUMN column_name SET constraints;
```

```sql
ALTER TABLE users
ALTER COLUMN column_name DROP constraints;
```


## 2.3. DROP:
The `DROP` command used to remove existing databases or tables.

```sql
DROP DATABASE database_name;
```

```sql
DROP TABLE table_name;
```


## 2.4. TRUNCATE:
The `TRUNCATE` command used to remove existing databases or tables.

```sql
TRUNCATE DATABASE database_name;
```

```sql
TRUNCATE TABLE table_name;
```

Note: `DROP` and `TRUNCATE` are different. `DROP` removes the database or table completely, while `TRUNCATE` removes the data from the table, but leaves the table structure in place.

## 2.5. RENAME:
The `RENAME` command used to rename existing databases or tables.

```sql
RENAME DATABASE database_name TO new_database_name;
```

```sql
RENAME TABLE table_name TO new_table_name;
```


# 3. DML: 
DML (Data Manipulation Language) is a category of SQL commands used to insert, update, and delete data stored inside database tables.

Note: 
- DDL works with structure (schema) of the database
- DML works with data (rows) inside the database 

## 3.1. INSERT: 
Used to add new records (rows) into a table.

```sql
INSERT INTO table_name (column1, column2, column3)
VALUES (value1, value2, value3);
```

For multiple rows: 

```sql
INSERT INTO table_name (column1, column2, column3)
VALUES
    (value1, value2, value3),
    (value1, value2, value3),
    (value1, value2, value3);
```

## 3.2. UPDATE: 
Used to modify existing data in a table.

```sql
UPDATE table_name
SET column1 = value1, column2 = value2, column3 = value3
WHERE condition;
```

## 3.3. DELETE: 
Used to remove existing data from a table.

```sql
DELETE FROM table_name
WHERE condition;
```

# 4. DQL:
DQL (Data Query Language) is a category of SQL commands used to retrieve (query) data from database tables.

Note: 
- DDL: Defines database structure
- DML: Modifies data
- DQL: Retrieves data

QDL mainly consists of a single command that is `SELECT`. However `SELECT` has many clauses and features that make it the most important SQL command: 

```sql
SELECT column_list
FROM table_name
WHERE condition
GROUP BY column_name
HAVING condition
ORDER BY column_name
LIMIT number;
```

## 4.1. Basic select operation: 


- select all columns:

```sql
SELECT * FROM users;
```

- select specific columns:

```sql
SELECT name, email FROM users;
```

## 4.2. WHERE clause:
used to flter rows.

### 4.2.1. Operators:
#### 4.2.1.1. conditional operators:
- = equal to
- != not equal to
- > greater than
- < less than
- >= greater than or equal to
- <= less than or equal to

```sql
SELECT * FROM users WHERE city = 'Dhaka';
```
```sql
SELECT * FROM users WHERE age > 25;
```

#### 4.2.1.2. logical operators:
- AND
- OR
- NOT

```sql
SELECT * FROM users WHERE age > 25 AND city = 'Dhaka';
```
```sql
SELECT * FROM users WHERE age > 25 OR city = 'Dhaka';
```
```sql
SELECT * FROM users WHERE NOT (age > 25 AND city = 'Dhaka');
```

#### 4.2.1.3. comparison operators:
- IN
- NOT IN
- BETWEEN
- LIKE
- IS NULL
- IS NOT NULL

```sql
SELECT * FROM users WHERE age IN (25, 30, 35);
```
```sql
SELECT * FROM users WHERE age NOT IN (25, 30, 35);
```
```sql
SELECT * FROM users WHERE age BETWEEN 25 AND 35;
```
```sql
SELECT * FROM users WHERE name LIKE 'A%';
```
```sql
SELECT * FROM users WHERE name IS NULL;
```
```sql
SELECT * FROM users WHERE name IS NOT NULL;
```


### 4.2.2. IN: 
used to filter rows based on a list of values.

```sql
SELECT * FROM users WHERE age IN (25, 30, 35);
```

### 4.2.3. BETWEEN: 
used to filter rows based on a range of values.

```sql
SELECT * FROM users WHERE age BETWEEN 25 AND 35;
```

### 4.2.4. LIKE: 
used to filter rows based on a pattern.

```sql
SELECT * FROM users WHERE name LIKE 'A%';
```

### 4.2.5. Subqueries: 
A query inside another query.

```sql
SELECT * FROM users WHERE age > (SELECT AVG(age) FROM users);
```


## 4.3. ORDER BY clause:
used to sort the result-set in ascending(default) or descending order.

```sql
SELECT * FROM users ORDER BY name ASC;
```
```sql
SELECT * FROM users ORDER BY name DESC;
```

## 4.4. LIMIT clause:
used to limit the number of rows returned in the result-set.

```sql
SELECT * FROM users LIMIT 5;
```

## 4.5. DISTINCT clause:
used to remove duplicate rows from the result-set.

```sql
SELECT DISTINCT city FROM users;
```

## 4.6. Alias clause: 
used to give a table or column a temporary name.

```sql
SELECT name AS full_name FROM users;
```

## 4.7. Group By clause:
used to group rows based on one or more columns.

```sql
SELECT city, COUNT(*) AS total_users FROM users GROUP BY city;
```

## 4.8. Having clause:
used to filter groups based on a condition.

```sql        
SELECT city, COUNT(*) AS total_users FROM users GROUP BY city HAVING COUNT(*) > 1;
```


## 4.9. Aggregate functions:
used to perform operations on a group of rows.

- COUNT: returns the number of rows in a group.
- SUM: returns the sum of all values in a group.
- AVG: returns the average of all values in a group.
- MIN: returns the minimum value in a group.
- MAX: returns the maximum value in a group.

```sql
SELECT COUNT(*) FROM users;
```
```sql
SELECT SUM(price) FROM orders;
```
```sql
SELECT AVG(price) FROM orders;
```
```sql
SELECT MIN(price) FROM orders;
```
```sql
SELECT MAX(price) FROM orders;
```
```sql
SELECT COUNT(DISTINCT city) FROM users;
```


## 4.10. Joins:
used to combine rows from two or more tables based on a related column between them.

### 4.10.1. Inner Join:
used to combine rows from two tables based on a related column between them.

```sql
SELECT * FROM users INNER JOIN orders ON users.id = orders.user_id;
```

### 4.10.2. Left Join:
used to combine rows from two tables based on a related column between them.

```sql
SELECT * FROM users LEFT JOIN orders ON users.id = orders.user_id;
```

### 4.10.3. Right Join:
used to combine rows from two tables based on a related column between them.    

```sql
SELECT * FROM users RIGHT JOIN orders ON users.id = orders.user_id;
```

# 5. DCL:
DCL (Data Control Language) is a category of SQL commands used to manage user permissions, privileges, and access control in a database.

Note: 
- DDL → Manages database structure.
- DML → Manages data.
- DQL → Retrieves data.
- DCL → Controls who can access and modify the database.

The two main DCL commands are:

```sql
GRANT
REVOKE
```

## 5.1. Why DCL is Important: 

Imagine a company database:

| User      | Role                |
| --------- | ------------------- |
| Admin     | Full access         |
| Developer | Read and write data |
| Analyst   | Read-only access    |
| Intern    | Limited access      |

DCL allows the database administrator (DBA) to control these permissions.

## 5.2. Common Privileges: 
| Privilege      | Description                         |
| -------------- | ----------------------------------- |
| SELECT         | Read data                           |
| INSERT         | Add new rows                        |
| UPDATE         | Modify existing rows                |
| DELETE         | Remove rows                         |
| ALL PRIVILEGES | All available permissions           |
| CREATE         | Create database objects             |
| ALTER          | Modify database objects             |
| DROP           | Delete database objects             |
| REFERENCES     | Create foreign key references       |
| TRIGGER        | Create triggers                     |
| EXECUTE        | Execute stored procedures/functions |


## 5.3. GRANT:
Used to grant permissions to a user.

syntax:

```sql
GRANT privilege ON table_name TO user_name;
```
- Grant SELECT Permission:

```sql
GRANT SELECT ON users TO analyst;
```

- Grant multiple permissions:
  
```sql
GRANT SELECT, INSERT, UPDATE ON users TO developer;
```

- Grant All Permissions: 
```sql
GRANT ALL PRIVILEGES ON users TO admin;
```

- Grant permission to a role:

```sql
GRANT SELECT ON users TO role_name;
```

- Grant Database Access: 

```sql
GRANT CONNECT ON DATABASE database_name TO user_name;
```

## 5.4. REVOKE:
Used to revoke permissions from a user.

syntax:

```sql
REVOKE privilege ON table_name FROM user_name;
```

- Revoke SELECT Permission: 

```sql
REVOKE SELECT ON users FROM analyst;
```

- Revoke multiple permissions:

```sql
REVOKE SELECT, INSERT, UPDATE ON users FROM developer;
```

- Revoke All Permissions: 

```sql
REVOKE ALL PRIVILEGES ON users FROM admin;
```

- Revoke permission from a role: 

```sql
REVOKE SELECT ON users FROM role_name;
```

- Revoke Database Access: 

```sql
REVOKE CONNECT ON DATABASE database_name FROM user_name;
```

# 6. TCL:
TCL (Transaction Control Language) is a category of SQL commands used to manage transactions in a database.

note: 
- DDL → Manages database structure.
- DML → Manages data.
- DQL → Retrieves data.
- DCL → Manages permissions.
- TCL → Manages transactions

## 6.1. What is transaction: 
A transaction is a group of one or more SQL statements that are treated as a single unit of work.

Imagine a bank transfer:
- Deduct $100 from Account A
- Add $100 to Account B

If step 1 succeeds but step 2 fails, the money disappears. To prevent this, both operations are grouped into a transaction.

Either:
- Both succeed → Save changes.
- Any fails → Undo everything.

## 6.2. TCL Commands:
| Command                   | Purpose                      |
| ------------------------- | ---------------------------- |
| BEGIN / START TRANSACTION | Start a transaction          |
| COMMIT                    | Save changes permanently     |
| ROLLBACK                  | Undo changes                 |
| SAVEPOINT                 | Create a rollback checkpoint |
| RELEASE SAVEPOINT         | Remove a savepoint           |

## 6.3. Sample Table: 

```sql
CREATE TABLE accounts (
    id INT PRIMARY KEY,
    name VARCHAR(100),
    balance DECIMAL(10,2)
);
```

| id  | name  | balance |
| --- | ----- | ------- |
| 1   | Tamim | 1000    |
| 2   | John  | 500     |


## 6.4. BEGIN / START TRANSACTION:
Used to start a transaction.

```sql
BEGIN;

UPDATE accounts
SET balance = balance - 100
WHERE id = 1;

UPDATE accounts
SET balance = balance + 100
WHERE id = 2;
```

Changes are not permanent yet.

## 6.5. COMMIT:
Used to permanently save all changes made during the transaction.

```sql
BEGIN;

UPDATE accounts
SET balance = balance - 100
WHERE id = 1;

UPDATE accounts
SET balance = balance + 100
WHERE id = 2;

COMMIT;  
```

before: 
| id  | balance |
| --- | ------- |
| 1   | 1000    |
| 2   | 500     |

after:
| id  | balance |
| --- | ------- |
| 1   | 900     |
| 2   | 600     |

## 6.6. ROLLBACK:
Used to undo all changes made since the transaction began.

```sql
BEGIN;

UPDATE accounts
SET balance = balance - 100
WHERE id = 1;

UPDATE accounts
SET balance = balance + 100
WHERE id = 2;

ROLLBACK;
```

Result:
| id  | balance |
| --- | ------- |
| 1   | 1000    |
| 2   | 500     |

All changes are undone.

## 6.7. SAVEPOINT:
Used to create a checkpoint inside a transaction. Instead of rolling back everything, you can roll back to a specific point.

```sql
BEGIN;

UPDATE accounts
SET balance = balance - 100
WHERE id = 1;

SAVEPOINT transfer_started;

UPDATE accounts
SET balance = balance + 100
WHERE id = 2;
```

At this point:
- First update completed.
- Savepoint created.
- Second update completed.

### 6.7.1. Rollback to Savepoint: 

```sql
ROLLBACK TO SAVEPOINT transfer_started;
```
This will undo only the operations performed after the savepoint.

```sql
BEGIN;

UPDATE accounts
SET balance = balance - 100
WHERE id = 1;

SAVEPOINT sp1;

UPDATE accounts
SET balance = balance + 100
WHERE id = 2;

ROLLBACK TO SAVEPOINT sp1;

COMMIT;
```

| id  | balance |
| --- | ------- |
| 1   | 900     |
| 2   | 500     |

Explanation:
- First update remains.
- Second update is undone.
- Transaction is committed.

## 6.8. RELEASE SAVEPOINT:
RELEASE SAVEPOINT.

```sql
RELEASE SAVEPOINT savepoint_name;
```

```sql
BEGIN;

SAVEPOINT sp1;

UPDATE accounts
SET balance = balance - 100
WHERE id = 1;

RELEASE SAVEPOINT sp1;

COMMIT;
```
After releasing it, you can no longer roll back to that savepoint.

## 6.9. Example: 

```sql
BEGIN;

UPDATE accounts
SET balance = balance - 100
WHERE id = 1;

SAVEPOINT deduction_done;

UPDATE accounts
SET balance = balance + 100
WHERE id = 2;

COMMIT;
```

| id  | balance |
| --- | ------- |
| 1   | 900     |
| 2   | 600     |


## 6.10. ACID Properties: 
Transactions follow the ACID principles.

- A(Atomicity): Either all operations succeed or none.
- C(Consistency): Data remains consistent.
- I(Isolation): Each transaction is isolated from other transactions.
- D(Durability): Once a transaction is committed, the changes are permanent.

```sql
BEGIN;

UPDATE accounts
SET balance = balance - 100
WHERE id = 1;

UPDATE accounts
SET balance = balance + 100
WHERE id = 2;

COMMIT;
```

here in the example, 
- Either both updates succeed or both fail = Atomicity
- Money is not lost or created during transfers = Consistency
- Two users updating the same account won't corrupt data = Isolation
- Once a transaction is committed, the changes are permanent = Durability