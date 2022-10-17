DROP TABLE IF EXISTS `tags`;

CREATE TABLE `tags`
  (id int);

ALTER TABLE `tags`
  ADD COLUMN name varchar(255);

INSERT INTO `tags`
  VALUES(1, "krug");

INSERT INTO `tags`
  VALUES(2, "ruby");

INSERT INTO `tags`
  VALUES(3, "programming");

SELECT `tags`.* FROM `tags`;
SELECT `tags`.* FROM `tags`
  WHERE name LIKE "%u%";
