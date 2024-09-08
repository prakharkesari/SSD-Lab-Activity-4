DELIMITER //

CREATE PROCEDURE retrieveWithCursor()
BEGIN
    DECLARE SubscriberID INT;
    DECLARE SubscriberName VARCHAR(100);
    DECLARE SubscriptionDate DATE;
    DECLARE done INT DEFAULT FALSE;
    DECLARE cur CURSOR FOR SELECT s.SubscriberID, s.SubscriberName, s.SubscriptionDate FROM Subscribers s;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

    OPEN cur;

    read_loop: LOOP
        FETCH cur INTO SubscriberID, SubscriberName, SubscriptionDate;
        IF done THEN
            LEAVE read_loop;
        END IF;
        SELECT SubscriberID, SubscriberName, SubscriptionDate;
    END LOOP;

    CLOSE cur;
END //

DELIMITER ;

CALL retrieveWithCursor();