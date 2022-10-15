DROP TABLE IF EXISTS `jobs`;

CREATE TABLE `jobs`
  (id int);

ALTER TABLE `jobs`
  ADD COLUMN name varchar(255);

INSERT INTO `jobs`
  VALUES(1, "programmer");

INSERT INTO `jobs`
  VALUES(2, "pilot");

INSERT INTO `jobs`
  VALUES(3, "taxi driver");

SELECT `jobs`.* FROM `jobs`;
SELECT `jobs`.* FROM `jobs`
  WHERE name LIKE "%i%";
