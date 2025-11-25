--What is a View?
--A view is a virtual table created from a SELECT query.

-- It doesn’t store data physically (unless materialized in some DBs)
-- Always shows the latest data from underlying tables
-- Used for abstraction, simplicity, and security


--Syntax

CREATE VIEW view_name AS
SELECT column1, column2,
FROM table_name
WHERE condition;


--Example Scenario

--Assume a Library Database with tables:
--Books (BookID, Title, Author, Genre, Price)
--Members (MemberID, Name, City)
--Borrow (BorrowID, MemberID, BookID, BorrowDate, ReturnDate)


1. Create a View – Available Books

CREATE VIEW AvailableBooks AS
SELECT BookID, Title, Author, Genre
FROM Books
WHERE BookID NOT IN (SELECT BookID FROM Borrow WHERE ReturnDate IS NULL);


2. Create a View – Member Borrow History

CREATE VIEW MemberBorrowHistory AS
SELECT m.Name, b.Title, br.BorrowDate, br.ReturnDate
FROM Members m
JOIN Borrow br ON m.MemberID = br.MemberID
JOIN Books b ON br.BookID = b.BookID;




SELECT * FROM AvailableBooks;

--Filter like a normal table:

SELECT * FROM MemberBorrowHistory
WHERE Name = 'Rahul';

--Updating Through Views

--Allowed only if:

-- View is based on one table
-- No aggregate (SUM, COUNT)
-- No DISTINCT, GROUP BY, HAVING

Example (valid):


CREATE VIEW BookPrices AS
SELECT BookID, Title, Price
FROM Books;

UPDATE BookPrices
SET Price = 450
WHERE BookID = 10;



--Benefits of Views

--Hide sensitive columns
--Reuse complex SQL logic
--Provide simplified access to users
--Maintain data consistency
--Improved security & abstraction


--Dropping a View

DROP VIEW AvailableBooks;