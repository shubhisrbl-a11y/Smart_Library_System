USE smartlibrary;
SET FOREIGN_KEY_CHECKS = 0;

TRUNCATE TABLE RECOMMENDATION;
TRUNCATE TABLE RATING;
TRUNCATE TABLE RESERVATION;
TRUNCATE TABLE BORROWING;
TRUNCATE TABLE BOOK_KEYWORD;
TRUNCATE TABLE BOOK_CATEGORY;
TRUNCATE TABLE BOOK_AUTHOR;
TRUNCATE TABLE BOOK;
TRUNCATE TABLE MEMBER;
TRUNCATE TABLE CATEGORY;
TRUNCATE TABLE AUTHOR;
TRUNCATE TABLE PUBLISHER;

SET FOREIGN_KEY_CHECKS = 1;
INSERT INTO PUBLISHER (Publisher_Name, Address)
VALUES
('Pearson', 'New Delhi, India'),
('McGraw Hill', 'New York, USA'),
('O''Reilly Media', 'Sebastopol, California, USA'),
('Springer', 'Berlin, Germany'),
('Wiley', 'Hoboken, New Jersey, USA');
INSERT INTO AUTHOR (Author_Name, Biography)
VALUES
('Abraham Silberschatz', 'Computer scientist and author known for textbooks on database systems and operating systems.'),
('Henry F. Korth', 'Computer scientist and co-author of widely used database management textbooks.'),
('S. Sudarshan', 'Indian computer scientist and professor known for work in database systems.'),
('Andrew S. Tanenbaum', 'Computer scientist and author known for books on operating systems and computer networks.'),
('Ramez Elmasri', 'Computer scientist and author known for database management system textbooks.'),
('Martin Kleppmann', 'Author and researcher specializing in data-intensive applications and distributed systems.'),
('Thomas H. Cormen', 'Computer scientist and co-author of Introduction to Algorithms.'),
('Ian Goodfellow', 'Researcher and author known for work in deep learning and artificial intelligence.'),
('Robert C. Martin', 'Software engineer and author known for books on clean software development.'),
('Joshua Bloch', 'Software engineer and author known for work on Java and software design.');
-- =========================
-- CATEGORIES
-- =========================

INSERT INTO CATEGORY (Category_Name, Description)
VALUES
('Database Systems', 'Books related to databases, SQL and database management.'),
('Operating Systems', 'Books covering operating systems and system software.'),
('Computer Networks', 'Books about networking and communication systems.'),
('Artificial Intelligence', 'Books covering AI and intelligent systems.'),
('Machine Learning', 'Books covering machine learning algorithms and applications.'),
('Data Structures', 'Books about data structures and algorithms.'),
('Software Engineering', 'Books about software development and engineering practices.'),
('Programming', 'Books covering programming languages and software development.');


-- =========================
-- MEMBERS
-- =========================

INSERT INTO MEMBER
(Member_Name, Email, Phone, Department, Join_Date, Membership_Type)
VALUES
('Suyash Srivastava', 'suyash@vit.ac.in', '9876543210', 'CSE', '2025-07-10', 'Premium'),
('Rahul Sharma', 'rahul@vit.ac.in', '9876543211', 'CSE', '2025-07-12', 'Regular'),
('Priya Nair', 'priya@vit.ac.in', '9876543212', 'CSE', '2025-07-15', 'Premium'),
('Arjun Kumar', 'arjun@vit.ac.in', '9876543213', 'ECE', '2025-07-18', 'Regular'),
('Ananya Singh', 'ananya@vit.ac.in', '9876543214', 'CSE', '2025-07-20', 'Premium'),
('Rohan Mehta', 'rohan@vit.ac.in', '9876543215', 'IT', '2025-07-22', 'Regular'),
('Sneha Iyer', 'sneha@vit.ac.in', '9876543216', 'CSE', '2025-07-25', 'Regular'),
('Vikram Rao', 'vikram@vit.ac.in', '9876543217', 'ECE', '2025-07-28', 'Premium'),
('Kavya Menon', 'kavya@vit.ac.in', '9876543218', 'CSE', '2025-08-01', 'Regular'),
('Aditya Verma', 'aditya@vit.ac.in', '9876543219', 'IT', '2025-08-03', 'Premium');


-- =========================
-- BOOKS
-- =========================

INSERT INTO BOOK
(ISBN, Title, Publication_Year, Language, Edition, Copies_Available, Publisher_ID)
VALUES
('9780078022159', 'Database System Concepts', 2019, 'English', '7th', 4, 1),
('9780073523323', 'Operating System Concepts', 2018, 'English', '10th', 3, 2),
('9780133594140', 'Computer Networking', 2021, 'English', '8th', 4, 1),
('9780262033848', 'Artificial Intelligence: A Modern Approach', 2021, 'English', '4th', 5, 2),
('9780262046305', 'Deep Learning', 2016, 'English', '1st', 3, 3),
('9780134494166', 'Introduction to Algorithms', 2022, 'English', '4th', 5, 1),
('9780132350884', 'Clean Code', 2008, 'English', '1st', 4, 1),
('9780134685991', 'Effective Java', 2018, 'English', '3rd', 4, 1),
('9781449373320', 'Designing Data-Intensive Applications', 2017, 'English', '1st', 3, 3),
('9780131103627', 'The C Programming Language', 1988, 'English', '2nd', 4, 1),
('9780135974445', 'Computer Architecture', 2020, 'English', '6th', 3, 2),
('9780262533058', 'Machine Learning', 2010, 'English', '1st', 4, 4),
('9780132126953', 'Computer Networks and Internets', 2012, 'English', '6th', 3, 1),
('9780134757599', 'Java: The Complete Reference', 2018, 'English', '11th', 5, 2),
('9780137081073', 'Software Engineering', 2010, 'English', '9th', 4, 1),
('9780262035613', 'Deep Learning with Python', 2017, 'English', '1st', 3, 3),
('9781617294433', 'Head First Java', 2022, 'English', '3rd', 4, 5),
('9780135166307', 'Data Structures and Algorithms', 2019, 'English', '1st', 5, 4),
('9781492056812', 'Learning SQL', 2020, 'English', '3rd', 3, 3),
('9781491950357', 'Python for Data Analysis', 2022, 'English', '3rd', 4, 3);
-- =========================
-- BOOK_CATEGORY
-- =========================

INSERT INTO BOOK_CATEGORY (Book_ID, Category_ID)
VALUES
(1,1),
(2,2),
(3,3),
(4,4),
(5,5),
(6,6),
(7,7),
(8,8),
(9,1),
(10,8),
(11,2),
(12,5),
(13,3),
(14,8),
(15,7),
(16,5),
(17,8),
(18,6),
(19,1),
(20,5);


-- =========================
-- BOOK_KEYWORD
-- =========================

INSERT INTO BOOK_KEYWORD (Book_ID, Keyword)
VALUES
(1,'SQL'),
(1,'Database'),
(1,'Transactions'),
(2,'Operating Systems'),
(2,'Processes'),
(2,'Scheduling'),
(3,'Networking'),
(3,'TCP/IP'),
(3,'Protocols'),
(4,'Artificial Intelligence'),
(4,'Search'),
(4,'Agents'),
(5,'Deep Learning'),
(5,'Neural Networks'),
(6,'Algorithms'),
(6,'Data Structures'),
(6,'Complexity'),
(7,'Clean Code'),
(7,'Software Development'),
(8,'Java'),
(8,'Programming'),
(9,'Distributed Systems'),
(9,'Databases'),
(10,'C Programming'),
(11,'Computer Architecture'),
(12,'Machine Learning'),
(13,'Computer Networks'),
(14,'Java'),
(15,'Software Engineering'),
(16,'Deep Learning'),
(17,'Java'),
(18,'Data Structures'),
(19,'SQL'),
(20,'Python');


-- =========================
-- BORROWING
-- =========================

INSERT INTO BORROWING
(Member_ID, Book_ID, Issue_Date, Due_Date, Return_Date, Fine_Amount)
VALUES
(1,1,'2026-08-01','2026-08-15','2026-08-14',0.00),
(2,2,'2026-08-03','2026-08-17','2026-08-20',15.00),
(3,3,'2026-08-05','2026-08-19','2026-08-18',0.00),
(4,4,'2026-08-07','2026-08-21','2026-08-21',0.00),
(5,5,'2026-08-10','2026-08-24','2026-08-27',15.00),
(6,6,'2026-08-12','2026-08-26','2026-08-25',0.00),
(7,7,'2026-08-15','2026-08-29','2026-08-30',5.00),
(8,8,'2026-08-18','2026-09-01','2026-08-30',0.00),
(9,9,'2026-08-20','2026-09-03','2026-09-02',0.00),
(10,10,'2026-08-22','2026-09-05','2026-09-08',15.00),
(1,11,'2026-08-25','2026-09-08','2026-09-07',0.00),
(2,12,'2026-08-27','2026-09-10','2026-09-12',10.00),
(3,13,'2026-09-01','2026-09-15','2026-09-14',0.00),
(4,14,'2026-09-03','2026-09-17','2026-09-16',0.00),
(5,15,'2026-09-05','2026-09-19','2026-09-22',15.00),
(6,16,'2026-09-07','2026-09-21','2026-09-20',0.00),
(7,17,'2026-09-10','2026-09-24',NULL,0.00),
(8,18,'2026-09-12','2026-09-26',NULL,0.00),
(9,19,'2026-09-15','2026-09-29',NULL,0.00),
(10,20,'2026-09-18','2026-10-02',NULL,0.00);


-- =========================
-- RESERVATION
-- =========================

INSERT INTO RESERVATION
(Member_ID, Book_ID, Reservation_Date, Status)
VALUES
(1,5,'2026-08-20','Completed'),
(2,1,'2026-08-22','Completed'),
(3,6,'2026-08-25','Completed'),
(4,8,'2026-08-28','Cancelled'),
(5,9,'2026-09-01','Completed'),
(6,12,'2026-09-03','Active'),
(7,4,'2026-09-05','Active'),
(8,15,'2026-09-08','Completed'),
(9,2,'2026-09-10','Active'),
(10,20,'2026-09-12','Active'),
(1,16,'2026-09-15','Completed'),
(3,19,'2026-09-17','Active');


-- =========================
-- RATINGS
-- =========================

INSERT INTO RATING
(Member_ID, Book_ID, Rating_Value, Review, Rating_Date)
VALUES
(1,1,5,'Excellent database textbook.','2026-08-16'),
(2,2,4,'Very useful for operating systems.','2026-08-21'),
(3,3,5,'Good explanation of networking concepts.','2026-08-19'),
(4,4,5,'Excellent introduction to AI.','2026-08-22'),
(5,5,4,'Very useful deep learning reference.','2026-08-28'),
(6,6,5,'Great algorithms book.','2026-08-27'),
(7,7,5,'Very practical software engineering advice.','2026-08-31'),
(8,8,4,'Good Java reference.','2026-09-02'),
(9,9,5,'Excellent distributed systems book.','2026-09-04'),
(10,10,4,'Helpful C programming reference.','2026-09-09'),
(1,11,4,'Interesting computer architecture book.','2026-09-08'),
(2,12,5,'Very good machine learning concepts.','2026-09-13'),
(3,13,4,'Useful networking reference.','2026-09-15'),
(4,14,5,'Excellent Java reference.','2026-09-17'),
(5,15,4,'Good software engineering book.','2026-09-23'),
(6,16,5,'Very helpful deep learning material.','2026-09-21'),
(7,17,4,'Easy to understand Java book.','2026-09-25'),
(8,18,5,'Excellent data structures reference.','2026-09-27'),
(9,19,5,'Very useful SQL book.','2026-09-29'),
(10,20,4,'Good introduction to Python data analysis.','2026-09-30');


-- =========================
-- RECOMMENDATION
-- =========================

INSERT INTO RECOMMENDATION
(Member_ID, Book_ID, Recommendation_Date, Recommendation_Score, Recommendation_Reason)
VALUES
(1,6,'2026-09-01',4.80,'Recommended based on interest in technical books.'),
(1,9,'2026-09-02',4.70,'Recommended based on database interests.'),
(2,11,'2026-09-03',4.50,'Recommended based on computer systems interests.'),
(2,13,'2026-09-04',4.40,'Recommended based on networking interests.'),
(3,5,'2026-09-05',4.90,'Recommended based on artificial intelligence interests.'),
(3,12,'2026-09-06',4.80,'Recommended based on machine learning interests.'),
(4,3,'2026-09-07',4.60,'Recommended based on networking interests.'),
(4,14,'2026-09-08',4.70,'Recommended based on programming interests.'),
(5,7,'2026-09-09',4.50,'Recommended based on software engineering interests.'),
(5,15,'2026-09-10',4.60,'Recommended based on software development interests.'),
(6,6,'2026-09-11',4.90,'Recommended based on algorithm interests.'),
(6,18,'2026-09-12',4.80,'Recommended based on data structure interests.'),
(7,8,'2026-09-13',4.70,'Recommended based on Java interests.'),
(8,4,'2026-09-14',4.90,'Recommended based on AI interests.'),
(9,1,'2026-09-15',4.80,'Recommended based on database interests.'),
(10,20,'2026-09-16',4.50,'Recommended based on Python interests.');

