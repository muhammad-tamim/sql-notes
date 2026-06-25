<h1 align="center">SQL Notes</h2>


- [1. Introduction:](#1-introduction)
- [2. DDL:](#2-ddl)
  - [2.1. CREATE:](#21-create)
    - [2.1.1. CREATE DATABASE:](#211-create-database)
    - [2.1.2. CREATE TABLE:](#212-create-table)
      - [2.1.2.1. Schema:](#2121-schema)
        - [2.1.2.1.1. Data Types:](#21211-data-types)
          - [2.1.2.1.1.1. Numeric types:](#212111-numeric-types)
          - [2.1.2.1.1.2. String types:](#212112-string-types)
          - [2.1.2.1.1.3. Date \& Time types:](#212113-date--time-types)
          - [2.1.2.1.1.4. Others Types:](#212114-others-types)
        - [2.1.2.1.2. Constraints:](#21212-constraints)
          - [2.1.2.1.2.1. PRIMARY KEY:](#212121-primary-key)
          - [2.1.2.1.2.2. FOREIGN KEY:](#212122-foreign-key)
          - [2.1.2.1.2.3. NOT NULL:](#212123-not-null)
          - [2.1.2.1.2.4. UNIQUE:](#212124-unique)
          - [2.1.2.1.2.5. CHECK:](#212125-check)
          - [2.1.2.1.2.6. DEFAULT:](#212126-default)
          - [2.1.2.1.2.7. SERIAL:](#212127-serial)
          - [2.1.2.1.2.8. IDENTITY:](#212128-identity)
  - [2.2. ALTER:](#22-alter)
    - [2.2.1. Database Level:](#221-database-level)
      - [2.2.1.1. Rename database:](#2211-rename-database)
    - [2.2.2. Table Level:](#222-table-level)
      - [2.2.2.1. Rename table:](#2221-rename-table)
      - [2.2.2.2. Add table constraint:](#2222-add-table-constraint)
      - [2.2.2.3. Remove table Constraints:](#2223-remove-table-constraints)
    - [2.2.3. Column Level:](#223-column-level)
      - [2.2.3.1. Add column:](#2231-add-column)
      - [2.2.3.2. Drop column:](#2232-drop-column)
      - [2.2.3.3. Rename column:](#2233-rename-column)
      - [2.2.3.4. Change column data types:](#2234-change-column-data-types)
      - [2.2.3.5. Add/DROP constraints(NOT NULL \& DEFAULT):](#2235-adddrop-constraintsnot-null--default)
  - [2.3. DROP:](#23-drop)
  - [2.4. TRUNCATE:](#24-truncate)
- [3. DML:](#3-dml)
  - [3.1. INSERT:](#31-insert)
  - [3.2. UPDATE:](#32-update)
  - [3.3. DELETE:](#33-delete)
- [4. DQL:](#4-dql)
  - [4.1. Basic select operation:](#41-basic-select-operation)
  - [4.2. Clause:](#42-clause)
    - [4.2.1. Filtering (WHERE):](#421-filtering-where)
      - [4.2.1.1. Operators:](#4211-operators)
        - [4.2.1.1.1. With Arithmetic Operators (+, -, \*, /, %):](#42111-with-arithmetic-operators------)
        - [4.2.1.1.2. With Comparison Operators (=, !=, \<, \>, \<=, \>=)::](#42112-with-comparison-operators------)
        - [4.2.1.1.3. With Logical Operators (AND, OR, NOT)::](#42113-with-logical-operators-and-or-not)
        - [4.2.1.1.4. With Range Operators (IN, NOT IN, BETWEEN, NOT BETWEEN, IS NULL, IS NOT NULL)::](#42114-with-range-operators-in-not-in-between-not-between-is-null-is-not-null)
        - [4.2.1.1.5. With Pattern Operators (LIKE, ILIKE, NOTLIKE, ,NOTILIKE):](#42115-with-pattern-operators-like-ilike-notlike-notilike)
      - [4.2.1.2. Subqueries:](#4212-subqueries)
    - [4.2.2. Sorting:](#422-sorting)
      - [4.2.2.1. DISTINCT:](#4221-distinct)
      - [4.2.2.2. ORDER BY:](#4222-order-by)
      - [4.2.2.3. LIMIT \& OFFSET:](#4223-limit--offset)
    - [4.2.3. aggregations (GROUP BY, HAVING):](#423-aggregations-group-by-having)
    - [4.2.4. Joins:](#424-joins)
      - [4.2.4.1. Inner Join:](#4241-inner-join)
      - [4.2.4.2. Left Join:](#4242-left-join)
      - [4.2.4.3. Right Join:](#4243-right-join)
      - [4.2.4.4. FULL JOIN:](#4244-full-join)
      - [4.2.4.5. CROSS JOIN:](#4245-cross-join)
    - [4.2.5. Alias:](#425-alias)
  - [4.3. Common Select Functions:](#43-common-select-functions)
  - [4.4. CASE:](#44-case)
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

#### 2.1.2.1. Schema: 
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

##### 2.1.2.1.1. Data Types: 

###### 2.1.2.1.1.1. Numeric types:

| Type                        | Description                                          | Example                                  |
| --------------------------- | ---------------------------------------------------- | ---------------------------------------- |
| `SMALLINT`                  | 2 bytes (Small integer values)                       | age, quantity                            |
| `INT/INTEGER`               | 4 bytes (Standard integer values)                    | default choice                           |
| `BIGINT`                    | 8 bytes (Very large integer values)                  | large counters when overflow is possible |
| `NUMERIC(p,s)/DECIMAL(p,s)` | variable (Exact numeric values with fixed precision) | money or financial data                  |
| `REAL`                      | 4 bytes (6 decimal digits precision)                 | approximate scientific data only         |
| `DOUBLE PRECISION`          | 8 Bytes (15 decimal digits precision)                | approximate scientific data only         |

- Only PostgreSQL Specific:

| Type         | Description                                                 | Example                             |
| ------------ | ----------------------------------------------------------- | ----------------------------------- |
| `FLOAT(n)`   | alias for REAL or DOUBLE PRECISION depending on precision n | rarely used (prefer explicit types) |
| `SERIAL`     | 4 bytes same as INT (Auto increment 1, 2, 3, 4)             | For PRIMARY KEY                     |
| ` BIGSERIAL` | 8 bytes same as BIGINT (Auto increment 1, 2, 3, 4)          | For Large PRIMARY KEY               |

  

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

###### 2.1.2.1.1.2. String types:

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

###### 2.1.2.1.1.3. Date & Time types:

| Type        | Description                         | Example                            |
| ----------- | ----------------------------------- | ---------------------------------- |
| `DATE`      | Date only                           | `'2026-04-13'`                     |
| `TIME`      | Time only                           | `'14:30:00'`                       |
| `TIMESTAMP` | Date + time (no timezone)           | `'2026-04-13 14:30:00'`            |
| `INTERVAL`  | Duration / difference between times | `'2 days'`, `'3 hours 30 minutes'` |

- Only PostgreSQL Specific:

| Type          | Description                             | Example                    |
| ------------- | --------------------------------------- | -------------------------- |
| `TIMESTAMPTZ` | Date + time with timezone (recommended) | `'2026-04-13 14:30:00+06'` |



###### 2.1.2.1.1.4. Others Types: 
  
| Type           | Description          | Example   |
| -------------- | -------------------- | --------- |
| `BOOLEAN/BOOL` | true, false and null | is_active |

- only PostgreSQL Specific:

| Type            | Description                                        | Example                                  |
| --------------- | -------------------------------------------------- | ---------------------------------------- |
| `UUID`          | Universally unique identifier                      | `'550e8400-e29b-41d4-a716-446655440000'` |
| `JSON`          | Stores JSON as text (text format, slower)          | `'{"name": "Tamim"}'`                    |
| `JSONB`         | Binary JSON (faster, indexable, recommended)       | `'{"name": "Tamim"}'`                    |
| `ARRAY: TYPE[]` | Stores multiple values in one column of same types | `'{1,2,3}'`, `'{apple,banana}'`          |
| `ENUM`          | Fixed set of predefined values                     | `user_role: 'admin'`, `'seller'`         |


##### 2.1.2.1.2. Constraints:

| Constraint    | Description                         | Example                     |
| ------------- | ----------------------------------- | --------------------------- |
| `PRIMARY KEY` | Unique identifier for each row      | id                          |
| `FOREIGN KEY` | Creates relationship between tables | user_id                     |
| `NOT NULL`    | Prevent empty values                | username, email             |
| `UNIQUE`      | Prevent duplicate values            | email, username             |
| `CHECK`       | Validates data against a condition  | age must be greater than 18 |
| `DEFAULT`     | Sets default value                  | default choice              |

- Only PostgreSQL Specific:

| Constraint | Description                   | Example Use                   |
| ---------- | ----------------------------- | ----------------------------- |
| `SERIAL `  | Auto-increment value          | id generation for primary key |
| `IDENTITY` | Modern replacement for SERIAL | id generation for primary key |


###### 2.1.2.1.2.1. PRIMARY KEY: 

```sql
CREATE TABLE users (
    id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    -- id SERIAL PRIMARY KEY, -- only works on PostgreSQL
    -- id INT AUTO_INCREMENT PRIMARY KEY, -- only works on MySQL

    -- id INT PRIMARY KEY,
    email VARCHAR(255)
);
```

###### 2.1.2.1.2.2. FOREIGN KEY: 

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

###### 2.1.2.1.2.3. NOT NULL: 
  
```sql
CREATE TABLE users (
    id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    -- id SERIAL PRIMARY KEY, -- only works on PostgreSQL
    -- id INT AUTO_INCREMENT PRIMARY KEY, -- only works on MySQL

    name VARCHAR(100) NOT NULL,
    email VARCHAR(255) NOT NULL
);
``` 

###### 2.1.2.1.2.4. UNIQUE: 
  
```sql
CREATE TABLE users (
    id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    -- id SERIAL PRIMARY KEY, -- only works on PostgreSQL
    -- id INT AUTO_INCREMENT PRIMARY KEY, -- only works on MySQL

    email VARCHAR(255) UNIQUE
);
```

###### 2.1.2.1.2.5. CHECK:

```sql
CREATE TABLE products (
    id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    -- id SERIAL PRIMARY KEY, -- only works on PostgreSQL
    -- id INT AUTO_INCREMENT PRIMARY KEY, -- only works on MySQL

    price DECIMAL(10,2) CHECK (price > 0),
    stock INTEGER CHECK (stock >= 0)
);
```

###### 2.1.2.1.2.6. DEFAULT: 

```sql
CREATE TABLE users (
        id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    -- id SERIAL PRIMARY KEY, -- only works on PostgreSQL
    -- id INT AUTO_INCREMENT PRIMARY KEY, -- only works on MySQL

    is_active BOOLEAN DEFAULT TRUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
```

###### 2.1.2.1.2.7. SERIAL: 

```sql
CREATE TABLE users (
    id SERIAL PRIMARY KEY,
)
```

###### 2.1.2.1.2.8. IDENTITY: 

```sql
CREATE TABLE users (
    id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
)
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

- Primary key:

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

- Foreign key:

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

- Unique: 

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

- Check: 

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

#### 2.2.3.5. Add/DROP constraints(NOT NULL & DEFAULT):

- Not NULL:
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

- DEFAULT: 

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

## 4.2. Clause:
### 4.2.1. Filtering (WHERE):
The WHERE clause is used to filter rows.

```sql
SELECT * FROM users WHERE age > 25;
```

#### 4.2.1.1. Operators:
##### 4.2.1.1.1. With Arithmetic Operators (+, -, *, /, %):
- + = addition
- - = subtraction
- * = multiplication
- / = division
- % = modulus (remainder)

```sql
SELECT * FROM products WHERE price * quantity > 100;
```


##### 4.2.1.1.2. With Comparison Operators (=, !=, <, >, <=, >=)::
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

##### 4.2.1.1.3. With Logical Operators (AND, OR, NOT)::
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

##### 4.2.1.1.4. With Range Operators (IN, NOT IN, BETWEEN, NOT BETWEEN, IS NULL, IS NOT NULL)::

- IN = Used to check if a value is in a list of values.
- NOT IN = Used to check if a value is not in a list of values.
- BETWEEN = Used to check if a value is between two values.
- NOT BETWEEN = Used to check if a value is not between two values.
- IS NULL = Used to check if a value is NULL.
- IS NOT NULL = Used to check if a value is not NULL.

```sql
SELECT * FROM users WHERE age IN (25, 30, 35);
SELECT * FROM users WHERE age NOT IN (25, 30, 35);
SELECT * FROM users WHERE age BETWEEN 25 AND 35;
SELECT * FROM users WHERE age NOT BETWEEN 25 AND 35;
SELECT * FROM users WHERE email IS NULL;
SELECT * FROM users WHERE email IS NOT NULL;
```

##### 4.2.1.1.5. With Pattern Operators (LIKE, ILIKE, NOTLIKE, ,NOTILIKE):
- LIKE → case-sensitive pattern match
- ILIKE → case-insensitive match (PostgreSQL-specific)
- NOT LIKE → exclude pattern (case-sensitive)
- NOT ILIKE → exclude pattern (case-insensitive)

Common wildcard characters:
- 'A%' -- starts with A
- '%A' -- ends with A 
- '%A%' -- contains A 
- 'A_' -- A followed by one character

```sql
SELECT * FROM users WHERE name LIKE 'A%';
SELECT * FROM users WHERE email LIKE '%@gmail.com'; -- % before → anything before domain
SELECT * FROM users WHERE name ILIKE '%tamim%'; -- Tamim, TAMIM, taMiM all valid
```

#### 4.2.1.2. Subqueries: 
A subquery is a query written inside another query.

Users: 
| id  | name  | age |
| --- | ----- | --- |
| 1   | Tamim | 25  |
| 2   | John  | 30  |
| 3   | Sara  | 22  |

orders: 
| id  | user_id | amount |
| --- | ------- | ------ |
| 1   | 1       | 100    |
| 2   | 1       | 200    |
| 3   | 2       | 150    |


```sql
SELECT *
FROM users
WHERE id IN (
  SELECT user_id
  FROM orders
);
```

| id  | name  |
| --- | ----- |
| 1   | Tamim |
| 2   | John  |


### 4.2.2. Sorting:
#### 4.2.2.1. DISTINCT:
used to remove duplicate rows from the result-set.

```sql
SELECT DISTINCT city FROM users;
```

#### 4.2.2.2. ORDER BY:
used to sort the result-set in ascending(default) or descending order.

```sql
SELECT * FROM users ORDER BY name ASC;
```
```sql
SELECT * FROM users ORDER BY name DESC;
```


#### 4.2.2.3. LIMIT & OFFSET:
LIMIT → how many rows to return
OFFSET → how many rows to skip first

```sql
SELECT * FROM users ORDER BY id LIMIT 10 OFFSET 20;
```


### 4.2.3. aggregations (GROUP BY, HAVING):

- Aggregation Clause: 
  - GROUP BY: group rows that have the same value in a column and perform aggregations on them.
  - HAVING: filters groups AFTER grouping by using GROUP BY

- Common Aggregation Functions

| Function | Meaning        |
| -------- | -------------- |
| SUM()    | total          |
| COUNT()  | number of rows |
| AVG()    | average        |
| MAX()    | highest value  |
| MIN()    | lowest value   |


```sql
SELECT user_id, SUM(amount) AS total_spent
FROM orders
GROUP BY user_id
HAVING SUM(amount) > 200;
```

Original Table:

| id  | user_id | amount | status  |
| --- | ------- | ------ | ------- |
| 1   | 1       | 100    | paid    |
| 2   | 1       | 200    | paid    |
| 3   | 2       | 150    | pending |
| 4   | 2       | 300    | paid    |
| 5   | 3       | 50     | paid    |


Result: 
| user_id | total_spent |
| ------- | ----------- |
| 1       | 300         |
| 2       | 450         |


Without HAVING: 

```sql
SELECT user_id, SUM(amount) AS total_spent
FROM orders
GROUP BY user_id;
```

| user_id | total_spent |
| ------- | ----------- |
| 1       | 300         |
| 2       | 450         |
| 3       | 50          |




### 4.2.4. Joins:
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


#### 4.2.4.1. Inner Join:
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



#### 4.2.4.2. Left Join:
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


#### 4.2.4.3. Right Join:
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


#### 4.2.4.4. FULL JOIN: 
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


#### 4.2.4.5. CROSS JOIN: 
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

### 4.2.5. Alias: 
used to give a table or column a temporary name.

```sql
SELECT name AS full_name FROM users;
```

## 4.3. Common Select Functions:

```sql
// Aggregate Functions:
COUNT(), SUM(), AVG(), MIN(), MAX()

// Mathematical Functions:
ABS(), ROUND(), CEIL(), FLOOR(), POWER(), SQRT(), MOD(), RANDOM(), SIGN()

// String Functions:
CONCAT(), LENGTH(), LOWER(), UPPER(), TRIM(), SUBSTRING(), REPLACE(), POSITION(), LPAD(), RPAD()

// Date & Time Functions:
NOW(), CURRENT_DATE, CURRENT_TIME, AGE(), DATE_PART(), DATE_TRUNC(), EXTRACT()

// Conditional Functions:
COALESCE(), NULLIF(), GREATEST(), LEAST()

// Type Conversion Functions:
CAST(), TO_CHAR(), TO_DATE(), TO_NUMBER()

// Array Functions:
ARRAY_APPEND(), ARRAY_PREPEND(), ARRAY_REMOVE(), ARRAY_REPLACE(), ARRAY_LENGTH(), UNNEST()
```

## 4.4. CASE: 
CASE is SQL’s way of doing if-else logic inside queries.

Syntax: 

```sql
CASE
  WHEN condition THEN result
  WHEN condition THEN result
  ELSE result
END
```


- Example 1: 

| id  | name  | age | country |
| --- | ----- | --- | ------- |
| 1   | Tamim | 25  | BD      |
| 2   | John  | 17  | USA     |
| 3   | Sara  | 30  | UK      |
| 4   | Alex  | 15  | USA     |


```sql
SELECT
  name,
  age,
  CASE
    WHEN age >= 18 THEN 'Adult'
    ELSE 'Minor'
  END AS age_group
FROM users;
```

Result: 
| name  | age | age_group |
| ----- | --- | --------- |
| Tamim | 25  | Adult     |
| John  | 17  | Minor     |
| Sara  | 30  | Adult     |
| Alex  | 15  | Minor     |


Example 2: 

| id  | amount | status  |
| --- | ------ | ------- |
| 1   | 100    | paid    |
| 2   | 200    | pending |
| 3   | 300    | failed  |


```sql
SELECT
  id,
  amount,
  status,
  CASE
    WHEN status = 'paid' THEN '✅ Completed'
    WHEN status = 'pending' THEN '⏳ Processing'
    WHEN status = 'failed' THEN '❌ Rejected'
    ELSE 'Unknown'
  END AS status_label
FROM orders;
```

Result: 

| id  | amount | status  | status_label |
| --- | ------ | ------- | ------------ |
| 1   | 100    | paid    | ✅ Completed  |
| 2   | 200    | pending | ⏳ Processing |
| 3   | 300    | failed  | ❌ Rejected   |

- Example 3: With where

```sql
SELECT *
FROM users
WHERE
  CASE
    WHEN age >= 18 THEN true
    ELSE false
  END = true;
```

- Example 4: with ORDER BY

```sql
SELECT *
FROM orders
ORDER BY
  CASE
    WHEN status = 'paid' THEN 1
    WHEN status = 'pending' THEN 2
    WHEN status = 'failed' THEN 3
    ELSE 4
  END;
```

- Example 5: With Aggregation

```sql
SELECT
  COUNT(*) AS total_users,
  SUM(CASE WHEN age >= 18 THEN 1 ELSE 0 END) AS adults,
  SUM(CASE WHEN age < 18 THEN 1 ELSE 0 END) AS minors
FROM users;
```


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


