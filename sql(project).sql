create database librarydb;
use librarydb;
create table books(
bookid int primary key,
title varchar(225) not null,author varchar(225) not null,
publishedyear int not null,
gener varchar(100),
available boolean);

create table members(
member_id int primary key,
first_name varchar(100) not null,
last_name varchar(100) not null,
dateofbirth date not null,
joindate date);


CREATE TABLE Loans (
    Loan_ID INT PRIMARY KEY,
    BookID INT,
    Member_ID INT,
    LoanDate DATE,
    ReturnDate DATE,
    FOREIGN KEY (BookID) REFERENCES Books(BookID),
    FOREIGN KEY (Member_ID) REFERENCES Members(Member_ID)
);

INSERT INTO Books (BookID, Title, Author, PublishedYear, Gener, Available)
VALUES
(1, 'The Great Gatsby', 'F. Scott Fitzgerald', 1925, 'Fiction', TRUE),
(2, 'To Kill a Mockingbird', 'Harper Lee', 1960, 'Fiction', TRUE),
(3, '1984', 'George Orwell', 1949, 'Dystopian', TRUE),
(4, 'Moby Dick', 'Herman Melville', 1851, 'Adventure', TRUE),
(5, 'War and Peace', 'Leo Tolstoy', 1869, 'Historical', TRUE);

INSERT INTO Members (Member_ID, First_Name, Last_Name, DateOfBirth, JoinDate)
VALUES
(1, 'John', 'Doe', '1990-05-15', '2026-01-10'),
(2, 'Jane', 'Smith', '1985-03-22', '2026-01-15'),
(3, 'Alice', 'Johnson', '2000-11-30', '2026-02-01'),
(4, 'Robert', 'Brown', '1975-08-09', '2026-02-10'),
(5, 'Mary', 'Davis', '1995-07-20', '2026-02-15');
INSERT INTO Loans (Loan_ID, BookID, Member_ID, LoanDate, ReturnDate)
VALUES
(1, 1, 1, '2026-09-01', NULL),
(2, 2, 2, '2026-09-05', NULL);

UPDATE Books
SET Available = FALSE
WHERE BookID IN (1, 2);

UPDATE Loans
SET ReturnDate = '2026-09-20'
WHERE Loan_ID = 1;

UPDATE Books
SET Available = TRUE
WHERE BookID = 1;

DELETE FROM Members
WHERE Member_ID = 5;

SELECT *
FROM Books
WHERE Available = TRUE;

SELECT DISTINCT
    Members.Member_ID,
    Members.First_Name,
    Members.Last_Name
FROM Members
JOIN Loans
ON Members.Member_ID = Loans.Member_ID;

SELECT *
FROM Loans
WHERE ReturnDate IS NULL;