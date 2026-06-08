USE library_project_2;

-- TASK 1:
-- Create a New Book Record -- 
-- "978-1-60129-456-2', 'To Kill a Mockingbird', 'Classic', 6.00, 'yes', 'Harper Lee', 'J.B. Lippincott & Co.')"
SELECT * FROM books;
INSERT INTO books(isbn, book_title, category, rental_price, status, author, publisher)
VALUES
('978-1-60129-456-2', 'To Kill a Mockingbird', 'Classic', 6.00, 'yes', 'Harper Lee', 'J.B. Lippincott & Co.');
SELECT COUNT(*) FROM books;

-- TASK 2: 
-- Update an existing members address
SELECT * FROM members;
UPDATE members
SET member_address = '484 Hoodridge Dr'
WHERE member_id = 'C101';

-- TASK 3:
-- Delete a Record from the Issued Status Table
-- Objective: Delete the record with issued_id = 'IS121' from the issued_status table.
SELECT * FROM issued_status;
DELETE FROM issued_status 
WHERE issued_id = 'IS121';


-- TASK 4: 
-- Retrive All Books Issued by a Specific Employee 
-- Objective: Select all books issued by the employee with emp_id = 'E101'
SELECT * FROM issued_status;
SELECT * FROM issued_status
WHERE issued_emp_id = 'E101';


-- TASK 5: 
-- List Members Who Have Issued More Than One Book 
-- Objective: Use GROUP BY to find members who have issued more than one book.
SELECT issued_emp_id, COUNT(*) AS total_book_issued 
FROM issued_status
GROUP BY issued_emp_id
HAVING COUNT(*) > 1;

-- TASK 6: CTAS
-- Create Summary Tables: 
-- Used CTAS to generate new tables based on query results - each book and total book_issued_cnt*
CREATE TABLE book_counts
AS 
SELECT b.isbn, b.book_title, COUNT(ist.issued_id) as no_issued
FROM books AS b
JOIN issued_status AS ist
ON ist.issued_book_isbn = b.isbn
GROUP BY 1, 2;

SELECT * FROM book_counts;

-- TASK 7. 
-- Retrieve All Books in a Specific Category:
-- finding the duplicates of each category 
SELECT category, COUNT(*) AS duplicates
FROM books
GROUP BY category;
-- selecting specific category
SELECT * FROM books
WHERE category = "Children";


-- TASK 8: 
-- Find Total Rental Income by Category:
SELECT * FROM books;
SELECT * FROM issued_status;
SELECT category, SUM(rental_price) AS total_income, COUNT(category) AS category_count
FROM books
GROUP BY category;

-- TASK 9:
-- List Members Who Registered in the Last 180 Days:
SELECT * FROM members
WHERE reg_date >= CURRENT_DATE - INTERVAL 180 DAY;

INSERT INTO members(member_id, member_name, member_address, reg_date)
VALUES('C120', 'Rohan Shrestha', '484 Hoodridge Dr', '2025-12-15'),
('C121', 'Keshab Pradhan', '454 Hoodridge Dr', '2025-12-05');



































