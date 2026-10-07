USE SmartLibrary;

-- ============================================
-- FUNCTION 1: Calculate Fine
-- Fine = ₹5 per day after due date
-- ============================================

DROP FUNCTION IF EXISTS calculate_fine;

DELIMITER //

CREATE FUNCTION calculate_fine(p_borrow_id INT)
RETURNS DECIMAL(10,2)
DETERMINISTIC
READS SQL DATA
BEGIN
    DECLARE v_due_date DATE;
    DECLARE v_return_date DATE;
    DECLARE v_days_late INT;

    SELECT Due_Date, Return_Date
    INTO v_due_date, v_return_date
    FROM BORROWING
    WHERE Borrow_ID = p_borrow_id;

    SET v_days_late = GREATEST(
        DATEDIFF(COALESCE(v_return_date, CURDATE()), v_due_date),
        0
    );

    RETURN v_days_late * 5.00;
END //

DELIMITER ;


-- ============================================
-- FUNCTION 2: Calculate Average Rating
-- ============================================

DROP FUNCTION IF EXISTS calculate_average_rating;

DELIMITER //

CREATE FUNCTION calculate_average_rating(p_book_id INT)
RETURNS DECIMAL(4,2)
DETERMINISTIC
READS SQL DATA
BEGIN
    DECLARE v_average DECIMAL(4,2);

    SELECT ROUND(AVG(Rating_Value), 2)
    INTO v_average
    FROM RATING
    WHERE Book_ID = p_book_id;

    RETURN COALESCE(v_average, 0.00);
END //

DELIMITER ;


-- ============================================
-- FUNCTION 3: Check Book Availability
-- ============================================

DROP FUNCTION IF EXISTS check_book_availability;

DELIMITER //

CREATE FUNCTION check_book_availability(p_book_id INT)
RETURNS INT
DETERMINISTIC
READS SQL DATA
BEGIN
    DECLARE v_copies INT;

    SELECT Copies_Available
    INTO v_copies
    FROM BOOK
    WHERE Book_ID = p_book_id;

    RETURN COALESCE(v_copies, 0);
END //

DELIMITER ;