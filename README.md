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


  <img width="1740" height="1282" alt="Library_db-Schema" src="https://github.com/user-attachments/assets/8d108228-c532-4ec4-bb57-abc1bc5f0de4" />


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
INSERT INTO books(isbn, book_title, category, rental_price, status, author, publisher) 
VALUES
('978-0-553-29698-2', 'The Catcher in the Rye', 'Classic', 7.00, 'yes', 'J.D. Salinger', 'Little, Brown and Company'),
('978-0-330-25864-8', 'Animal Farm', 'Classic', 5.50, 'yes', 'George Orwell', 'Penguin Books');
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

# 📊 SQL Tasks & Business Problems Solved

The project includes several real-world SQL scenarios designed to improve database management and analytical skills.

### 1. Overdue Book Identification

* Identified members who have not returned books within the allowed 30-day period.
* Calculated the number of days overdue for each issued book.

### 2. Book Status Management

* Updated book availability status automatically when books were returned.
* Ensured accurate inventory tracking within the library system.

```sql
ROP PROCEDURE IF EXISTS add_return_stat;

create procedure add_return_stat(p_return_id varchar(20),p_issued_id varchar(20))
begin
	
	declare i_isbn varchar(40);
	declare	i_name varchar(75);
	
	-- sql statement
	-- insert into return_status table 
	insert into return_status(return_id,issued_id,return_date)
	values(p_return_id,p_issued_id,current_date);
	

	select 
		issued_book_isbn,
		issued_book_name
		into i_isbn,i_name
	from issued_status
	where issued_id=p_issued_id;
	

	update books
	set status='yes'
	where isbn=i_isbn;
	
	select concat('Thnak you for returning the book :',i_name ) as message;
	
end;

call add_return_stat('RS141','IS135');

```
 

### 3. Branch Performance Analysis

Generated branch-level performance reports including:

* Total books issued
* Total books returned
* Total rental revenue generated

### 4. Active Member Identification (CTAS)

* Created a separate table containing members who issued at least one book within the last two months.
* Demonstrated the use of CREATE TABLE AS SELECT (CTAS).

### 5. Employee Performance Analysis

* Identified the top 3 employees who processed the highest number of book issues.
* Included branch-level employee performance tracking.

### 6. Stored Procedure for Book Issuance

* Developed a stored procedure to automate book issuance.
* Checked book availability before issuing.
* Updated book status dynamically.
* Returned appropriate messages when books were unavailable.

```sql
drop PROCEDURE  if exists book_status;

create procedure book_status(p_issued_id varchar(30),p_issued_member_id varchar(40),p_issued_book_isbn varchar(40),p_emp_id varchar(45))



begin
	declare v_status varchar(30);
	-- sql statement 
	select 
		status
		into v_status
	from books
	where isbn=p_issued_book_isbn;
	
	IF v_status='yes' THEN
	-- insert into issued_status table
		
			insert into issued_status(issued_id,issued_member_id,issued_date,issued_book_isbn,issued_emp_id)
			values(p_issued_id,p_issued_member_id,CURRENT_DATE(),p_issued_book_isbn,p_emp_id);
		
	update books
	set status='no'
	where isbn=p_issued_book_isbn;
	
		select 'your requested book issued successfully',p_issued_book_isbn;
		
	ELSE	
		
		select 'sorry your requested book is not available:',p_issued_book_isbn;
		
	END IF;
	
	
end;

call book_status('IS301','C106','978-0-385-33312-0','E104');

```

  

### 7. Overdue Books & Fine Calculation (CTAS)

* Created a table containing members with overdue books.
* Calculated overdue fines based on a daily penalty rate.
* Generated member-level overdue summaries.

### 8. Advanced SQL Operations

Applied advanced SQL concepts including:

* Joins
* Aggregate Functions
* Group By
* Subqueries
* Common Table Expressions (CTEs)
* Stored Procedures
* CTAS
* Date Functions
* Conditional Logic

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
