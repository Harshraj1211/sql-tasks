
-- Insert into Authors Table
INSERT INTO Author (AuthorID, AuthorName, Country)
VALUES
(1, 'J.K. Rowling', 'UK'),
(2, 'George Orwell', 'UK'),
(3, 'Rabindranath Tagore', NULL);  -- Country unknown → NULL

-- Insert into Books Table
INSERT INTO Book (BookID, Title, AuthorID,CopiesAvailable)
VALUES
(101, 'Harry Potter', 1,  19),
(102, '1984', 2,  49),
(103, 'Gitanjali', 3, NULL); -- Published year unknown

-- Insert into Members Table
INSERT INTO Member (MemberID, Name, Email, Phone,Address)
VALUES
(11, 'Aarav Patel', 'aarav@gmail.com', '9876543210'),
(12, 'Meera Shah', NULL, '9998887776'),      -- No email provided
(13, 'John Doe', 'john@example.com', NULL);  -- Phone missing

-- UPDATE DATA

-- Update email where it was NULL
UPDATE Member
SET Email = 'meera.shah@gmail.com'
WHERE MemberID = 12;

-- Update book published year (was previously NULL)
UPDATE Book
SET CopiesAvailable = 10
WHERE BookID = 103;

-- Correct spelling of an author
UPDATE Author
SET AuthorName = 'Rabindranath Thakur'
WHERE AuthorID = 3;


-- DELETE DATA

-- Delete a member who cancelled membership
DELETE FROM Member
WHERE MemberID = 13;

-- Delete a wrongly added book
DELETE FROM Book
WHERE BookID = 102;

-- Delete authors who have no books in the Books table
DELETE FROM Author
WHERE AuthorID NOT IN (SELECT DISTINCT AuthorID FROM Book);
