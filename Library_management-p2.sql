create database Library_db;

use Library_db;

show tables;

Create table branch(
	branch_id varchar(20) primary key,
	manager_id varchar(20), 
	branch_address varchar(20),
	contact_no int 
);

create table books(
	isbn varchar(25) primary key,
	book_title	varchar(70),
	category varchar(50),
	rental_price	float,
	status	varchar(30),
	author varchar(80)	,
	publisher varchar(30)
	);


CREATE table employee(
	emp_id varchar(20) primary key,
	emp_name varchar(50),
	position	varchar(30),
	salary	int,
	branch_id varchar(20)); -- fk


create table issued_status
	(issued_id	varchar(30) primary key,
	issued_member_id varchar(40), -- fk
	issued_book_name	varchar(30),
	issued_date date,
	issued_book_isbn varchar(40), -- fk
	issued_emp_id varchar(45) -- fk
	);


create table member(
member_id	varchar(20) primary key,
member_name	varchar(40),
member_address	varchar(80),
reg_date date
);


create table return_status(
	return_id	varchar(20) primary key,
	issued_id	varchar(20), -- fk
	return_book_name	varchar(20),
	return_date	date,
	return_book_isbn varchar(20) -- fk
);

show tables;

-- assigning foreign keys to table 

alter table issued_status
add CONSTRAINT fk_member
FOREIGN KEY (issued_member_id)
References member(member_id);

alter table issued_status
add CONSTRAINT fk_books
FOREIGN KEY (issued_book_isbn)
References books(isbn);

alter table issued_status
add CONSTRAINT fk_emp
FOREIGN KEY (issued_emp_id)
References employee(emp_id);

alter table return_status
add CONSTRAINT fk_issued
FOREIGN KEY (issued_id)
References issued_status(issued_id);

alter table return_status
add CONSTRAINT fk_bookss
FOREIGN KEY (return_book_isbn)
References books(isbn);

alter table employee
add CONSTRAINT fk_branch
FOREIGN KEY (branch_id)
References branch(branch_id);


-- Inserting into books table 
INSERT INTO books(isbn, book_title, category, rental_price, status, author, publisher) 
VALUES
('978-0-553-29698-2', 'The Catcher in the Rye', 'Classic', 7.00, 'yes', 'J.D. Salinger', 'Little, Brown and Company'),
('978-0-330-25864-8', 'Animal Farm', 'Classic', 5.50, 'yes', 'George Orwell', 'Penguin Books'),
('978-0-14-118776-1', 'One Hundred Years of Solitude', 'Literary Fiction', 6.50, 'yes', 'Gabriel Garcia Marquez', 'Penguin Books'),
('978-0-525-47535-5', 'The Great Gatsby', 'Classic', 8.00, 'yes', 'F. Scott Fitzgerald', 'Scribner'),
('978-0-141-44171-6', 'Jane Eyre', 'Classic', 4.00, 'yes', 'Charlotte Bronte', 'Penguin Classics'),
('978-0-307-37840-1', 'The Alchemist', 'Fiction', 2.50, 'yes', 'Paulo Coelho', 'HarperOne'),
('978-0-679-76489-8', 'Harry Potter and the Sorcerers Stone', 'Fantasy', 7.00, 'yes', 'J.K. Rowling', 'Scholastic'),
('978-0-7432-4722-4', 'The Da Vinci Code', 'Mystery', 8.00, 'yes', 'Dan Brown', 'Doubleday'),
('978-0-09-957807-9', 'A Game of Thrones', 'Fantasy', 7.50, 'yes', 'George R.R. Martin', 'Bantam'),
('978-0-393-05081-8', 'A Peoples History of the United States', 'History', 9.00, 'yes', 'Howard Zinn', 'Harper Perennial'),
('978-0-19-280551-1', 'The Guns of August', 'History', 7.00, 'yes', 'Barbara W. Tuchman', 'Oxford University Press'),
('978-0-307-58837-1', 'Sapiens: A Brief History of Humankind', 'History', 8.00, 'no', 'Yuval Noah Harari', 'Harper Perennial'),
('978-0-375-41398-8', 'The Diary of a Young Girl', 'History', 6.50, 'no', 'Anne Frank', 'Bantam'),
('978-0-14-044930-3', 'The Histories', 'History', 5.50, 'yes', 'Herodotus', 'Penguin Classics'),
('978-0-393-91257-8', 'Guns, Germs, and Steel: The Fates of Human Societies', 'History', 7.00, 'yes', 'Jared Diamond', 'W. W. Norton & Company'),
('978-0-7432-7357-1', '1491: New Revelations of the Americas Before Columbus', 'History', 6.50, 'no', 'Charles C. Mann', 'Vintage Books'),
('978-0-679-64115-3', '1984', 'Dystopian', 6.50, 'yes', 'George Orwell', 'Penguin Books'),
('978-0-14-143951-8', 'Pride and Prejudice', 'Classic', 5.00, 'yes', 'Jane Austen', 'Penguin Classics'),
('978-0-452-28240-7', 'Brave New World', 'Dystopian', 6.50, 'yes', 'Aldous Huxley', 'Harper Perennial'),
('978-0-670-81302-4', 'The Road', 'Dystopian', 7.00, 'yes', 'Cormac McCarthy', 'Knopf'),
('978-0-385-33312-0', 'The Shining', 'Horror', 6.00, 'yes', 'Stephen King', 'Doubleday'),
('978-0-451-52993-5', 'Fahrenheit 451', 'Dystopian', 5.50, 'yes', 'Ray Bradbury', 'Ballantine Books'),
('978-0-345-39180-3', 'Dune', 'Science Fiction', 8.50, 'yes', 'Frank Herbert', 'Ace'),
('978-0-375-50167-0', 'The Road', 'Dystopian', 7.00, 'yes', 'Cormac McCarthy', 'Vintage'),
('978-0-06-025492-6', 'Where the Wild Things Are', 'Children', 3.50, 'yes', 'Maurice Sendak', 'HarperCollins'),
('978-0-06-112241-5', 'The Kite Runner', 'Fiction', 5.50, 'yes', 'Khaled Hosseini', 'Riverhead Books'),
('978-0-06-440055-8', 'Charlotte''s Web', 'Children', 4.00, 'yes', 'E.B. White', 'Harper & Row'),
('978-0-679-77644-3', 'Beloved', 'Fiction', 6.50, 'yes', 'Toni Morrison', 'Knopf'),
('978-0-14-027526-3', 'A Tale of Two Cities', 'Classic', 4.50, 'yes', 'Charles Dickens', 'Penguin Books'),
('978-0-7434-7679-3', 'The Stand', 'Horror', 7.00, 'yes', 'Stephen King', 'Doubleday'),
('978-0-451-52994-2', 'Moby Dick', 'Classic', 6.50, 'yes', 'Herman Melville', 'Penguin Books'),
('978-0-06-112008-4', 'To Kill a Mockingbird', 'Classic', 5.00, 'yes', 'Harper Lee', 'J.B. Lippincott & Co.'),
('978-0-553-57340-1', '1984', 'Dystopian', 6.50, 'yes', 'George Orwell', 'Penguin Books'),
('978-0-7432-4722-5', 'Angels & Demons', 'Mystery', 7.50, 'yes', 'Dan Brown', 'Doubleday'),
('978-0-7432-7356-4', 'The Hobbit', 'Fantasy', 7.00, 'yes', 'J.R.R. Tolkien', 'Houghton Mifflin Harcourt');

select * 
from books;

ALTER TABLE branch
MODIFY COLUMN contact_no varchar(25);


-- Insert values into each branch table
INSERT INTO branch(branch_id, manager_id, branch_address, contact_no) 
VALUES
('B001', 'E109', '123 Main St', '+919099988676'),
('B002', 'E109', '456 Elm St', '+919099988677'),
('B003', 'E109', '789 Oak St', '+919099988678'),
('B004', 'E110', '567 Pine St', '+919099988679'),
('B005', 'E110', '890 Maple St', '+919099988680');
SELECT * FROM branch;


ALTER TABLE branch
MODIFY COLUMN contact_no varchar(25);


-- Insert values into each employee table
INSERT INTO employee(emp_id, emp_name, position, salary, branch_id) 
VALUES
('E101', 'John Doe', 'Clerk', 60000.00, 'B001'),
('E102', 'Jane Smith', 'Clerk', 45000.00, 'B002'),
('E103', 'Mike Johnson', 'Librarian', 55000.00, 'B001'),
('E104', 'Emily Davis', 'Assistant', 40000.00, 'B001'),
('E105', 'Sarah Brown', 'Assistant', 42000.00, 'B001'),
('E106', 'Michelle Ramirez', 'Assistant', 43000.00, 'B001'),
('E107', 'Michael Thompson', 'Clerk', 62000.00, 'B005'),
('E108', 'Jessica Taylor', 'Clerk', 46000.00, 'B004'),
('E109', 'Daniel Anderson', 'Manager', 57000.00, 'B003'),
('E110', 'Laura Martinez', 'Manager', 41000.00, 'B005'),
('E111', 'Christopher Lee', 'Assistant', 65000.00, 'B005');

SELECT * FROM employee;

ALTER TABLE issued_status
MODIFY COLUMN issued_book_name varchar(75);


-- inserting into issued table
INSERT INTO issued_status(issued_id, issued_member_id, issued_book_name, issued_date, issued_book_isbn, issued_emp_id) 
VALUES
('IS106', 'C106', 'Animal Farm', '2024-03-10', '978-0-330-25864-8', 'E104'),
('IS107', 'C107', 'One Hundred Years of Solitude', '2024-03-11', '978-0-14-118776-1', 'E104'),
('IS108', 'C108', 'The Great Gatsby', '2024-03-12', '978-0-525-47535-5', 'E104'),
('IS109', 'C109', 'Jane Eyre', '2024-03-13', '978-0-141-44171-6', 'E105'),
('IS110', 'C110', 'The Alchemist', '2024-03-14', '978-0-307-37840-1', 'E105'),
('IS111', 'C109', 'Harry Potter and the Sorcerers Stone', '2024-03-15', '978-0-679-76489-8', 'E105'),
('IS112', 'C109', 'A Game of Thrones', '2024-03-16', '978-0-09-957807-9', 'E106'),
('IS113', 'C109', 'A Peoples History of the United States', '2024-03-17', '978-0-393-05081-8', 'E106'),
('IS114', 'C109', 'The Guns of August', '2024-03-18', '978-0-19-280551-1', 'E106'),
('IS115', 'C109', 'The Histories', '2024-03-19', '978-0-14-044930-3', 'E107'),
('IS116', 'C110', 'Guns, Germs, and Steel: The Fates of Human Societies', '2024-03-20', '978-0-393-91257-8', 'E107'),
('IS117', 'C110', '1984', '2024-03-21', '978-0-679-64115-3', 'E107'),
('IS118', 'C101', 'Pride and Prejudice', '2024-03-22', '978-0-14-143951-8', 'E108'),
('IS119', 'C110', 'Brave New World', '2024-03-23', '978-0-452-28240-7', 'E108'),
('IS120', 'C110', 'The Road', '2024-03-24', '978-0-670-81302-4', 'E108'),
('IS121', 'C102', 'The Shining', '2024-03-25', '978-0-385-33312-0', 'E109'),
('IS122', 'C102', 'Fahrenheit 451', '2024-03-26', '978-0-451-52993-5', 'E109'),
('IS123', 'C103', 'Dune', '2024-03-27', '978-0-345-39180-3', 'E109'),
('IS124', 'C104', 'Where the Wild Things Are', '2024-03-28', '978-0-06-025492-6', 'E110'),
('IS125', 'C105', 'The Kite Runner', '2024-03-29', '978-0-06-112241-5', 'E110'),
('IS126', 'C105', 'Charlotte''s Web', '2024-03-30', '978-0-06-440055-8', 'E110'),
('IS127', 'C105', 'Beloved', '2024-03-31', '978-0-679-77644-3', 'E110'),
('IS128', 'C105', 'A Tale of Two Cities', '2024-04-01', '978-0-14-027526-3', 'E110'),
('IS129', 'C105', 'The Stand', '2024-04-02', '978-0-7434-7679-3', 'E110'),
('IS130', 'C106', 'Moby Dick', '2024-04-03', '978-0-451-52994-2', 'E101'),
('IS131', 'C106', 'To Kill a Mockingbird', '2024-04-04', '978-0-06-112008-4', 'E101'),
('IS132', 'C106', 'The Hobbit', '2024-04-05', '978-0-7432-7356-4', 'E106'),
('IS133', 'C107', 'Angels & Demons', '2024-04-06', '978-0-7432-4722-5', 'E106'),
('IS134', 'C107', 'The Diary of a Young Girl', '2024-04-07', '978-0-375-41398-8', 'E106'),
('IS135', 'C107', 'Sapiens: A Brief History of Humankind', '2024-04-08', '978-0-307-58837-1', 'E108'),
('IS136', 'C107', '1491: New Revelations of the Americas Before Columbus', '2024-04-09', '978-0-7432-7357-1', 'E102'),
('IS137', 'C107', 'The Catcher in the Rye', '2024-04-10', '978-0-553-29698-2', 'E103'),
('IS138', 'C108', 'The Great Gatsby', '2024-04-11', '978-0-525-47535-5', 'E104'),
('IS139', 'C109', 'Harry Potter and the Sorcerers Stone', '2024-04-12', '978-0-679-76489-8', 'E105'),
('IS140', 'C110', 'Animal Farm', '2024-04-13', '978-0-330-25864-8', 'E102');

select * from issued_status;

-- insert into member table
INSERT INTO member(member_id, member_name, member_address, reg_date) 
VALUES
('C101', 'Alice Johnson', '123 Main St', '2021-05-15'),
('C102', 'Bob Smith', '456 Elm St', '2021-06-20'),
('C103', 'Carol Davis', '789 Oak St', '2021-07-10'),
('C104', 'Dave Wilson', '567 Pine St', '2021-08-05'),
('C105', 'Eve Brown', '890 Maple St', '2021-09-25'),
('C106', 'Frank Thomas', '234 Cedar St', '2021-10-15'),
('C107', 'Grace Taylor', '345 Walnut St', '2021-11-20'),
('C108', 'Henry Anderson', '456 Birch St', '2021-12-10'),
('C109', 'Ivy Martinez', '567 Oak St', '2022-01-05'),
('C110', 'Jack Wilson', '678 Pine St', '2022-02-25'),
('C118', 'Sam', '133 Pine St', '2024-06-01'),    
('C119', 'John', '143 Main St', '2024-05-01');

SELECT * FROM member;

ALTER TABLE return_status
DROP FOREIGN KEY fk_bookss;

ALTER TABLE return_status
DROP column return_book_name;

ALTER TABLE return_status
DROP column return_book_isbn;


-- inserting into return table
INSERT INTO return_status(return_id, issued_id, return_date) 
VALUES
('RS104', 'IS106', '2024-05-01'),
('RS105', 'IS107', '2024-05-03'),
('RS106', 'IS108', '2024-05-05'),
('RS107', 'IS109', '2024-05-07'),
('RS108', 'IS110', '2024-05-09'),
('RS109', 'IS111', '2024-05-11'),
('RS110', 'IS112', '2024-05-13'),
('RS111', 'IS113', '2024-05-15'),
('RS112', 'IS114', '2024-05-17'),
('RS113', 'IS115', '2024-05-19'),
('RS114', 'IS116', '2024-05-21'),
('RS115', 'IS117', '2024-05-23'),
('RS116', 'IS118', '2024-05-25'),
('RS117', 'IS119', '2024-05-27'),
('RS118', 'IS120', '2024-05-29');

SELECT * FROM return_status;



SELECT * from books;
SELECT * from branch;
SELECT * from employee;
SELECT * from issued_status;
SELECT * from member;
SELECT * from return_status;

 --                              ** CRUD **        --

-- 1. Create a New Book Record -- "978-1-60129-456-2', 
-- 'To Kill a Mockingbird', 'Classic', 6.00, 'yes', 'Harper Lee', 'J.B. Lippincott & Co.')"

insert into books(isbn,book_title,category ,rental_price,status,author,publisher)
			values('978-1-60129-456-2', 'To Kill a Mockingbird', 'Classic', 6.00, 'yes', 'Harper Lee', 'J.B. Lippincott & Co.');

-- 2: Update an Existing Member's Address** '125 Oak St' where at C103

update member
set member_address='125 Oak St'
where member_id='C103';

-- 3: Delete a Record from the Issued Status Table**
-- Objective: Delete the record with issued_id = 'IS121' from the issued_status table.

delete from issued_status
where issued_id='IS121';


-- **Task 4: Retrieve All Books Issued by a Specific Employee**
-- Objective: Select all books issued by the employee with emp_id = 'E101'.

select * 
from issued_status
where issued_emp_id='E101';


-- **Task 5: List Members Who Have Issued More Than One Book**
-- Objective: Use GROUP BY to find members who have issued more than one book.

select
	issued_member_id,
	count(issued_id)
from issued_status
group by 1
having count(issued_id)>1;


--                    **CTAS (Create Table As Select)** --


-- 6: Create Summary Tables: Used CTAS to generate new tables based on query results 
-- each book and total book_issued_cnt**


create table book_issued_cnt as 
		(SELECT
		    issued_book_name,
		    COUNT(*) AS issued_cnt
		FROM issued_status
		GROUP BY issued_book_name);

select * 
from book_issued_cnt;

--                           **    DATA ANALYSIS **         ---

-- 7. Retrieve All Books in a Specific Category:-'Classic'

select * 
from books
where category='Classic';

-- Find Total Rental Income by Category:

select 
	b.category,
	sum(b.rental_price)
from issued_status i 
JOIN books b
on i.issued_book_isbn=b.isbn
group by 1;


-- List Members Who Registered in the Last 180 Days:

SELECT *
FROM member
WHERE reg_date = DATE_SUB(CURRENT_DATE(), INTERVAL 180 DAY);

select * from member;

insert into member(member_id,member_name,member_address,reg_date)
	values('C1001','Shivam Mishra','455 Link road','2026-01-01'),
		('C1002','Munna Jha','455 Peddar road','2026-02-01');

-- List Employees with Their Branch Manager's Name and their branch details:


select 
	e.emp_id,
	e.emp_name,
	e.position,
	b.manager_id,
	e1.position,
	b.branch_id
from employee e
join branch b
	on e.branch_id=b.branch_id
join employee e1
	on b.manager_id=e1.emp_id

-- 11. Create a Table of Books with Rental Price Above a Certain Threshold:->7.00

create table rentalbooksprice as 	
select * 
from books
where rental_price>7.00

select * from rentalbooksprice

-- 12: Retrieve the List of Books Not Yet Returned


select
	i.issued_id,
	i.issued_emp_id,
	i.issued_book_name
from issued_status i
left join return_status r
	on i.issued_id=r.issued_id 
where r.issued_id is null


--                    **Advance SQL operation**       --

-- 13: Identify Members with Overdue Books
-- Write a query to identify members who have overdue books
-- (assume a 30-day return period). Display the member's_id, member's name, book title, issue date, and days overdue.
-- i am going to find overdues which got return 

with issued as (
	
select 
	i.issued_id,
	i.issued_date,
	r.return_date,
	abs(DATEDIFF(i.issued_date,r.return_date)) as Overduesbook
from issued_status i
join return_status r
	on i.issued_id=r.issued_id
	
)
, mbr as (
 Select 
	m.member_id,
	m.member_name,
	b.book_title,
	i.issued_id
from member m
join issued_status i
	on i.issued_member_id=m.member_id
join books b
	on i.issued_book_isbn=b.isbn
)

select 
	mr.member_id,
	mr.member_name,
	mr.book_title,
	iu.issued_date,
	iu.Overduesbook
from issued iu
join mbr mr
	on iu.issued_id=mr.issued_id

-- 14: Update Book Status on Return
-- Write a query to update the status of books in the books table to "Yes" when they are returned (based on entries in the return_status table).

/*
 * 
	have to create store procedure 
  
-- schema ->books,return_status-issued_status

 */

DROP PROCEDURE IF EXISTS add_return_stat;

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

select * 
from return_status
where return_id='RS141'




-- 15: Branch Performance Report
-- Create a query that generates a performance report for each branch, showing the number of books issued, 
-- the number of books returned, and the total revenue generated from book rentals.

create table BranchReport as 
with cte as (
	
	select 
	i.issued_id,
	i.issued_book_name,
	i.issued_date,
	e.emp_name,
	b.branch_id,
	bs.rental_price
from issued_status i 
left join employee e
	on i.issued_emp_id=e.emp_id
left join branch b
	on e.branch_id=b.branch_id
join books bs
 	on i.issued_book_isbn=bs.isbn
)

select 
	c.branch_id,
	count(distinct c.issued_id) as icnt,
	count(distinct r.return_id) as rcnt,
	sum(c.rental_price) as irp
from cte c
left join return_status r
	on c.issued_id=r.issued_id
group by 1
	
select * 
from BranchReport;



--  16: CTAS: Create a Table of Active Members
-- Use the CREATE TABLE AS (CTAS) statement to create a new table active_members containing members who have issued at least one book in the last 2 months.

/*
 
  Schema->issued_status-member 
  
 */

-- first we inserted 3 records of last 2 month date
-- inserting into issued table
INSERT INTO issued_status(issued_id, issued_member_id, issued_book_name, issued_date, issued_book_isbn, issued_emp_id) 
VALUES
('IS201', 'C201', 'Animal Farm', '2026-04-10', '978-0-330-25864-8', 'E104'),
('IS202', 'C202', 'One Hundred Years of Solitude', '2026-05-11', '978-0-14-118776-1', 'E104'),
('IS203', 'C203', 'The Great Gatsby', '2026-05-12', '978-0-525-47535-5', 'E104')


-- insert into member table
INSERT INTO member(member_id, member_name, member_address, reg_date) 
VALUES
('C203', 'alex steve', '442 slum St', '2026-04-20'),
('C201', 'Alice bomber', '123 kinl St', '2024-05-15'),
('C202', 'Bob steve', '456 slum St', '2023-06-20')



create  table active_member as 
select 
	m.member_id,
	m.member_name,
	i.issued_id,
	i.issued_date
from issued_status i
left join member m
	on i.issued_member_id=m.member_id
where i.issued_date>=CURDATE() - INTERVAL 2 MONTH 


select * 
from active_member

-- 17: Find Employees with the Most Book Issues Processed
-- Write a query to find the top 3 employees who have processed the most book issues. Display the employee name, number of books processed, and their branch.

-- schema ->issued_status->employee->branch

with book_issued as (
	
select 
	e.emp_id,
	count(i.issued_id) as cnt,
	b.branch_id,
	dense_rank() over(ORDER  by count(i.issued_id) desc) as rnk
	
from issued_status i
join employee e
	on i.issued_emp_id=e.emp_id
JOIN branch b
	on e.branch_id=b.branch_id
group by 1
order by 2 desc

)

select * 
from book_issued
where rnk<=3
 	

/*

18: Stored Procedure Objective: Create a stored procedure to manage the status of books in a library system. 
Description: Write a stored procedure that updates the status of a book in the library based on its issuance. 
The procedure should function as follows: The stored procedure should take the book_id as an input parameter. 
The procedure should first check if the book is available (status = 'yes'). If the book is available, 
it should be issued, and the status in the books table should be updated to 'no'. If the book is not available (status = 'no'), 
the procedure should return an error message indicating that the book is currently not available.
 
 */

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



-- 19: Create Table As Select (CTAS) Objective: Create a CTAS (Create Table As Select) query to identify overdue books and calculate fines.

-- Description: Write a CTAS query to create a new table that lists each member and the books they have issued but not returned within 30 days. 
-- The table should include: The number of overdue books. The total fines, with each day's fine calculated at $0.50. 
-- The number of books issued by each member. The resulting table should show: Member ID Number of overdue books Total fines

create table fines as 
with issued as (
	
select 
	i.issued_id,
	i.issued_date,
	r.return_date,
	abs(DATEDIFF(i.issued_date,r.return_date)) as Overduesbook
	from issued_status i
join return_status r
	on i.issued_id=r.issued_id
	
)
, mbr as (
 Select 
	m.member_id,
	m.member_name,
	b.book_title,
	i.issued_id
from member m
join issued_status i
	on i.issued_member_id=m.member_id
join books b
	on i.issued_book_isbn=b.isbn
)

select 
	mr.member_id,
	mr.member_name,
	mr.book_title,
	iu.issued_date,
	iu.Overduesbook,
	concat(iu.overduesbook*0.50, '$') as fine
from issued iu
join mbr mr
	on iu.issued_id=mr.issued_id

select * 
from fines;










