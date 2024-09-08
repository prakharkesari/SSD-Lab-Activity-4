DELIMITER //
 CREATE PROCEDURE AddShow(IN showid INT, IN title VARCHAR(100), IN genre VARCHAR(50), IN releaseyear INT)
 BEGIN
  INSERT INTO Shows (ShowID, Title, Genre, ReleaseYear) VALUES (showid, title, genre, releaseyear);
 END //
DELIMITER ;

CALL AddShow(4, 'Conjuring', 'Horror', 2024);