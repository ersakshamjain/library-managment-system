
CREATE DATABASE LibraryManagement;
USE LibraryManagement;
	/* ======================= TABLES ========================*/
    
	CREATE TABLE tbl_publisher (
		publisher_PublisherName VARCHAR(100) PRIMARY KEY NOT NULL,
		publisher_PublisherAddress VARCHAR(200) NOT NULL,
		publisher_PublisherPhone VARCHAR(50) NOT NULL
	);

	CREATE TABLE tbl_book (
		book_BookID INT PRIMARY KEY NOT NULL,
		book_Title VARCHAR(100) NOT NULL,
		book_PublisherName VARCHAR(100) NOT NULL,
        FOREIGN KEY (book_PublisherName) REFERENCES  tbl_publisher(publisher_PublisherName) 
	);
    
	CREATE TABLE tbl_library_branch (
		library_branch_BranchID INT PRIMARY KEY NOT NULL ,
		library_branch_BranchName VARCHAR(100) NOT NULL,
		library_branch_BranchAddress VARCHAR(200) NOT NULL
	);

	SELECT * FROM tbl_library_branch;

	CREATE TABLE tbl_borrower (
		borrower_CardNo INT PRIMARY KEY NOT NULL,
		borrower_BorrowerName VARCHAR(100) NOT NULL,
		borrower_BorrowerAddress VARCHAR(200) NOT NULL,
		borrower_BorrowerPhone VARCHAR(50) NOT NULL
	);

	CREATE TABLE tbl_book_copies (
		book_copies_CopiesID INT PRIMARY KEY NOT NULL,
		book_copies_BookID INT NOT NULL,
        FOREIGN KEY (book_copies_BookID)  REFERENCES tbl_book(book_BookID),
		book_copies_BranchID INT NOT NULL,
        FOREIGN KEY (book_copies_BranchID)  REFERENCES tbl_library_branch(library_branch_BranchID),
		book_copies_No_Of_Copies INT NOT NULL
	);

 	SELECT * FROM tbl_book_copies;

	CREATE TABLE tbl_book_authors (
		book_authors_AuthorID INT PRIMARY KEY NOT NULL ,
		book_authors_BookID INT NOT NULL,
        FOREIGN KEY (book_authors_BookID)  REFERENCES tbl_book(book_BookID) ,
		book_authors_AuthorName VARCHAR(50) NOT NULL
	);

 	SELECT * FROM tbl_book_authors;

-- /*======================== END TABLES ======================*/


-- /*==================== POPULATING TABLES ======================*/
	
	INSERT INTO tbl_publisher
		(publisher_PublisherName, publisher_PublisherAddress, publisher_PublisherPhone)
		VALUES
		('DAW Books','375 Hudson Street, New York, NY 10014','212-366-2000'),
		('Viking','375 Hudson Street, New York, NY 10014','212-366-2000'),
		('Signet Books','375 Hudson Street, New York, NY 10014','212-366-2000'),
		('Chilton Books','Not Available','Not Available'),
		('George Allen & Unwin','83 Alexander Ln, Crows Nest NSW 2065, Australia','+61-2-8425-0100'),
		('Alfred A. Knopf','The Knopf Doubleday Group Domestic Rights, 1745 Broadway, New York, NY 10019','212-940-7390'),		
		('Bloomsbury','Bloomsbury Publishing Inc., 1385 Broadway, 5th Floor, New York, NY 10018','212-419-5300'),
		('Shinchosa','Oga Bldg. 8, 2-5-4 Sarugaku-cho, Chiyoda-ku, Tokyo 101-0064 Japan','+81-3-5577-6507'),
		('Harper and Row','HarperCollins Publishers, 195 Broadway, New York, NY 10007','212-207-7000'),
		('Pan Books','175 Fifth Avenue, New York, NY 10010','646-307-5745'),
		('Chalto & Windus','375 Hudson Street, New York, NY 10014','212-366-2000'),
		('Harcourt Brace Jovanovich','3 Park Ave, New York, NY 10016','212-420-5800'),
		('W.W. Norton',' W. W. Norton & Company, Inc., 500 Fifth Avenue, New York, New York 10110','212-354-5500'),
		('Scholastic','557 Broadway, New York, NY 10012','800-724-6527'),
		('Bantam','375 Hudson Street, New York, NY 10014','212-366-2000'),
		('Picador USA','175 Fifth Avenue, New York, NY 10010','646-307-5745')		
	;

 	SELECT * FROM tbl_publisher;

	INSERT INTO tbl_book
		(book_BookID,book_Title, book_PublisherName)
		VALUES 
		(1,'The Name of the Wind', 'DAW Books'),
		(2,'It', 'Viking'),
		(3,'The Green Mile', 'Signet Books'),
		(4,'Dune', 'Chilton Books'),
		(5,'The Hobbit', 'George Allen & Unwin'),
		(6,'Eragon', 'Alfred A. Knopf'),
		(7,'A Wise Mans Fear', 'DAW Books'),
		(8,'Harry Potter and the Philosophers Stone', 'Bloomsbury'),
		(9,'Hard Boiled Wonderland and The End of the World', 'Shinchosa'),
		(10,'The Giving Tree', 'Harper and Row'),
		(11,'The Hitchhikers Guide to the Galaxy', 'Pan Books'),
		(12,'Brave New World', 'Chalto & Windus'),
		(13,'The Princess Bride', 'Harcourt Brace Jovanovich'),
		(14,'Fight Club', 'W.W. Norton'),
		(15,'Holes', 'Scholastic'),
		(16,'Harry Potter and the Chamber of Secrets', 'Bloomsbury'),
		(17,'Harry Potter and the Prisoner of Azkaban', 'Bloomsbury'),
		(18,'The Fellowship of the Ring', 'George Allen & Unwin'),
		(19,'A Game of Thrones', 'Bantam'),
		(20,'The Lost Tribe', 'Picador USA')
        ;

 	SELECT * FROM tbl_book WHERE book_PublisherName = 'George Allen & Unwin';
 	SELECT * FROM tbl_book;

	INSERT INTO tbl_library_branch
		(library_branch_BranchID,library_branch_BranchName, library_branch_BranchAddress)
		VALUES
		(1,'Sharpstown','32 Corner Road, New York, NY 10012'),
		(2,'Central','491 3rd Street, New York, NY 10014'),
		(3,'Saline','40 State Street, Saline, MI 48176'),
		(4,'Ann Arbor','101 South University, Ann Arbor, MI 48104');

   SELECT * FROM tbl_library_branch;

	INSERT INTO tbl_borrower
		(borrower_CardNo,borrower_BorrowerName, borrower_BorrowerAddress, borrower_BorrowerPhone)
		VALUES
		(1,'Joe Smith','1321 4th Street, New York, NY 10014','212-312-1234'),
		(2,'Jane Smith','1321 4th Street, New York, NY 10014','212-931-4124'),
		(3,'Tom Li','981 Main Street, Ann Arbor, MI 48104','734-902-7455'),
		(4,'Angela Thompson','2212 Green Avenue, Ann Arbor, MI 48104','313-591-2122'),
		(5,'Harry Emnace','121 Park Drive, Ann Arbor, MI 48104','412-512-5522'),
		(6,'Tom Haverford','23 75th Street, New York, NY 10014','212-631-3418'),
		(7,'Haley Jackson','231 52nd Avenue New York, NY 10014','212-419-9935'),
		(8,'Michael Horford','653 Glen Avenue, Ann Arbor, MI 48104','734-998-1513');
	
 	SELECT * FROM tbl_borrower;


 SELECT * FROM tbl_book_loans;

	INSERT INTO tbl_book_copies
		(book_copies_CopiesID,book_copies_BookID, book_copies_BranchID, book_copies_No_Of_Copies)
		VALUES
		(1,1,1,5),
		(2,2,1,5),
		(3,3,1,5),
		(4,4,1,5),
		(5,5,1,5),
		(6,6,1,5),
		(7,7,1,5),
		(8,8,1,5),
		(9,9,1,5),
		(10,10,1,5),
		(11,11,1,5),
		(12,12,1,5),
		(13,13,1,5),
		(14,14,1,5),
		(15,15,1,5),
		(16,16,1,5),
		(17,17,1,5),
		(18,18,1,5),
		(19,19,1,5),
		(20,20,1,5),
        
		(21,1,2,5),
		(22,2,2,5),
		(23,3,2,5),
		(24,4,2,5),
		(25,5,2,5),
		(26,6,2,5),
		(27,7,2,5),
		(28,8,2,5),
		(29,9,2,5),
		(30,10,2,5),
		(31,11,2,5),
		(32,12,2,5),
		(33,13,2,5),
		(34,14,2,5),
		(35,15,2,5),
		(36,16,2,5),
		(37,17,2,5),
		(38,18,2,5),
		(39,19,2,5),
		(40,20,2,5),
		(41,1,3,5),
		(42,2,3,5),
		(43,3,3,5),
		(44,4,3,5),
		(45,5,3,5),
		(46,6,3,5),
		(47,7,3,5),
		(48,8,3,5),
		(49,9,3,5),
		(50,10,3,5),
		(51,11,3,5),
		(52,12,3,5),
		(53,13,3,5),
		(54,14,3,5),
		(55,15,3,5),
		(56,16,3,5),
		(57,17,3,5),
		(58,18,3,5),
		(59,19,3,5),
		(60,20,3,5),
	    (61,1,4,5),
		(62,2,4,5),
		(63,3,4,5),
		(64,4,4,5),
		(65,5,4,5),
		(66,6,4,5),
		(67,7,4,5),
		(68,8,4,5),
		(69,9,4,5),
		(70,10,4,5),
		(71,11,4,5),
		(72,12,4,5),
		(73,13,4,5),
		(74,14,4,5),
		(75,15,4,5),
		(76,16,4,5),
		(77,17,4,5),
		(78,18,4,5),
		(79,19,4,5),
		(80,20,4,5)
;

 	SELECT * FROM tbl_book_copies;


	INSERT INTO tbl_book_authors
		(book_authors_AuthorID,book_authors_BookID,book_authors_AuthorName)
		VALUES
		(1,1,'Patrick Rothfuss'),
		(2,2,'Stephen King'),
		(3,3,'Stephen King'),
		(4,4,'Frank Herbert'),
		(5,5,'J.R.R. Tolkien'),
		(6,6,'Christopher Paolini'),
		(7,7,'Patrick Rothfuss'),
		(8,8,'J.K. Rowling'),
		(9,9,'Haruki Murakami'),
		(10,10,'Shel Silverstein'),
		(11,11,'Douglas Adams'),
		(12,12,'Aldous Huxley'),
		(13,13,'William Goldman'),
		(14,14,'Chuck Palahniuk'),
		(15,15,'Louis Sachar'),
		(16,16,'J.K. Rowling'),
		(17,17,'J.K. Rowling'),
		(18,18,'J.R.R. Tolkien'),
		(19,19,'George R.R. Martin'),
		(20,20,'Mark Lee');

	SELECT * FROM tbl_book_authors;

-- 	============================== END POPULATING TABLES ==============================

--  =================== STORED PROCEDURE QUERY QUESTIONS =================================== 

-- #1 Retrive the publisher name with thier respective address
SELECT publisher_publisherName, publisher_publisherAddress from tbl_publisher; 

-- #2 Retrive the browwer address who have name 'Tom Li'
 SELECT borrower_BorrowerAddress FROM tbl_borrower WHERE borrower_BorrowerName='Tom Li';
 
 -- #3 How many total number of copies which book title is 'The Green Mile'
 SELECT sum(book_copies_No_Of_Copies) FROM tbl_book_copies AS copies
 INNER JOIN tbl_book AS title 
 ON copies.book_copies_BookID = title.book_BookID
	WHERE book_Title ='The Green Mile';
 

--  #4- How many copies of the book titled "The Lost Tribe" are owned by the library branch whose name is "Sharpstown"? */

SELECT  branch.library_branch_BranchName, copies.book_copies_No_Of_Copies, title.book_Title
FROM tbl_book_copies AS copies 
INNER JOIN tbl_book AS title ON copies.book_copies_BookID = title.book_BookID
INNER JOIN tbl_library_branch AS branch ON copies.book_copies_BranchID=branch.library_branch_BranchID
where book_Title='The Lost Tribe'and library_branch_BranchName='Sharpstown';



--  #5- How many copies of the book titled "The Lost Tribe" are owned by each library branch? */
SELECT   copies.book_copies_No_Of_Copies,branch.library_branch_BranchName, title.book_Title
FROM tbl_book_copies AS copies 
INNER JOIN tbl_book AS title ON copies.book_copies_BookID = title.book_BookID
INNER JOIN tbl_library_branch AS branch ON copies.book_copies_BranchID=branch.library_branch_BranchID
where book_Title='The Lost Tribe';

-- #6 Retrieve the Publisher names whose book title is 'The Hobbit' with how many no. of copies with repective branch name;
SELECT p_name.publisher_PublisherName, title.book_Title, branch_name.library_branch_BranchName, copies.book_copies_No_Of_Copies
 FROM tbl_publisher AS p_name 
INNER JOIN tbl_book AS title ON p_name.publisher_PublisherName = title.book_PublisherName
INNER JOIN tbl_book_copies AS copies ON title.book_BookID = copies.book_copies_BookID
INNER JOIN tbl_library_branch AS branch_name ON branch_name.library_branch_BranchID = copies.book_copies_BranchID
WHERE book_Title='The Hobbit';

#7 Total number of copies in all branch which book title is 'The Name of the Wind'
Select book_title,book_copies_No_of_copies,sum(book_copies_No_of_copies)
from tbl_library_branch tl
left join tbl_book_copies bc
on tl.library_branch_BranchID = bc.book_copies_BranchID
left join tbl_book tb
on bc.book_copies_BookID = tb.book_BookID
where book_Title='The Name of The Wind';


-- /* ==================================== STORED PROCEDURE QUERY QUESTIONS =================================== */



