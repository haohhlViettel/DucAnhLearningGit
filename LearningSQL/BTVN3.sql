-- BTVN 3 create database from diagram
-- Generate all table with primary key
CREATE TABLE actor (
	act_id INT PRIMARY KEY NOT NULL,
	act_fname VARCHAR(20) NULL,
    act_lname VARCHAR(20) NULL,
    act_gender VARCHAR(1) NULL
);

CREATE TABLE director (
	dir_id INT PRIMARY KEY NOT NULL,
    dir_fname VARCHAR(20) NULL, 
    dir_lname VARCHAR(20) NULL
);

CREATE TABLE movie (
	mov_id INT PRIMARY KEY NOT NULL,
    move_title VARCHAR(50) NULL,
    mov_year INT NULL,
    mov_time INT NULL,
    mov_lang VARCHAR(50) NULL,
    mov_dt_rel DATE NULL,
    mov_rel_country VARCHAR(5) NULL
);

CREATE TABLE reviewer (
	rev_id INT PRIMARY KEY NOT NULL,
    rev_name VARCHAR(30) NULL
);

CREATE TABLE genres (
	gen_id INT PRIMARY KEY NOT NULL,
    gen_title VARCHAR(20) NULL
);

SELECT * FROM movie;
-- observe relationship among children table
-- create variable first then apply foreign key () to that variable
CREATE TABLE movie_cast (
	movie_cast_id INT PRIMARY KEY NOT NULL,
	act_id INT NULL,
    mov_id INT NULL,
	FOREIGN KEY (act_id)  REFERENCES actor(act_id),
    FOREIGN KEY (mov_id)  REFERENCES movie(mov_id),
    `role` VARCHAR(30) NULL
);
SELECT * FROM movie_direction; 

CREATE TABLE movie_direction (
	movie_direction_id INT PRIMARY KEY NOT NULL,
	dir_id INT NULL,
    mov_id INT NULL,
	FOREIGN KEY (dir_id)  REFERENCES director(dir_id),
    FOREIGN KEY (mov_id)  REFERENCES movie(mov_id)
);
SELECT * FROM movie_genres;

CREATE TABLE movie_genres (
    movie_gen_id INT PRIMARY KEY NOT NULL,
	mov_id INT NULL,
    gen_id INT NULL,
	FOREIGN KEY (mov_id)  REFERENCES movie(mov_id),
    FOREIGN KEY (gen_id)  REFERENCES genres(gen_id)
);
SELECT * FROM movie_genres;
CREATE TABLE rating (
	rating_id INT PRIMARY KEY NOT NULL,
	mov_id INT NULL,
    rev_id INT NULL,
	FOREIGN KEY (mov_id)  REFERENCES movie(mov_id),
    FOREIGN KEY (rev_id)  REFERENCES reviewer(rev_id),
    rev_stars INT NULL,
    num_o_ratings INT NULL
);
SELECT * FROM rating;
DROP TABLE rating;

-- SELECT ALL
SELECT * FROM movie 
LEFT JOIN movie_cast ON movie.mov_id = movie_cast.mov_id 
LEFT JOIN movie_direction ON movie.mov_id = movie_direction.mov_id
LEFT JOIN director ON director.dir_id = movie_direction.dir_id
LEFT JOIN actor ON movie_cast.act_id = actor.act_id
LEFT JOIN movie_genres ON  movie.mov_id = movie_genres.mov_id
LEFT JOIN genres ON genres.gen_id = movie_genres.gen_id
LEFT JOIN rating ON rating.mov_id = movie.mov_id
LEFT JOIN reviewer ON reviewer.rev_id = rating.rev_id
UNION ALL
SELECT * FROM movie 
RIGHT JOIN movie_cast ON movie.mov_id = movie_cast.mov_id 
RIGHT JOIN movie_direction ON movie.mov_id = movie_direction.mov_id
RIGHT JOIN director ON director.dir_id = movie_direction.dir_id
RIGHT JOIN actor ON movie_cast.act_id = actor.act_id
RIGHT JOIN movie_genres ON  movie.mov_id = movie_genres.mov_id
RIGHT JOIN genres ON genres.gen_id = movie_genres.gen_id
RIGHT JOIN rating ON rating.mov_id = movie.mov_id
RIGHT JOIN reviewer ON reviewer.rev_id = rating.rev_id;


-- ADDING THINGS TO TABLE, START FROM Parents (5 tables have the primary key)
INSERT INTO  movie (mov_id, move_title, mov_year, mov_time, 
	mov_lang, mov_dt_rel, mov_rel_country )
VALUES 
(1, "AVENGER", 2020, 120, "ENGLISH", '2020-10-10', "US")
;

SELECT * FROM movie;
INSERT INTO  actor (act_id, act_fname, act_lname, act_gender)
VALUES 
(1, "John", "SNOW", "M")
;
INSERT INTO  director (dir_id, dir_fname, dir_lname)
VALUES 
(1, "WILL", "DICK")
;

INSERT INTO  genres (gen_id, gen_title)
VALUES 
(1, "GOTHIC")
;

INSERT INTO  reviewer (rev_id, rev_name)
VALUES 
(9001, "Righty Sock"),
(9002, "Jack Malvern"),
(9003, "Flagrant Baronessa"),
(9004, "Alec Shaw"),
(9005, NULL),
(9006, "Victor Woeltjen"),
(9007, "Simon Wright"),
(9008, "Neal Wruck"),
(9009, "Paul Monks"),
(9010, "Mike Salvati"),
(9011, NULL),
(9012, "Wesley S. Walker"),
(9013, "Sasha Goldshtein"),
(9014, "Josh Cates"),
(9015, "Krug Stillo"),
(9016, "Scott LeBrun"),
(9017, "Hannah Steele"),
(9018, "Vincent Cadena"),
(9019, "Brandt Sponseller"),
(9020, "Richard Adams");

SELECT * FROM rating;






;

INSERT INTO  movie_cast (act_id, mov_id, `role`)
VALUES 
(1, 1, "SNOW MAN")
;

INSERT INTO  movie_direction (dir_id, mov_id)
VALUES 
(1, 1)
;

INSERT INTO  movie_genres (mov_id, gen_id)
VALUES 
(1, 1)
;

INSERT INTO  rating (mov_id, rev_id, rev_stars, num_o_ratings)
VALUES 
(1, 1, 5, 5)
;



SELECT move_title, mov_year FROM movie; 
-- Don't have in the table?
SELECT mov_dt_rel FROM movie WHERE move_title LIKE 'American Beauty';


SELECT move_title FROM movie WHERE mov_year = 1999;
SELECT move_title FROM movie WHERE mov_year < 1998;

SELECT rev_name FROM reviewer 
UNION 
SELECT move_title FROM movie;

SELECT rev_name FROM reviewer INNER JOIN rating ON reviewer.rev_id = rating.rev_id
WHERE rev_stars >= 7;

SELECT * FROM rating WHERE mov_id = 1;
SELECT * FROM reviewer;

SELECT move_title FROM movie
WHERE mov_id NOT IN (SELECT mov_id FROM rating);

SELECT * FROM movie;


SELECT move_title FROM movie WHERE mov_id IN (905, 907, 917);

SELECT move_title, mov_year FROM movie WHERE move_title LIKE '%Boogie%Nights%';


SELECT act_id FROM actor 
WHERE act_fname = 'Woody' AND act_lname = 'Allen';


-- More excercise with join --
SELECT rev_name FROM reviewer INNER JOIN rating ON rating.rev_id = reviewer.rev_id
WHERE rev_stars IS NULL;

SELECT act_fname, act_lname FROM actor 
INNER JOIN movie_cast ON movie_cast.act_id = actor.act_id
INNER JOIN movie ON movie_cast.mov_id = movie.mov_id
WHERE movie.move_title LIKE 'Annie Hall';

SELECT dir_fname, dir_lname, move_title FROM movie_direction
INNER JOIN movie ON movie_direction.mov_id = movie.mov_id
INNER JOIN director ON director.dir_id = movie_direction.dir_id
INNER JOIN movie_cast USING(mov_id)
INNER JOIN actor USING(act_id)
WHERE move_title like 'Eyes Wide Shut';

SELECT * FROM movie_cast WHERE role LIKE 'E%';

SELECT * FROM movie_direction;

SELECT dir_fname, dir_lname, move_title FROM movie_direction
INNER JOIN movie USING(mov_id)
INNER JOIN director USING(dir_id)
INNER JOIN movie_cast USING(mov_id)
INNER JOIN actor USING(act_id)
WHERE role LIKE 'Sean Maguire';

SELECT * FROM actor 
INNER JOIN movie_cast USING (act_id)
INNER JOIN movie USING(mov_id)
WHERE mov_year NOT BETWEEN 1900 AND 2000;

SELECT d.dir_fname, d.dir_lname, g.gen_title, m.move_title FROM director AS d
INNER JOIN movie_direction AS md USING(dir_id)
INNER JOIN movie AS m USING (mov_id)
INNER JOIN movie_genres AS mg USING (mov_id)
INNER JOIN genres AS g USING(gen_id)
ORDER BY d.dir_fname, d.dir_lname;

SELECT move_title, mov_year, gen_title FROM movie
INNER JOIN movie_genres USING (mov_id)
INNER JOIN genres USING (gen_id);

-- SELECT COUNT(person_id), country FROM population 
-- GROUP BY country;

SELECT move_title, mov_year, gen_title, dir_fname, dir_lname FROM movie
INNER JOIN movie_genres USING (mov_id)
INNER JOIN genres USING (gen_id)
INNER JOIN movie_direction USING(mov_id) 
INNER JOIN director USING(dir_id);

SELECT move_title, mov_year, mov_dt_rel, mov_time, dir_fname, dir_lname FROM movie AS m
INNER JOIN movie_direction USING (mov_id)
INNER JOIN director USING(dir_id)
WHERE m.mov_dt_rel < '1989-01-01'
ORDER BY m.mov_dt_rel DESC;

SELECT COUNT(move_title) AS "Number of movie", gen_title AS "Genre title", AVG(mov_time) AS "Average time" FROM movie
INNER JOIN movie_genres USING (mov_id)
INNER JOIN genres USING(gen_id)
GROUP BY gen_title;

SELECT mov_year, dir_fname, CONCAT(dir_lname, ' ', act_fname) AS "Director name", act_lname, role FROM movie
INNER JOIN movie_cast USING(mov_id)
INNER JOIN actor USING (act_id)
INNER JOIN movie_direction USING (mov_id)
INNER JOIN director USING (dir_id)
WHERE mov_time = (SELECT MIN(mov_time) FROM movie);

SELECT mov_year FROM movie 
INNER JOIN rating USING(mov_id)
WHERE num_o_ratings = 3 OR num_o_ratings = 4
ORDER BY rev_stars ASC;

SELECT rev_name, move_title, rev_stars FROM movie 
INNER JOIN rating USING(mov_id)
INNER JOIN reviewer USING (rev_id);

SELECT move_title, MAX(rev_stars) AS m FROM movie 
INNER JOIN rating USING (mov_id)
GROUP BY move_title
HAVING m >= 1
ORDER BY move_title; -- Don't know

SELECT dir_fname, dir_lname, move_title, num_o_ratings FROM movie
INNER JOIN movie_direction USING(mov_id)
INNER JOIN director USING(dir_id)
INNER JOIN rating USING(mov_id)
WHERE rev_stars IS NOT NULL;

-- **
SELECT move_title, act_fname, act_lname, `role` FROM movie
INNER JOIN movie_cast USING(mov_id)
INNER JOIN actor USING(act_id)
WHERE actor.act_id 
IN (SELECT act_id FROM movie_cast GROUP BY act_id HAVING COUNT(*) >= 2 );

SELECT dir_fname, dir_lname, move_title FROM movie
INNER JOIN movie_cast USING(mov_id)
INNER JOIN actor USING(act_id)
INNER JOIN movie_direction USING(mov_id)
INNER JOIN director USING(dir_id)
WHERE act_fname = "Claire" AND act_lname = "Danes";

SELECT dir_fname, dir_lname FROM movie
INNER JOIN movie_cast USING(mov_id)
INNER JOIN actor USING(act_id)
INNER JOIN movie_direction USING(mov_id)
INNER JOIN director USING(dir_id) 
WHERE dir_fname = act_fname AND dir_lname = act_lname;

SELECT mov_id, act_id, role FROM movie_cast 
INNER JOIN movie USING(mov_id)
INNER JOIN actor USING(act_id)
WHERE mov_id = (SELECT mov_id WHERE move_title = "China Town");

SELECT move_title FROM movie 
INNER JOIN movie_cast USING(mov_id) 
INNER JOIN actor USING(act_id)
WHERE act_fname = 'Harrison' AND act_lname = 'Ford';

SELECT move_title, mov_year, rev_stars, mov_rel_country FROM movie
INNER JOIN rating USING(mov_id)
WHERE rev_stars = (SELECT MAX(rev_stars) FROM rating);

SELECT move_title, mov_year, rev_stars FROM movie
INNER JOIN rating USING(mov_id)
INNER JOIN movie_genres USING(mov_id)
INNER JOIN genres USING(gen_id)
WHERE gen_title = 'Mystery' AND rev_stars IN(SELECT MAX(rev_stars) FROM rating);

SELECT mov_year, COUNT(mov_id) AS 'Number of movies', AVG(rev_stars) AS 'Average rating' FROM movie
INNER JOIN rating USING(mov_id)
INNER JOIN movie_genres USING(mov_id)
INNER JOIN genres USING(gen_id) 
WHERE gen_title = 'Mystery';

SELECT move_title, CONCAT(act_lname, ' ', act_fname) AS 'Actor name', mov_year, role, gen_title, CONCAT(dir_lname, ' ', dir_fname) AS 'Director name', mov_year, rev_stars FROM movie
INNER JOIN rating USING(mov_id)
INNER JOIN movie_genres USING(mov_id)
INNER JOIN genres USING(gen_id) 
INNER JOIN movie_direction USING(mov_id)
INNER JOIN director USING(dir_id)
INNER JOIN movie_cast USING(mov_id)
INNER JOIN actor USING(act_id)
WHERE act_gender = "F";


















