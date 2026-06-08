-- Library Management System Project 2
USE library_project_2;
-- CREATING BRANCH TABLE
DROP TABLE IF EXISTS branch;
CREATE TABLE branch
(
	branch_id VARCHAR(10) PRIMARY KEY,
	manager_id VARCHAR(10), 
	branch_address VARCHAR(55), 
	contact_no VARCHAR(25)
    
);

-- CREATING EMPLOYEES TABLE

DROP TABLE IF EXISTS employees;
CREATE TABLE employees
(
	emp_id VARCHAR(10) PRIMARY KEY,
    emp_name VARCHAR(25),
    position VARCHAR(25),
    salary FLOAT,
    branch_id VARCHAR(10) -- FK

);

-- CREATING BOOK TABLE
DROP TABLE IF EXISTS books;
CREATE TABLE books
(
	isbn VARCHAR(20) PRIMARY KEY,
    book_title VARCHAR(80),
    category VARCHAR(20),
    rental_price FLOAT,
    status ENUM('Yes', 'No'),
    author VARCHAR(50),
    publisher VARCHAR(55)
    
);

-- CREATING MEMBERS TABLE
DROP TABLE IF EXISTS members;
CREATE TABLE members
(

	member_id VARCHAR(20) PRIMARY KEY,
    member_name VARCHAR(80),
    member_address VARCHAR(20),
    reg_date DATE
    
); 


-- CREATING ISSUED TABLE
DROP TABLE IF EXISTS issued_status;
CREATE TABLE issued_status
(
	issued_id VARCHAR(20) PRIMARY KEY,
    issued_member_id VARCHAR(20), -- FK
    issued_book_name VARCHAR(50), 
    issued_date DATE,
    issued_book_isbn VARCHAR(20), -- FK
    issued_emp_id VARCHAR(20) -- FK
    
    
); 
ALTER TABLE issued_status
MODIFY COLUMN issued_book_name VARCHAR(80);


-- CREATING RETURN STATUS TABLE
DROP TABLE IF EXISTS return_status;
CREATE TABLE return_status
(
	return_id VARCHAR(20) PRIMARY KEY,
    issued_id VARCHAR(20), -- FK
    return_book_name VARCHAR(80),  
    return_date DATE,
    return_book_isbn VARCHAR(20) -- FK
    
); 


-- FOREIGN KEY FOR ISSUED STATUS TABLE

ALTER TABLE issued_status
ADD CONSTRAINT fk_members
FOREIGN KEY (issued_member_id)
REFERENCES members(member_id);

ALTER TABLE issued_status
ADD CONSTRAINT fk_books
FOREIGN KEY (issued_book_isbn)
REFERENCES books(isbn);

ALTER TABLE issued_status
ADD CONSTRAINT fk_employees
FOREIGN KEY (issued_emp_id)
REFERENCES employees(emp_id);

-- FOREIGN KEY FOR EMPLOYEES TABLE

ALTER TABLE employees
ADD CONSTRAINT fk_branch
FOREIGN KEY(branch_id)
REFERENCES branch(branch_id);

-- FOREIGN KEY FOR RETURN STATUS TABLE

ALTER TABLE return_status
ADD CONSTRAINT fk_issued_status
FOREIGN KEY(issued_id)
REFERENCES issued_status(issued_id);

-- ALTER TABLE return_status
-- ADD CONSTRAINT fk_return_book
-- FOREIGN KEY(return_book_isbn)
-- REFERENCES books(isbn);























































