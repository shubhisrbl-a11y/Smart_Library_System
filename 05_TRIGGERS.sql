USE SmartLibrary;

-- ============================================
-- TRIGGER 1: AFTER BOOK BORROWED
-- Decrease available copies
-- ============================================

DROP TRIGGER IF EXISTS after_book_borrowed;

DELIMITER //

CREATE TRIGGER after_book_borrowed
AFTER INSERT ON BORROWING
FOR EACH ROW
BEGIN

    UPDATE BOOK
    SET Copies_Available = Copies_Available - 1
    WHERE Book_ID = NEW.Book_ID;

END //

DELIMITER ;


-- ============================================
-- TRIGGER 2: BEFORE BOOK BORROWED
-- Prevent borrowing when no copies exist
-- ============================================

DROP TRIGGER IF EXISTS before_book_borrowed;

DELIMITER //

CREATE TRIGGER before_book_borrowed
BEFORE INSERT ON BORROWING
FOR EACH ROW
BEGIN
    DECLARE v_copies INT;

    SELECT Copies_Available
    INTO v_copies
    FROM BOOK
    WHERE Book_ID = NEW.Book_ID;

    IF v_copies <= 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Cannot borrow book: no copies available';
    END IF;

END //

DELIMITER ;


-- ============================================
-- TRIGGER 3: AFTER BOOK RETURNED
-- Increase available copies
-- ============================================

DROP TRIGGER IF EXISTS after_book_returned;

DELIMITER //

CREATE TRIGGER after_book_returned
AFTER UPDATE ON BORROWING
FOR EACH ROW
BEGIN

    IF OLD.Return_Date IS NULL
       AND NEW.Return_Date IS NOT NULL THEN

        UPDATE BOOK
        SET Copies_Available = Copies_Available + 1
        WHERE Book_ID = NEW.Book_ID;

    END IF;

END //

DELIMITER ;