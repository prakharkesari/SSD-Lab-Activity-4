DELIMITER //
CREATE PROCEDURE cumulative()
BEGIN
	SELECT s.SubscriberID, s.SubscriberName, SUM(w.WatchTime) AS CumulativeTime
    FROM Subscribers s,WatchHistory w
    WHERE s.SubscriberID = w.SubscriberID
    GROUP BY s.SubscriberID;
END //
DELIMITER ;

CALL cumulative();