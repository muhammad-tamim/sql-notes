<h1 align="center">SQL Notes</h2>


- [1. Introduction:](#1-introduction)
- [2. DDL:](#2-ddl)
  - [2.1. CREATE:](#21-create)
    - [2.1.1. CREATE DATABASE:](#211-create-database)
    - [2.1.2. CREATE TABLE:](#212-create-table)
      - [2.1.2.1. CREATE TABLE IF NOT EXISTS:](#2121-create-table-if-not-exists)
      - [2.1.2.2. Schema:](#2122-schema)
        - [2.1.2.2.1. Common SQL Data Types:](#21221-common-sql-data-types)
          - [2.1.2.2.1.1. Numeric types:](#212211-numeric-types)
          - [2.1.2.2.1.2. String types:](#212212-string-types)
          - [2.1.2.2.1.3. Date \& Time types:](#212213-date--time-types)
          - [2.1.2.2.1.4. Boolean Types:](#212214-boolean-types)
        - [2.1.2.2.2. Common SQL Constraints:](#21222-common-sql-constraints)
          - [2.1.2.2.2.1. PRIMARY KEY:](#212221-primary-key)
          - [2.1.2.2.2.2. FOREIGN KEY:](#212222-foreign-key)
          - [2.1.2.2.2.3. NOT NULL:](#212223-not-null)
          - [2.1.2.2.2.4. UNIQUE:](#212224-unique)
          - [2.1.2.2.2.5. CHECK:](#212225-check)
          - [2.1.2.2.2.6. DEFAULT:](#212226-default)
  - [2.2. ALTER:](#22-alter)
    - [2.2.1. Database Level:](#221-database-level)
      - [2.2.1.1. Rename database:](#2211-rename-database)
    - [2.2.2. Table Level:](#222-table-level)
      - [2.2.2.1. Rename table:](#2221-rename-table)
      - [2.2.2.2. Add table constraint:](#2222-add-table-constraint)
        - [2.2.2.2.1. Primary key:](#22221-primary-key)
        - [2.2.2.2.2. Foreign key:](#22222-foreign-key)
        - [2.2.2.2.3. Unique:](#22223-unique)
        - [2.2.2.2.4. Check:](#22224-check)
      - [2.2.2.3. Remove table Constraints:](#2223-remove-table-constraints)
    - [2.2.3. Column Level:](#223-column-level)
      - [2.2.3.1. Add column:](#2231-add-column)
      - [2.2.3.2. Drop column:](#2232-drop-column)
      - [2.2.3.3. Rename column:](#2233-rename-column)
      - [2.2.3.4. Change column data types:](#2234-change-column-data-types)
      - [2.2.3.5. Add/DROP constraints(Only NOT NULL \& DEFAULT):](#2235-adddrop-constraintsonly-not-null--default)
        - [2.2.3.5.1. Not NULL:](#22351-not-null)
      - [2.2.3.6. DEFAULT:](#2236-default)
  - [2.3. DROP:](#23-drop)
  - [2.4. TRUNCATE:](#24-truncate)
- [3. DML:](#3-dml)
  - [3.1. INSERT:](#31-insert)
  - [3.2. UPDATE:](#32-update)
  - [3.3. DELETE:](#33-delete)
- [4. DQL:](#4-dql)
  - [4.1. Basic select operation:](#41-basic-select-operation)
  - [4.2. WHERE clause:](#42-where-clause)
    - [4.2.1. Operators:](#421-operators)
      - [4.2.1.1. Comparison Operators:](#4211-comparison-operators)
      - [4.2.1.2. logical operators:](#4212-logical-operators)
      - [4.2.1.3. Special Operators:](#4213-special-operators)
        - [4.2.1.3.1. IN:](#42131-in)
        - [4.2.1.3.2. NOT IN:](#42132-not-in)
        - [4.2.1.3.3. BETWEEN:](#42133-between)
        - [4.2.1.3.4. LIKE:](#42134-like)
        - [4.2.1.3.5. IS NULL:](#42135-is-null)
        - [4.2.1.3.6. IS NOT NULL:](#42136-is-not-null)
    - [4.2.2. Subqueries:](#422-subqueries)
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
    - [4.10.4. FULL JOIN:](#4104-full-join)
    - [4.10.5. CROSS JOIN:](#4105-cross-join)
- [5. DCL:](#5-dcl)
  - [5.1. Why DCL is Important:](#51-why-dcl-is-important)
  - [5.2. Common Privileges:](#52-common-privileges)
  - [5.3. GRANT:](#53-grant)
    - [5.3.1. Grant single Permission:](#531-grant-single-permission)
    - [5.3.2. Grant multiple permissions:](#532-grant-multiple-permissions)
    - [5.3.3. Grant All Permissions:](#533-grant-all-permissions)
    - [5.3.4. Grant permission to a role:](#534-grant-permission-to-a-role)
  - [5.4. REVOKE:](#54-revoke)
    - [5.4.1. Revoke single Permission:](#541-revoke-single-permission)
    - [5.4.2. Revoke multiple permissions:](#542-revoke-multiple-permissions)
    - [5.4.3. Revoke All Permissions:](#543-revoke-all-permissions)
    - [5.4.4. Revoke permission from a role:](#544-revoke-permission-from-a-role)
- [6. TCL:](#6-tcl)
  - [6.1. What is transaction:](#61-what-is-transaction)
  - [6.2. Transaction Lifecycle:](#62-transaction-lifecycle)
  - [6.3. Transaction Command Operations:](#63-transaction-command-operations)
    - [6.3.1. START TRANSACTION:](#631-start-transaction)
    - [6.3.2. COMMIT:](#632-commit)
    - [6.3.3. ROLLBACK:](#633-rollback)
    - [6.3.4. SAVEPOINT:](#634-savepoint)
      - [6.3.4.1. Rollback to Savepoint:](#6341-rollback-to-savepoint)
    - [6.3.5. RELEASE SAVEPOINT:](#635-release-savepoint)
  - [6.4. ACID Properties:](#64-acid-properties)
  - [6.5. Complete Transaction Example:](#65-complete-transaction-example)



# 1. Introduction: 
SQL (Structured Query Language) is a standard query language for relational databases management systems. Every RDBMS, such as MySQL and PostgreSQL etc, uses SQL as its primary language and add extra specific features on it. There are 5 main categories of SQL Commands: 
 

| Category | Full Form                    | commands                                                            | Purpose                    |
| -------- | ---------------------------- | ------------------------------------------------------------------- | -------------------------- |
| 1. DDL   | Data Definition Language     | `CREATE, ALTER, DROP, TRUNCATE`                                     | Manages database structure |
| 2. DML   | Data Manipulation Language   | `INSERT, UPDATE, DELETE`                                            | Manages data               |
| 3. DQL   | Data Query Language          | `SELECT`                                                            | Retrieve data              |
| 4. DCL   | Data Control Language        | `GRANT, REVOKE`                                                     | Manages permissions        |
| 5. TCL   | Transaction Control Language | `START TRANSACTION, COMMIT, ROLLBACK, SAVEPOINT, RELEASE SAVEPOINT` | Manage transactions        |

![image](./assets/images/introduction/sql_commands.webp)

**Note:**
- Query Language = A query language is a type of language used to work with DBMS. In simple words:
  - Query = Question  
  - Query language = Language used to ask those questions to a DBMS
  - There are different types of query languages: SQL, NoSQL, GraphQL etc

# 2. DDL: 
DDL (Data Definition Language) is a category of SQL commands used to define, create, modify, and remove database structures such as databases, tables etc. It includes the following commands: `CREATE, ALTER, DROP, TRUNCATE`    

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
   -- column_definition,
   -- column_definition,
   -- column_definition
);
```
#### 2.1.2.1. CREATE TABLE IF NOT EXISTS:
For preventing duplicate table name use `IF NOT EXISTS` clause.

```sql
CREATE TABLE IF NOT EXISTS table_name (
   -- column_definition,
   -- column_definition,
   -- column_definition
)
```

**Note:**
- Clause = A part of a SQL statement that modifies or controls how the statement works.
  - CREATE TABLE → Command
  - IF NOT EXISTS → Clause

#### 2.1.2.2. Schema: 
A schema defines the structure of a table, including:
- Table name
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

here, The overall structure of a table, including the table name, columns, data types, constraints, and relationships etc is called a schema.

##### 2.1.2.2.1. Common SQL Data Types: 

###### 2.1.2.2.1.1. Numeric types:

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

    exact_money NUMERIC(10,2),                  -- 12345678.90
    exact_precise DECIMAL(10,6),                -- 123456.789123

    approx_real REAL,                           -- 10.123457 (rounded after 6 digits)
    approx_double DOUBLE PRECISION,             -- 10.123456789123457 (rounded after 15 digits)
);
```

**Note:** For `NUMERIC(p,s)/DECIMAL(p,s)`
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

###### 2.1.2.2.1.2. String types:

| Type         | Description                                   | Example                   |
| ------------ | --------------------------------------------- | ------------------------- |
| `CHAR(n)`    | Fixed n length of string (padded with spaces) | country code, status code |
| `VARCHAR(n)` | Variable n length string with limit           | names, titles             |
| `TEXT`       | Variable-length string                        | descriptions, content     |

**Note:** There is no performance difference between `TEXT` and `VARCHAR`. The Only Real Difference `VARCHAR(n)` adds a constraint.

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

###### 2.1.2.2.1.3. Date & Time types:

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

######  2.1.2.2.1.4. Boolean Types: 
  
| Type           | Description          | Example   |
| -------------- | -------------------- | --------- |
| `BOOLEAN/BOOL` | true, false and null | is_active |


```sql
CREATE TABLE IF NOT EXISTS other_types_demo (
    id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    -- id SERIAL PRIMARY KEY, -- only works on PostgreSQL
    -- id INT AUTO_INCREMENT PRIMARY KEY, -- only works on MySQL

    is_active BOOLEAN,                              -- true / false
);
```


##### 2.1.2.2.2. Common SQL Constraints:

| Constraint    | Description                         | Example                     |
| ------------- | ----------------------------------- | --------------------------- |
| `PRIMARY KEY` | Unique identifier for each row      | id                          |
| `FOREIGN KEY` | Creates relationship between tables | user_id                     |
| `NOT NULL`    | Prevent empty values                | username, email             |
| `UNIQUE`      | Prevent duplicate values            | email, username             |
| `CHECK`       | Validates data against a condition  | age must be greater than 18 |
| `DEFAULT`     | Sets default value                  | default choice              |

###### 2.1.2.2.2.1. PRIMARY KEY: 

```sql
CREATE TABLE users (
    id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    -- id SERIAL PRIMARY KEY, -- only works on PostgreSQL
    -- id INT AUTO_INCREMENT PRIMARY KEY, -- only works on MySQL

    -- id INT PRIMARY KEY,
    email VARCHAR(255)
);
```

###### 2.1.2.2.2.2. FOREIGN KEY: 

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
    FOREIGN KEY (user_id) REFERENCES users(id),

    -- or
    -- user_id INT REFERENCES users(id) // shorthand
);
``` 

**Note:** If we don't specify the `ON DELETE` option, the default is `NO ACTION`. Means we can't delete the parent row if any child rows reference it.

- ON DELETE options:
    
  - CASCADE: If parent is deleted → automatically delete all related child rows

```sql
 user_id INT REFERENCES users(id) ON DELETE CASCADE
```
  
  - SET NULL: If parent is deleted → keep child rows, but set foreign key to NULL (column must allow NULL)

```sql
 user_id INT REFERENCES users(id) ON DELETE SET NULL
```
  
  - RESTRICT: Prevent deleting the parent row if any child rows reference it

```sql
 user_id INT REFERENCES users(id) ON DELETE RESTRICT
```

###### 2.1.2.2.2.3. NOT NULL: 
  
```sql
CREATE TABLE users (
    id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    -- id SERIAL PRIMARY KEY, -- only works on PostgreSQL
    -- id INT AUTO_INCREMENT PRIMARY KEY, -- only works on MySQL

    name VARCHAR(100) NOT NULL,
    email VARCHAR(255) NOT NULL
);
``` 

###### 2.1.2.2.2.4. UNIQUE: 
  
```sql
CREATE TABLE users (
    id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    -- id SERIAL PRIMARY KEY, -- only works on PostgreSQL
    -- id INT AUTO_INCREMENT PRIMARY KEY, -- only works on MySQL

    email VARCHAR(255) UNIQUE
);
```

###### 2.1.2.2.2.5. CHECK:

```sql
CREATE TABLE products (
    id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    -- id SERIAL PRIMARY KEY, -- only works on PostgreSQL
    -- id INT AUTO_INCREMENT PRIMARY KEY, -- only works on MySQL

    price DECIMAL(10,2) CHECK (price > 0),
    stock INTEGER CHECK (stock >= 0)
);
```

###### 2.1.2.2.2.6. DEFAULT: 

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

### 2.2.1. Database Level:

#### 2.2.1.1. Rename database:

```sql
ALTER DATABASE old_database_name RENAME TO new_database_name;
```

### 2.2.2. Table Level:

#### 2.2.2.1. Rename table: 

```sql
ALTER TABLE old_table_name RENAME TO new_table_name;
```

```sql
ALTER TABLE users RENAME TO customers;
```

#### 2.2.2.2. Add table constraint:
Note: Not NULL and DEFAULT are not table level operation in sql instead they are column level operation.

##### 2.2.2.2.1. Primary key:

- Syntax:

```sql
ALTER TABLE table_name
ADD CONSTRAINT constraint_name
PRIMARY KEY (column_name);
``` 

- Example:

```sql
ALTER TABLE students
ADD CONSTRAINT pk_students
PRIMARY KEY (student_id);
```

##### 2.2.2.2.2. Foreign key:

- Syntax:

```sql
ALTER TABLE table_name
ADD CONSTRAINT constraint_name
FOREIGN KEY (column_name)
REFERENCES referenced_table(referenced_column);
```

- Example:

```sql
ALTER TABLE orders
ADD CONSTRAINT fk_orders_customer
FOREIGN KEY (customer_id)
REFERENCES customers(customer_id);
```

##### 2.2.2.2.3. Unique: 

- Syntax:

```sql
ALTER TABLE table_name
ADD CONSTRAINT constraint_name
UNIQUE (column_name);
```

- Example:

```sql
ALTER TABLE orders
ADD CONSTRAINT uk_orders_customer
UNIQUE (customer_id);
```

##### 2.2.2.2.4. Check: 

- Syntax:

```sql
ALTER TABLE table_name
ADD CONSTRAINT constraint_name
CHECK (column_name IS NOT NULL);
```
- Example:

```sql
ALTER TABLE orders
ADD CONSTRAINT ck_orders_customer
CHECK (customer_id IS NOT NULL);
```

#### 2.2.2.3. Remove table Constraints:

```sql  
ALTER TABLE table_name
DROP CONSTRAINT constraint_name;
```

```sql
ALTER TABLE orders
DROP CONSTRAINT fk_orders_customer;
```

### 2.2.3. Column Level: 
#### 2.2.3.1. Add column: 

```sql
ALTER TABLE table_name
ADD column_name data_type constraints;
```

Note: For multiple columns: 

```sql
ALTER TABLE table_name
ADD (
    column_name1 data_type constraints,
    column_name2 data_type constraints
)
```

#### 2.2.3.2. Drop column: 

```sql
ALTER TABLE table_name
DROP COLUMN column_name;
```

#### 2.2.3.3. Rename column:

```sql
ALTER TABLE table_name
RENAME COLUMN old_column_name TO new_column_name;
```

#### 2.2.3.4. Change column data types:

```sql
ALTER TABLE table_name
ALTER COLUMN column_name
SET DATA TYPE new_data_type;
```

#### 2.2.3.5. Add/DROP constraints(Only NOT NULL & DEFAULT):

##### 2.2.3.5.1. Not NULL:
```sql
ALTER TABLE table_name
ALTER COLUMN column_name
SET NOT NULL;
```

```sql
ALTER TABLE table_name
ALTER COLUMN column_name
DROP NOT NULL;
```

#### 2.2.3.6. DEFAULT: 

```sql
ALTER TABLE table_name
ALTER COLUMN column_name
SET DEFAULT value;
```

```sql
ALTER TABLE table_name
ALTER COLUMN column_name
DROP DEFAULT;
```

## 2.3. DROP:
The `DROP` command used to remove existing databases or tables.

```sql
DROP DATABASE database_name;
```

```sql
DROP TABLE table_name;
```

Note: When a database object is dropped, both its structure and data are permanently removed.

## 2.4. TRUNCATE:
The `TRUNCATE` command is used to remove all rows from a table while keeping the table structure intact.

```sql
TRUNCATE TABLE table_name;
```

**Note:** `DROP` and `TRUNCATE` are different. `DROP` removes the structure and data completely, while `TRUNCATE` removes the data from the table, but leaves the table structure in place.

# 3. DML: 
DML (Data Manipulation Language) is a category of SQL commands used to insert, update, and delete data stored inside database tables. It includes the following commands: `INSERT, UPDATE, DELETE`


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
```sql
-- example
UPDATE students 
SET age = 21 
WHERE student_id = 1;
```


for all rows: 
```sql
UPDATE table_name 
SET column_name = value;
```

```sql
-- example
UPDATE students 
SET age = 21;
```

## 3.3. DELETE: 
Used to remove existing data from a table.

```sql
DELETE FROM table_name
WHERE condition;
```

```sql
-- example
DELETE FROM students 
WHERE student_id = 1;
```

for all rows: 
```sql
DELETE FROM table_name;
```

```sql
-- example
DELETE FROM students;
```

Note: If the WHERE clause is omitted, all rows in the table will be deleted, but the table structure will remain intact.


# 4. DQL:
DQL (Data Query Language) is a category of SQL commands used to retrieve (query) data from database tables. It includes the following commands: `SELECT`

DQL mainly consists of a single command that is `SELECT`. However `SELECT` has many clauses and features that make it the most important SQL command. 


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
The WHERE clause is used to filter rows.

```sql
SELECT * FROM users WHERE age > 25;
```

### 4.2.1. Operators:
#### 4.2.1.1. Comparison Operators:
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
- AND = Both conditions must be true
- OR = At least one condition must be true
- NOT = Reverses a condition

```sql
SELECT * FROM users WHERE age > 25 AND city = 'Dhaka';
```
```sql
SELECT * FROM users WHERE age > 25 OR city = 'Dhaka';
```
```sql
SELECT * FROM users WHERE NOT (age > 25 AND city = 'Dhaka');
```

#### 4.2.1.3. Special Operators:

##### 4.2.1.3.1. IN: 
Used to check if a value is in a list of values.

```sql
SELECT * FROM users WHERE age IN (25, 30, 35);
```

##### 4.2.1.3.2. NOT IN: 
Used to check if a value is not in a list of values.

```sql
SELECT * FROM users WHERE age NOT IN (25, 30, 35);
```

##### 4.2.1.3.3. BETWEEN: 
Used to check if a value is between two values.

```sql
SELECT * FROM users WHERE age BETWEEN 25 AND 35;
```

##### 4.2.1.3.4. LIKE: 
Used to check if a value matches a pattern.

Common wildcard characters:
- 'A%' -- starts with A
- '%A' -- ends with A 
- '%A%' -- contains A 
- 'A_' -- A followed by one character

```sql
SELECT * FROM users WHERE name LIKE 'A%';
```

##### 4.2.1.3.5. IS NULL: 
Used to check if a value is NULL.

```sql
SELECT * FROM users WHERE email IS NULL;
```

##### 4.2.1.3.6. IS NOT NULL: 
Used to check if a value is not NULL.

```sql
SELECT * FROM users WHERE email IS NOT NULL;
```

### 4.2.2. Subqueries: 
A subquery is a query inside another query.

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

here,
- WHERE filters rows before grouping.
- HAVING filters groups after grouping.

## 4.9. Aggregate functions:
used to perform operations on a group of rows.

- COUNT: returns the number of rows in a group.
- SUM: returns the sum of all values in a group.
- AVG: returns the average of all values in a group.
- MIN: returns the minimum value in a group.
- MAX: returns the maximum value in a group.

```sql
SELECT COUNT(*) FROM users;
SELECT COUNT(DISTINCT city) FROM users;
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


## 4.10. Joins:
used to combine rows from two or more tables based on a related column between them.

- Example Table: 
users:
| id  | name    |
| --- | ------- |
| 1   | Alice   |
| 2   | Bob     |
| 3   | Charlie |
| 4   | David   |

orders:
| id  | user_id | product  |
| --- | ------- | -------- |
| 101 | 1       | Laptop   |
| 102 | 1       | Mouse    |
| 103 | 2       | Keyboard |
| 104 | 5       | Monitor  |


### 4.10.1. Inner Join:
Returns only rows that have matching values in both tables.

```sql
SELECT *
FROM users
INNER JOIN orders
ON users.id = orders.user_id;
```

| users.id | name  | orders.id | user_id | product  |
| -------- | ----- | --------- | ------- | -------- |
| 1        | Alice | 101       | 1       | Laptop   |
| 1        | Alice | 102       | 1       | Mouse    |
| 2        | Bob   | 103       | 2       | Keyboard |



### 4.10.2. Left Join:
Returns all rows from the left table and matching rows from the right table.

```sql
SELECT *
FROM users
LEFT JOIN orders
ON users.id = orders.user_id;
```

| users.id | name    | orders.id | user_id | product  |
| -------- | ------- | --------- | ------- | -------- |
| 1        | Alice   | 101       | 1       | Laptop   |
| 1        | Alice   | 102       | 1       | Mouse    |
| 2        | Bob     | 103       | 2       | Keyboard |
| 3        | Charlie | NULL      | NULL    | NULL     |
| 4        | David   | NULL      | NULL    | NULL     |


### 4.10.3. Right Join:
Returns all rows from the right table and matching rows from the left table.

```sql
SELECT *
FROM users
RIGHT JOIN orders
ON users.id = orders.user_id;
```

| users.id | name  | orders.id | user_id | product  |
| -------- | ----- | --------- | ------- | -------- |
| 1        | Alice | 101       | 1       | Laptop   |
| 1        | Alice | 102       | 1       | Mouse    |
| 2        | Bob   | 103       | 2       | Keyboard |
| NULL     | NULL  | 104       | 5       | Monitor  |


### 4.10.4. FULL JOIN: 
Returns all rows from both tables.

```sql
SELECT *
FROM users
FULL JOIN orders
ON users.id = orders.user_id;
```

| users.id | name    | orders.id | user_id | product  |
| -------- | ------- | --------- | ------- | -------- |
| 1        | Alice   | 101       | 1       | Laptop   |
| 1        | Alice   | 102       | 1       | Mouse    |
| 2        | Bob     | 103       | 2       | Keyboard |
| 3        | Charlie | NULL      | NULL    | NULL     |
| 4        | David   | NULL      | NULL    | NULL     |
| NULL     | NULL    | 104       | 5       | Monitor  |


### 4.10.5. CROSS JOIN: 
Returns every possible combination of rows from both tables.

```sql
SELECT *
FROM users
CROSS JOIN orders;
```

| name    | product  |
| ------- | -------- |
| Alice   | Laptop   |
| Alice   | Mouse    |
| Alice   | Keyboard |
| Alice   | Monitor  |
| Bob     | Laptop   |
| Bob     | Mouse    |
| Bob     | Keyboard |
| Bob     | Monitor  |
| Charlie | Laptop   |
| Charlie | Mouse    |
| ...     | ...      |

4 users × 4 orders = 16 rows

# 5. DCL:
DCL (Data Control Language) is a category of SQL commands used to manage user permissions, privileges, and access control in a database. It includes the following commands: `GRANT, REVOKE`


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
The `GRANT` command is used to give permissions to users or roles.

```sql
GRANT privilege ON table_name TO user_name;
```

### 5.3.1. Grant single Permission:

```sql
GRANT SELECT ON users TO analyst;
```

### 5.3.2. Grant multiple permissions:
  
```sql
GRANT SELECT, INSERT, UPDATE ON users TO developer;
```

### 5.3.3. Grant All Permissions: 
```sql
GRANT ALL PRIVILEGES ON users TO admin;
```

### 5.3.4. Grant permission to a role:

```sql
GRANT SELECT ON users TO role_name;
```

## 5.4. REVOKE:
The `REVOKE` command is used to remove previously granted permissions.

```sql
REVOKE privilege ON table_name FROM user_name;
```

### 5.4.1. Revoke single Permission: 

```sql
REVOKE SELECT ON users FROM analyst;
```

### 5.4.2. Revoke multiple permissions:

```sql
REVOKE SELECT, INSERT, UPDATE ON users FROM developer;
```

### 5.4.3. Revoke All Permissions: 

```sql
REVOKE ALL PRIVILEGES ON users FROM admin;
```

### 5.4.4. Revoke permission from a role: 

```sql
REVOKE SELECT ON users FROM role_name;
```


# 6. TCL:
TCL (Transaction Control Language) is a category of SQL commands used to manage transactions in a database. It includes the following commands:

| Command           | Purpose                      |
| ----------------- | ---------------------------- |
| START TRANSACTION | Start a transaction          |
| COMMIT            | Save changes permanently     |
| ROLLBACK          | Undo changes                 |
| SAVEPOINT         | Create a rollback checkpoint |
| RELEASE SAVEPOINT | Remove a savepoint           |

## 6.1. What is transaction: 
A transaction is a group of one or more SQL statements that are treated as a single unit of work.

Imagine a bank transfer:
- Deduct $100 from Account A
- Add $100 to Account B

If step 1 succeeds but step 2 fails, the money disappears. To prevent this, both operations are grouped into a transaction.

Either:
- Both succeed → Save changes.
- Any fails → Undo everything.

## 6.2. Transaction Lifecycle:

```sql
A typical transaction follows this flow:

START TRANSACTION
        ↓
Execute SQL Statements
        ↓
SAVEPOINT (Optional)
        ↓
COMMIT
   or
ROLLBACK
```

## 6.3. Transaction Command Operations:

- Sample Table: 

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


### 6.3.1. START TRANSACTION:
Used to start a transaction.

```sql
START TRANSACTION;

UPDATE accounts
SET balance = balance - 100
WHERE id = 1;

UPDATE accounts
SET balance = balance + 100
WHERE id = 2;
```
At this point:
- Changes are not permanent yet.
- The transaction is still active.
- Changes can be committed or rolled back.

### 6.3.2. COMMIT:
Used to permanently save all changes made during a transaction.

```sql
START TRANSACTION;

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

Once committed ,the changes become permanent

### 6.3.3. ROLLBACK:
Used to undo all changes made since the transaction began.

```sql
START TRANSACTION;

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

### 6.3.4. SAVEPOINT:
Used to create a checkpoint inside a transaction. Instead of rolling back everything, you can roll back to a specific point.

```sql
START TRANSACTION;

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

#### 6.3.4.1. Rollback to Savepoint: 

This undoes only the statements executed after the savepoint.

```sql
ROLLBACK TO SAVEPOINT sp1;
```
This will undo only the operations performed after the savepoint.

```sql
START TRANSACTION;

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

### 6.3.5. RELEASE SAVEPOINT:
Used to remove a savepoint from the current transaction.

```sql
RELEASE SAVEPOINT savepoint_name;
```

```sql
START TRANSACTION;

SAVEPOINT sp1;

UPDATE accounts
SET balance = balance - 100
WHERE id = 1;

RELEASE SAVEPOINT sp1;

COMMIT;
```
After releasing a savepoint:
- It no longer exists.
- We cannot roll back to it.

## 6.4. ACID Properties: 
Transactions follow the ACID principles.

- A(Atomicity): Either all operations succeed or none succeed.
  - Example: A user transfer $100 from account A to account B. so here Deduct $100 from Account A and Add $100 to Account B. so here if one step fails, the other will not be executed. So either both steps succeed or both fail. 
- C(Consistency): Data remains consistent.
  - Example: A table has a rule that balance >= 0. If a transaction tries to withdraw more money than available, the transaction is rejected, keeping the data valid.
- I(Isolation): Each transaction is isolated from other transactions.
  - Example: Two ATMs try to withdraw money from the same account at the same time. The database ensures that the transactions do not interfere with each other and that the final account balance remains correct.From the user's perspective, it behaves as if the transactions were executed safely and independently.
- D(Durability): Once a transaction is committed, the changes are permanent.
  - Example: A customer places an order and the transaction is committed. Even if the database server crashes immediately afterward, the order information is still saved when the system recovers.

```sql
START TRANSACTION;

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
- Money is not lost or created during transfers. Means the money just transfer form one to another accunt. but no money is created os lost = Consistency
```
Consistency:
The total amount of money remains the same during a transfer.

Before:
Account A = $1000
Account B = $500
Total = $1500

Transfer $100 from A to B

After:
Account A = $900
Account B = $600
Total = $1500

No money is created or lost, so the database remains consistent.
```

- Two users updating the same account won't corrupt data = Isolation
- Once a transaction is committed, the changes are permanent = Durability

## 6.5. Complete Transaction Example: 

```sql
START TRANSACTION;

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


