# SQL_LIBRARY_MANAGEMENT_SYSTEM
The Library Management System is a SQL-based database project designed to manage and track library operations efficiently. The project demonstrates practical database management concepts, including book inventory tracking, member management, book issuance, returns processing, and analytical reporting.

# 📚 Library Management System using MySQL

## 📌 Project Overview

The **Library Management System** is a SQL-based database project designed to manage and track library operations efficiently. The project demonstrates practical database management concepts, including book inventory tracking, member management, book issuance, returns processing, and analytical reporting.

This project was built to strengthen SQL fundamentals while applying advanced database concepts commonly used in real-world business environments.

---

## 🎯 Objective

The primary objective of this project is to:

* Design a relational database for a library.
* Manage books, members, employees, and branches.
* Track issued and returned books.
* Perform CRUD operations on library records.
* Generate business insights using SQL queries.
* Apply advanced SQL concepts to solve real-world scenarios.

---

# 🏗️ Project Structure

### 1. Database Setup

The database consists of six interconnected tables:

* **Books**
* **Members**
* **Employees**
* **Branches**
* **Issued Status**
* **Return Status**

### Entity Relationship Diagram (ERD)

![Library Database Structure](images/library-db-structure.png)

### Database Relationships

| Table         | Description                    |
| ------------- | ------------------------------ |
| books         | Stores book information        |
| member        | Stores member details          |
| employee      | Stores employee records        |
| branch        | Stores branch information      |
| issued_status | Tracks book issue transactions |
| return_status | Tracks returned books          |

---

### 2. CRUD Operations

The project includes implementation of:

#### Create

```sql
INSERT INTO books
VALUES (...);
```

#### Read

```sql
SELECT * FROM books;
```

#### Update

```sql
UPDATE books
SET rental_price = 10
WHERE isbn = '978-1234567890';
```

#### Delete

```sql
DELETE FROM books
WHERE isbn = '978-1234567890';
```

---

### 3. CTAS (Create Table As Select)

Implemented CTAS operations for creating new tables from query results.

Example:

```sql
CREATE TABLE active_members AS
SELECT *
FROM member
WHERE reg_date >= CURRENT_DATE - INTERVAL 180 DAY;
```

---

### 4. Data Analysis

Several analytical queries were developed to generate insights such as:

* Total books by category
* Most issued books
* Active members
* Rental revenue analysis
* Branch-wise performance
* Employee activity tracking
* Book availability status

---

### 5. Advanced SQL Operations

This project demonstrates the use of:

* Joins
* Aggregate Functions
* Group By
* Order By
* Subqueries
* Common Table Expressions (CTEs)
* Window Functions
* CASE Statements
* Stored Procedures
* Functions
* Date Functions

---

# 📊 Business Questions Solved

### Book Analysis

* Which category has the highest number of books?
* Which books are issued most frequently?
* Which books are currently available?

### Member Analysis

* Who are the most active members?
* Which members registered recently?

### Revenue Analysis

* Total rental income generated.
* Revenue by book category.
* Revenue trends across branches.

### Operational Analysis

* Books issued but not returned.
* Overdue returns.
* Employee-wise issue records.

---

# 🛠️ Technologies Used

* MySQL
* SQL
* MySQL Workbench
* Git
* GitHub

---

# 🚀 How to Run This Project

### Step 1: Clone Repository

```bash
git clone https://github.com/yourusername/library-management-system.git
```

### Step 2: Open MySQL Workbench

Create a new database.

### Step 3: Execute Database Script

Run:

```sql
library_management.sql
```

to create tables and load data.

### Step 4: Execute Analysis Queries

Run the SQL scripts provided in the repository to generate reports and insights.

---



---

# 💡 Key Skills Demonstrated

* Database Design
* Relational Database Management
* SQL Query Writing
* Data Analysis
* Business Reporting
* Problem Solving
* Advanced SQL Concepts
* Database Optimization

---

# 👨‍💻 Author

### Shivam Kumar Mishra

Aspiring Data Analyst passionate about SQL, Excel, Python, and Business Intelligence.

### Connect with Me

**LinkedIn:** https://www.linkedin.com/in/shivam-mishra-39427b377/)

**GitHub:** https://github.com/githubshivamMishra

---

⭐ If you found this project useful, feel free to star the repository.
