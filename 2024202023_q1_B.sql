DELIMITER //
CREATE PROCEDURE retrieveUsers()
BEGIN
SELECT SubscriberName FROM Subscribers;
END //
DELIMITER ;

CALL retrieveUsers();