-- DROP USER IF EXISTS 'applicationuser';
CREATE USER IF NOT EXISTS 'applicationuser' IDENTIFIED BY 'applicationuser';
GRANT SELECT, INSERT, UPDATE, DELETE, CREATE, DROP, RELOAD, PROCESS, REFERENCES, INDEX, ALTER, SHOW DATABASES, CREATE TEMPORARY TABLES, LOCK TABLES, EXECUTE, REPLICATION SLAVE, REPLICATION CLIENT, CREATE VIEW, SHOW VIEW, CREATE ROUTINE, ALTER ROUTINE, CREATE USER, EVENT, TRIGGER ON *.* TO 'applicationuser' WITH GRANT OPTION;

-- DROP DATABASE IF EXISTS movie_db;
CREATE DATABASE IF NOT EXISTS movie_db;

CREATE TABLE IF NOT EXISTS movie_db.publication (name VARCHAR(255) PRIMARY KEY, avatar VARCHAR(21));
CREATE TABLE IF NOT EXISTS movie_db.reviewer (name VARCHAR(255) PRIMARY KEY, avatar VARCHAR(255), publication VARCHAR(255), FOREIGN KEY (publication) REFERENCES publication(name) ON DELETE CASCADE);
CREATE TABLE IF NOT EXISTS movie_db.moviereview (title VARCHAR(255) PRIMARY KEY, `release` VARCHAR(255), score INTEGER, reviewer VARCHAR(255), FOREIGN KEY (reviewer) REFERENCES reviewer(name) ON DELETE CASCADE);

INSERT IGNORE INTO movie_db.publication (name, avatar) VALUES ('The Daily Reviewer', 'glyphicon-eye-open');
INSERT IGNORE INTO movie_db.publication (name, avatar) VALUES ('International Movie Critic', 'glyphicon-fire');
INSERT IGNORE INTO movie_db.publication (name, avatar) VALUES ('MoviesNow', 'glyphicon-time');
INSERT IGNORE INTO movie_db.publication (name, avatar) VALUES ('MyNextReview', 'glyphicon-record');
INSERT IGNORE INTO movie_db.publication (name, avatar) VALUES ('Movies n\' Games', 'glyphicon-heart-empty');
INSERT IGNORE INTO movie_db.publication (name, avatar) VALUES ('TheOne', 'glyphicon-globe');
INSERT IGNORE INTO movie_db.publication (name, avatar) VALUES ('ComicBookHero.com', 'glyphicon-flash');

INSERT IGNORE INTO movie_db.reviewer (name, avatar, publication) VALUES ('Robert Smith','https://s3.amazonaws.com/uifaces/faces/twitter/angelcolberg/128.jpg','The Daily Reviewer');
INSERT IGNORE INTO movie_db.reviewer (name, avatar, publication) VALUES ('Chris Harris','https://s3.amazonaws.com/uifaces/faces/twitter/bungiwan/128.jpg','International Movie Critic');
INSERT IGNORE INTO movie_db.reviewer (name, avatar, publication) VALUES ('Janet Garcia','https://s3.amazonaws.com/uifaces/faces/twitter/grrr_nl/128.jpg','MoviesNow');
INSERT IGNORE INTO movie_db.reviewer (name, avatar, publication) VALUES ('Andrew West','https://s3.amazonaws.com/uifaces/faces/twitter/d00maz/128.jpg','MyNextReview');
INSERT IGNORE INTO movie_db.reviewer (name, avatar, publication) VALUES ('Mindy Lee','https://s3.amazonaws.com/uifaces/faces/twitter/laurengray/128.jpg','Movies n\' Games');
INSERT IGNORE INTO movie_db.reviewer (name, avatar, publication) VALUES ('Martin Thomas','https://s3.amazonaws.com/uifaces/faces/twitter/karsh/128.jpg','TheOne');
INSERT IGNORE INTO movie_db.reviewer (name, avatar, publication) VALUES ('Anthony Miller','https://s3.amazonaws.com/uifaces/faces/twitter/9lessons/128.jpg','ComicBookHero.com');

INSERT IGNORE INTO movie_db.moviereview (title, `release`, score, reviewer) VALUES ('Deadpool', '2016', 11, 'Robert Smith');
INSERT IGNORE INTO movie_db.moviereview (title, `release`, score, reviewer) VALUES ('Thor: Ragnarok', '2017', 7, 'Chris Harris');
INSERT IGNORE INTO movie_db.moviereview (title, `release`, score, reviewer) VALUES ('It', '2017', 8, 'Janet Garcia');
INSERT IGNORE INTO movie_db.moviereview (title, `release`, score, reviewer) VALUES ('Dunkirk', '2017', 8, 'Andrew West');
INSERT IGNORE INTO movie_db.moviereview (title, `release`, score, reviewer) VALUES ('Logan', '2017', 8, 'Mindy Lee');
INSERT IGNORE INTO movie_db.moviereview (title, `release`, score, reviewer) VALUES ('Batman V Superman', '2016', 6, 'Martin Thomas');
INSERT IGNORE INTO movie_db.moviereview (title, `release`, score, reviewer) VALUES ('Mad Max: Fury Road', '2015', 6, 'Anthony Miller');
