<h1 align="center">SQL Notes</h2>


- [1. Introduction:](#1-introduction)
- [2. DDL:](#2-ddl)
  - [2.1. CREATE:](#21-create)
    - [2.1.1. CREATE DATABASE:](#211-create-database)
    - [2.1.2. CREATE TABLE:](#212-create-table)
      - [2.1.2.1. Schema:](#2121-schema)
        - [2.1.2.1.1. Common Data Types for Schema](#21211-common-data-types-for-schema)
        - [2.1.2.1.2. Common Constraints for Schema:](#21212-common-constraints-for-schema)
  - [2.2. ALTER:](#22-alter)
  - [2.3. DROP:](#23-drop)
  - [2.4. TRUNCATE:](#24-truncate)
  - [2.5. RENAME:](#25-rename)
- [3. DML:](#3-dml)
- [4. DQL:](#4-dql)
- [5. DCL:](#5-dcl)
- [6. TCL:](#6-tcl)



# 1. Introduction: 
SQL (Structured Query Language) is a standardized language for all relational databases management systems. Every RDBMS, such as MySQL and PostgreSQL etc, uses SQL as its primary language and add extra specific features on it. There are 5 main categories of SQL Commands: 

| Category | Full Form                    | commands                                | Purpose                                                       |
| -------- | ---------------------------- | --------------------------------------- | ------------------------------------------------------------- |
| DDL      | Data Definition Language     | `CREATE, ALTER, DROP, TRUNCATE, RENAME` | Define and modify database structure (e.g. databases, tables) |
| DML      | Data Manipulation Language   | `INSERT, UPDATE, DELETE`                | Insert, update, and delete data form tables                   |
| DQL      | Data Query Language          | `SELECT`                                | Retrieve data from tables                                     |
| DCL      | Data Control Language        | `GRANT, REVOKE`                         | Control permissions and access                                |
| TCL      | Transaction Control Language | `BEGIN, COMMIT, ROLLBACK, SAVEPOINT`    | Manage transactions                                           |

![image](./assets/images/introduction/sql_commands.webp)

Note: SQL is a query language and cannot run independently. It requires a DBMS specifically RDBMS, such as MySQL or PostgreSQL etc to run.

# 2. DDL:
DDL (Data Definition Language) is used to define and modify database structure (e.g. databases, tables). It includes commands such as `CREATE`, `ALTER`, `DROP`, `TRUNCATE`, and `RENAME`.

## 2.1. CREATE:
The `CREATE` command used to create new databases or tables.

### 2.1.1. CREATE DATABASE:  

```sql
CREATE DATABASE database_name;
```

### 2.1.2. CREATE TABLE:

```sql
CREATE TABLE table_name (
    .....schema.....
    .....schema.....
    .....schema.....
);
```

#### 2.1.2.1. Schema: 
A schema defines the structure of a table, including:
- Column names
- Data types
- Constraints
- Relationships

```sql
CREATE TABLE table_name (
    column_name data_type constraints,
    column_name data_type constraints
);
```
**Note:** Here everything inside the parentheses is called a schema


##### 2.1.2.1.1. Common Data Types for Schema

- Numeric Types:

| Type               | Description                                                | Example             |
| ------------------ | ---------------------------------------------------------- | ------------------- |
| `SMALLINT`         | Small integer (-32,768 to 32,767 typical)                  | age, quantity       |
| `INTEGER`          | Standard integer (-2,147,483,648 to 2,147,483,647 typical) | default choice      |
| `BIGINT`           | Large integer                                              | large counters      |
| `NUMERIC(p,s)`     | Exact precision numbers                                    | money, exact values |
| `DECIMAL(p,s)`     | Exact precision decimal numbers                            | prices              |
| `REAL`             | Approximate float (~6 decimal digits precision)            | scientific data     |
| `DOUBLE PRECISION` | Approximate float (~15 decimal digits precision)           | scientific data     |
| `FLOAT(p)`         | Floating-point number with specified precision             | rarely used         |

```sql
CREATE TABLE numeric_types_demo (
    id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,

    small_number SMALLINT,
    normal_number INTEGER,
    big_number BIGINT,

    exact_money DECIMAL(10,2),
    exact_precise NUMERIC(10,6),

    approx_real REAL,
    approx_double DOUBLE PRECISION
);
```

- Character Types:
| Type                   | Description                       | Example                     |
| ---------------------- | --------------------------------- | --------------------------- |
| `CHAR(n)`              | Fixed-length string               | country code, currency code |
| `CHARACTER(n)`         | Same as CHAR(n)                   | fixed-length values         |
| `VARCHAR(n)`           | Variable-length string with limit | names, titles               |
| `CHARACTER VARYING(n)` | Same as VARCHAR(n)                | names, titles               |
| `CLOB`                 | Large text content                | articles, descriptions      |

```sql
CREATE TABLE string_types_demo (
    id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,

    fixed_char CHAR(5),
    short_text VARCHAR(50),
    long_text CLOB
);
```

- Date and Time Types:

| Type                       | Description               | Example                       |
| -------------------------- | ------------------------- | ----------------------------- |
| `DATE`                     | Stores date only          | `'2026-04-13'`                |
| `TIME`                     | Stores time only          | `'14:30:00'`                  |
| `TIME WITH TIME ZONE`      | Time with timezone        | `'14:30:00+06:00'`            |
| `TIMESTAMP`                | Date + time               | `'2026-04-13 14:30:00'`       |
| `TIMESTAMP WITH TIME ZONE` | Date + time with timezone | `'2026-04-13 14:30:00+06:00'` |
| `INTERVAL`                 | Duration between times    | `'2 days'`                    |


```sql
CREATE TABLE datetime_types_demo (
    id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,

    only_date DATE,
    only_time TIME,

    time_with_zone TIME WITH TIME ZONE,

    simple_timestamp TIMESTAMP,
    timestamp_with_zone TIMESTAMP WITH TIME ZONE,

    duration INTERVAL
);
```

- Boolean Type: 

| Type      | Description       | Example   |
| --------- | ----------------- | --------- |
| `BOOLEAN` | TRUE, FALSE, NULL | is_active |

```sql
CREATE TABLE boolean_demo (
    id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,

    is_active BOOLEAN
);
```

##### 2.1.2.1.2. Common Constraints for Schema:  
Constraints enforce rules on data stored in a table.

| Constraint              | Description                         |
| ----------------------- | ----------------------------------- |
| PRIMARY KEY             | Uniquely identifies each row        |
| FOREIGN KEY             | Creates relationship between tables |
| NOT NULL                | Prevents NULL values                |
| UNIQUE                  | Ensures all values are unique       |
| DEFAULT                 | Provides a default value            |
| CHECK                   | Validates data based on a condition |
| AUTO INCREMENT / SERIAL | Automatically generates values      |

```sql
CREATE TABLE orders (
    id SERIAL PRIMARY KEY,
    user_id INT REFERENCES users(id)
    -- or
    -- user_id INT,
    -- FOREIGN KEY (user_id) REFERENCES users(id)
);
```

```sql
CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    is_active BOOLEAN DEFAULT TRUE
);
```

```sql
CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    age INT CHECK (age >= 18)
);
```

## 2.2. ALTER:
The `ALTER` command is used to modify existing table.

```sql
CREATE TABLE users (
    id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,

    name VARCHAR(50),
    email VARCHAR(100) UNIQUE NOT NULL,
    description TEXT,
);
```

Now if we want to modify the table, we can use the `ALTER` command.

```sql
ALTER TABLE users ADD COLUMN password VARCHAR(100);
ALTER TABLE users ADD COLUMN phone VARCHAR(20);
ALTER TABLE users DROP COLUMN description;
ALTER TABLE users RENAME COLUMN name TO full_name;

-- or
ALTER TABLE users
    ADD COLUMN password VARCHAR(100),
    ADD COLUMN phone VARCHAR(20)
    DROP COLUMN description;
    RENAME COLUMN name TO full_name
```

Change Data Type: 

```sql
ALTER TABLE users
ALTER COLUMN mobile TYPE VARCHAR(50);
```

Set NOT NULL:

```sql
ALTER TABLE users
ALTER COLUMN name SET NOT NULL;
```

```sql
ALTER TABLE users
ALTER COLUMN name DROP NOT NULL;
```

Add Constraint: 

```sql
ALTER TABLE users
ADD CONSTRAINT unique_email
UNIQUE(email);
```

Drop Constraint: 

```sql
ALTER TABLE users
DROP CONSTRAINT unique_email;
```

Rename Table: 
```sql
ALTER TABLE users
RENAME TO customers;
```


## 2.3. DROP: 
The `DROP` command permanently removes databases or tables.

Drop Table: 

```sql
DROP TABLE users;
```

Drop Table If Exists: 

```sql
DROP TABLE IF EXISTS users;
```

Drop Multiple Tables: 

```sql
DROP TABLE users, orders;
```

Drop Database: 

```sql
Drop Database
```


## 2.4. TRUNCATE:
## 2.5. RENAME:


# 3. DML: 
# 4. DQL:
# 5. DCL:
# 6. TCL: