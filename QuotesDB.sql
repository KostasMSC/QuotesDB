DROP DATABASE IF EXISTS QUOTES_DB;

CREATE DATABASE QUOTES_DB;

USE QUOTES_DB;

CREATE TABLE QUOTES_TABLE (
  id     INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY,
  QUOTE  VARCHAR(255),
  AUTHOR VARCHAR(63)
) AUTO_INCREMENT=1;

INSERT INTO QUOTES_TABLE (QUOTE, AUTHOR) VALUES
  ('I have no special talent. I am only passionately curious.', 'Albert Einstein');
INSERT INTO QUOTES_TABLE (QUOTE, AUTHOR) VALUES
  ('It always seems impossible until it''s done.', 'Nelson Mandela');
INSERT INTO QUOTES_TABLE (QUOTE, AUTHOR) VALUES
  ('The two most important days in your life are the day you are born and the day you find out why.', 'Mark Twain');
INSERT INTO QUOTES_TABLE (QUOTE, AUTHOR) VALUES
  ('Without music, life would be a mistake.', 'Friedrich Nietzsche');
INSERT INTO QUOTES_TABLE (QUOTE, AUTHOR) VALUES
  ('Perfection is achieved, not when there is nothing more to add, but when there is nothing left to take away.', 'Antoine de Saint-Exupery');
INSERT INTO QUOTES_TABLE (QUOTE, AUTHOR) VALUES
  ('At your job you must be serious but at life you must be crazy.', 'Aristotle Onassis');
INSERT INTO QUOTES_TABLE (QUOTE, AUTHOR) VALUES
  ('I choose a lazy person to do a hard job. Because a lazy person will find an easy way to do it.', 'Bill Gates');
INSERT INTO QUOTES_TABLE (QUOTE, AUTHOR) VALUES
  ('There is more stupidity than hydrogen in the universe, and it has a longer shelf life.', 'Frank Zappa');
INSERT INTO QUOTES_TABLE (QUOTE, AUTHOR) VALUES
  ('Happiness is when what you think, what you say, and what you do are in harmony.', 'Mahatma Ghandi');
INSERT INTO QUOTES_TABLE (QUOTE, AUTHOR) VALUES
  ('Don''t follow the crowd, let the crowd follow you.', 'Margaret Thatcher');

CREATE USER 'root'@'%' IDENTIFIED BY 'helloworld';
GRANT ALL PRIVILEGES ON QUOTES_DB.* TO 'root'@'%';
FLUSH PRIVILEGES;
  