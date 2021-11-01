/* INSERT */
CREATE TABLE "workers"(
  id SERIAL PRIMARY KEY,
  "name" VARCHAR(24) NOT NULL CHECK("name" != ''),
  birthday DATE NOT NULL CHECK(
    birthday > '1920-1-1'
    AND birthday < current_date
  ),
  salary NUMERIC(10, 2) NOT NULL
);
INSERT INTO workers ("name", birthday, salary)
VALUES ('Никита', '1990/1/1', 300);
INSERT INTO workers ("name", birthday, salary)
VALUES ('Светлана', '1990/1/1', 1200);
INSERT INTO workers ("name", birthday, salary)
VALUES ('Ярослав', '1980/1/1', 1200),
  ('Петр', '1993/1/1', 1000);
INSERT INTO workers ("name", birthday, salary)
VALUES ('Сергей', '1963/1/1', 4000),
  ('Василий', '2000/4/8', 500),
  ('Геннадий', '1988/2/5', 1500),
  ('Михаил', '1973/4/3', 2000),
  ('Коля', '1975/4/3', 3222);
/* /INSERT */
/* UPDATE */
UPDATE workers
SET salary = 200
WHERE "name" = 'Василий';
UPDATE workers
SET birthday = '1987/1/1'
WHERE id = 4;
UPDATE workers
SET birthday = '1987/1/1'
WHERE id = 4;
UPDATE workers
SET salary = 700
WHERE salary = 500;
UPDATE workers
SET birthday = '1999/1/1'
WHERE id >= 2
  AND id <= 5;
UPDATE workers
SET "name" = 'Женя',
  salary = salary + 700
WHERE "name" = 'Василий';
/* /UPDATE */
/* SELECT */
SELECT *
FROM workers
WHERE id = 3;
SELECT *
FROM workers
WHERE salary = 400;
SELECT *
FROM workers
WHERE salary != 300;
SELECT salary,
  birthday
FROM workers
WHERE "name" = 'Женя';
SELECT *
FROM workers
WHERE "name" = 'Петя';
SELECT *
FROM workers
WHERE "name" != 'Петя';
SELECT *
FROM workers
WHERE age(birthday) < make_interval(27)
  OR salary = 1000;
SELECT *
FROM workers
WHERE age(birthday) > make_interval(25)
  AND age(birthday) <= make_interval(28);
SELECT *
FROM workers
WHERE age(birthday) > make_interval(23)
  AND age(birthday) <= make_interval(27)
  OR salary >= 400
  AND salary <= 1000;
SELECT *
FROM workers
WHERE age(birthday) < make_interval(27)
  OR salary != 400;
/* /SELECT */
/* DELETE */
DELETE FROM workers
WHERE id = 7;
DELETE FROM workers
WHERE "name" = 'Коля';
DELETE FROM workers
WHERE age(birthday) = make_interval(23);
/* /DELETE */