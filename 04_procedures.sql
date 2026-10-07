USE SmartLibrary;

-- ============================================
-- PROCEDURE 1: ISSUE BOOK
-- ============================================

DROP PROCEDURE IF EXISTS issue_book;

DELIMITER //

CREATE PROCEDURE issue_book(
    IN p_member_id INT,
    IN p_book_id INT
)
BEGIN
    DECLARE v_copies INT;
    DECLARE v_member_count INT;
    DECLARE v_book_count INT;

    -- Check member
    SELECT COUNT(*)
    INTO v_member_count
    FROM MEMBER
    WHERE Member_ID = p_member_id;

    IF v_member_count = 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Member does not exist';
    END IF;

    -- Check book
    SELECT COUNT(*)
    INTO v_book_count
    FROM BOOK
    WHERE Book_ID = p_book_id;

    IF v_book_count = 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Book does not exist';
    END IF;

    -- Check availability
    SELECT Copies_Available
    INTO v_copies
    FROM BOOK
    WHERE Book_ID = p_book_id;

    IF v_copies <= 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Book is not available';
    END IF;

    -- Issue for 14 days
    INSERT INTO BORROWING
    (
        Member_ID,
        Book_ID,
        Issue_Date,
        Due_Date,
        Return_Date,
        Fine_Amount
    )
    VALUES
    (
        p_member_id,
        p_book_id,
        CURDATE(),
        DATE_ADD(CURDATE(), INTERVAL 14 DAY),
        NULL,
        0.00
    );

    SELECT 'Book issued successfully' AS Message;
END //

DELIMITER ;


-- ============================================
-- PROCEDURE 2: RETURN BOOK
-- ============================================

DROP PROCEDURE IF EXISTS return_book;

DELIMITER //

CREATE PROCEDURE return_book(
    IN p_borrow_id INT
)
BEGIN
    DECLARE v_return_date DATE;
    DECLARE v_due_date DATE;
    DECLARE v_fine DECIMAL(10,2);

    -- Check whether borrowing exists
    SELECT Return_Date, Due_Date
    INTO v_return_date, v_due_date
    FROM BORROWING
    WHERE Borrow_ID = p_borrow_id;

    IF v_return_date IS NOT NULL THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Book has already been returned';
    END IF;

    -- Calculate fine
    SET v_fine = GREATEST(
        DATEDIFF(CURDATE(), v_due_date),
        0
    ) * 5.00;

    -- Return the book
    UPDATE BORROWING
    SET
        Return_Date = CURDATE(),
        Fine_Amount = v_fine
    WHERE Borrow_ID = p_borrow_id;

    SELECT
        'Book returned successfully' AS Message,
        v_fine AS Fine_Amount;
END //

DELIMITER ;


-- ============================================
-- PROCEDURE 3: RESERVE BOOK
-- ============================================

DROP PROCEDURE IF EXISTS reserve_book;

DELIMITER //

CREATE PROCEDURE reserve_book(
    IN p_member_id INT,
    IN p_book_id INT
)
BEGIN
    DECLARE v_member_count INT;
    DECLARE v_book_count INT;

    -- Check member
    SELECT COUNT(*)
    INTO v_member_count
    FROM MEMBER
    WHERE Member_ID = p_member_id;

    IF v_member_count = 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Member does not exist';
    END IF;

    -- Check book
    SELECT COUNT(*)
    INTO v_book_count
    FROM BOOK
    WHERE Book_ID = p_book_id;

    IF v_book_count = 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Book does not exist';
    END IF;

    -- Create reservation
    INSERT INTO RESERVATION
    (
        Member_ID,
        Book_ID,
        Reservation_Date,
        Status
    )
    VALUES
    (
        p_member_id,
        p_book_id,
        CURDATE(),
        'Active'
    );

    SELECT 'Book reserved successfully' AS Message;
END //

DELIMITER ;


-- ============================================
-- PROCEDURE 4: GENERATE RECOMMENDATION
-- ============================================

DROP PROCEDURE IF EXISTS generate_recommendation;

DELIMITER //

CREATE PROCEDURE generate_recommendation(
    IN p_member_id INT
)
BEGIN

    /*
       Recommend highly-rated books that the member
       has not already borrowed.
    */

    INSERT INTO RECOMMENDATION
    (
        Member_ID,
        Book_ID,
        Recommendation_Date,
        Recommendation_Score,
        Recommendation_Reason
    )
    SELECT
        p_member_id,
        B.Book_ID,
        CURDATE(),
        calculate_average_rating(B.Book_ID),
        'Recommended based on high book rating'
    FROM BOOK B
    WHERE calculate_average_rating(B.Book_ID) >= 4.00
    AND NOT EXISTS
    (
        SELECT 1
        FROM BORROWING BR
        WHERE BR.Member_ID = p_member_id
        AND BR.Book_ID = B.Book_ID
    )
    LIMIT 3;

    SELECT 'Recommendations generated successfully' AS Message;
END //

DELIMITER ;