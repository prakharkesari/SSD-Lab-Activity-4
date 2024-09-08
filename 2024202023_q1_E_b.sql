DELIMITER //

CREATE PROCEDURE UpdateAgeWithCursor(IN age INT)
BEGIN
    DECLARE done INT DEFAULT FALSE;
    DECLARE sub_id INT;
    DECLARE sub_date DATE;
    DECLARE cur CURSOR FOR SELECT SubscriberID, SubscriptionDate FROM Subscribers;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

    OPEN cur;

    read_loop: LOOP
        FETCH cur INTO sub_id, sub_date;
        IF done THEN
            LEAVE read_loop;
        END IF;
        UPDATE Subscribers
        SET Age = age
        WHERE SubscriberID = sub_id;
    END LOOP;

    CLOSE cur;
END //

DELIMITER ;

CALL UpdateAgeWithCursor(69);