/* Предметная область:  компьютеры, железо, комплектации */

/* 1 lab */
CREATE TABLE `computer` 
( 
  `id` INT NOT NULL AUTO_INCREMENT, 
  `name` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '' , 
  PRIMARY KEY (`id`)
);

CREATE TABLE `manufacter` 
( 
  `id` INT NOT NULL AUTO_INCREMENT, 
  `name` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '' , 
  `address` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '' , 
  PRIMARY KEY (`id`)
);

CREATE TABLE `accessory` 
( 
  `id` INT NOT NULL AUTO_INCREMENT, 
  `manufacter_id` INT NOT NULL,
  `name` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '' , 
  `type` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '' ,
  `price` INT NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  FOREIGN KEY (manufacter_id) REFERENCES manufacter(id)
);

CREATE TABLE `soft` 
( 
  `id` INT NOT NULL AUTO_INCREMENT, 
  `name` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '' , 
  `type` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '' , 
  PRIMARY KEY (`id`)
);

CREATE TABLE `soft_computer` 
(
  `computer_id` INT NOT NULL,
  `soft_id` INT NOT NULL,
  FOREIGN KEY (computer_id) REFERENCES computer(id),
  FOREIGN KEY (soft_id) REFERENCES soft(id)
);

CREATE TABLE `computer_accessory` 
(
  `computer_id` INT NOT NULL,
  `accessory_id` INT NOT NULL,
  FOREIGN KEY (computer_id) REFERENCES computer(id), 
  FOREIGN KEY (accessory_id) REFERENCES accessory(id)
);




CREATE TABLE `accessory_country` 
(
  `accessory_id` INT NOT NULL,
  `country` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '' ,
  FOREIGN KEY (accessory_id) REFERENCES accessory(id)
);

CREATE TABLE `accessory_availability` 
(
  `accessory_id` INT NOT NULL,
  `count` INT NOT NULL DEFAULT 0,
  FOREIGN KEY (accessory_id) REFERENCES accessory(id)
);


INSERT INTO 
  `computer` 
    (`name`) 
VALUES 
  ('Invasion Revolt'),
  ('Invasion Pandora'),
  ('Invasion Revolt RS'),
  ('Invasion Revolt X'),
  ('Invasion Da Vinci'),
  ('Invasion Da Vinci mini'),
  ('Invasion Powered by ASUS');


INSERT INTO 
  `manufacter` 
    (`name`, `address`) 
VALUES 
  ('China', '36 BAOSHAN JIUCUN'),
  ('Germany', 'Grüner Weg 6'),
  ('USA', 'SEATTLE WA 98102');

INSERT INTO
  `accessory`
    (`manufacter_id`, `name`, `type`, `price`)
VALUES
    ('1', 'Intel Core i5 7600k', 'processor', 1000),
    ('1', 'Intel Core i5 7500', 'processor', 1200),
    ('1', 'Intel Core i7 7700', 'processor', 1300),
    ('1', 'Intel Core i7 7700K', 'processor', 2000),
    ('1', 'Nvidia GeForce GTX 1080', 'videocard', 1050),
    ('1', 'Nvidia GeForce GTX 1070', 'videocard', 950);

INSERT INTO 
  `computer_accessory` 
    (`computer_id`, `accessory_id`) 
VALUES 
  ('1', '2'),
  ('2', '1'),
  ('3', '4'),
  ('4', '3'),
  ('5', '6'),
  ('6', '5');

INSERT INTO 
  `accessory_country` 
    (`accessory_id`, `country`) 
VALUES 
  ('1', 'Russia'),
  ('2', 'China'),
  ('3', 'USA'),
  ('4', 'Germany'),
  ('5', 'UK'),
  ('6', 'Japan');

INSERT INTO 
  `accessory_availability` 
    (`accessory_id`, `count`) 
VALUES 
  ('1', '10'),
  ('2', '1'),
  ('3', '5'),
  ('4', '9'),
  ('5', '6'),
  ('6', '11');

INSERT INTO 
  `soft` 
    (`type`, `name`) 
VALUES 
  ('Operating system', 'Windows 10'),
  ('Operating system', 'Windows 10 Pro'),
  ('Operating system', 'Windows 8'),
  ('Operating system', 'Windows 8.1'),
  ('Antivirus', 'Kaspersky Internet Security'),
  ('Antivirus', 'Dr. Web Cure it!');

INSERT INTO 
  `soft_computer` 
    (`computer_id`, `soft_id`) 
VALUES 
  ('1', '2'),
  ('2', '1'),
  ('3', '4'),
  ('4', '3'),
  ('5', '6'),
  ('6', '5');


/* 2 Lab */

INSERT INTO 
  `soft` 
    (`type`, `name`)
VALUES 
  ('IDE', 'PHPStrom');

INSERT INTO 
  `soft` 
    (`type`, `name`)
VALUES 
  ('IDE', 'WebStrom');


INSERT INTO `soft_computer` (`computer_id`, `soft_id`)
VALUES
  SELECT 
      `id`,
      63 
  FROM 
      `computer` 
  WHERE `name` = 'Invasion Revolt RS';



INSERT INTO 
  `soft_computer` 
    (`computer_id`, `soft_id`)
VALUES
  ((SELECT 
      `id` 
    FROM 
      `computer` 
    WHERE `name` = 'Invasion Revolt RS'
    ), 
  (SELECT 
    `id` 
   FROM 
     `soft` 
   WHERE 
     `name` LIKE 'Kaspersky%'));


INSERT INTO 
  `computer_accessory` 
    (`computer_id`, `accessory_id`)
VALUES
  ((SELECT 
      `id` 
    FROM 
      `computer` 
    WHERE `id` = '2'
    ), 
  (SELECT 
    `id` 
   FROM 
     `accessory` 
   WHERE 
     `name` = 'Nvidia GeForce GTX 1080'));



SELECT 
  `name` 
FROM 
  `computer` 
WHERE 
  `id` = '1';

SELECT 
  COUNT(*) 
FROM 
  `accessory` 
WHERE 
  `price` < '1300';

DELETE FROM 
  `soft` 
WHERE 
  `name` = 'PHPStorm';

DELETE FROM 
  `accessory` 
WHERE 
  `price` = '1300';

UPDATE 
  `computer` 
SET 
  `name` = 'Revolt XY' 
WHERE 
  `name` = 'Invasion Revolt X';

UPDATE 
  `accessory` 
SET 
  `name` = 'Intel Core i5-7600' 
WHERE 
  `id` = '2';

  SELECT 
    `name` 
  FROM 
    `computer` 
  WHERE 
    `name` LIKE '%Revolt%' 
UNION 
  SELECT 
    `name` 
  FROM 
    `soft` 
  WHERE `type` LIKE '%Antivirus%';

SELECT DISTINCT
  `name` AS `accessory_name`
FROM 
  `accessory` 
WHERE 
  `type` = 'videocard' 
UNION ALL 
  SELECT DISTINCT
    `name`
  FROM 
    `accessory` 
  WHERE 
    `type` = 'processor';