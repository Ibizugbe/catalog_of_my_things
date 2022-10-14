-- create database for catalog
CREATE DATABASE IF NOT EXISTS catalog_of_things;

-- create table my_catalog
CREATE TABLE my_catalog(
  id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY, 
  genre_id     INT NOT NULL,
  author_id    INT NOT NULL,
  label_id     INT NOT NULL,
  publish_date DATE NOT NULL,
  archived     BOOLEAN NOT NULL,
  CONSTRAINT label_fk FOREIGN KEY (label_id) REFERENCES Labels (id),
  CONSTRAINT author_fk FOREIGN KEY (author_id) REFERENCES Authors (id),
  CONSTRAINT genre_fk FOREIGN KEY (genre_id) REFERENCES Genres (id)
);

-- create table for music_albums
CREATE TABLE music_albums(
  ID SERIAL PRIMARY KEY,
  publish_date DATE NOT NULL,
  on_spotify BOOLEAN NOT NULL,
  archived BOOLEAN NOT NULL,
  label_ID INT REFERENCES label(ID),
  author_ID INT REFERENCES author(ID),
  genre_ID INT REFERENCES genre(ID)
);

-- create table for genres
CREATE TABLE genre(
  ID SERIAL PRIMARY KEY,
  name VARCHAR(50)
);

-- create table for labels
CREATE TABLE label
(
    id    SERIAL PRIMARY KEY,
    title VARCHAR(100),
    color VARCHAR(100)
)

-- create table for books
CREATE TABLE book
(
    id           SERIAL PRIMARY KEY,
    publish_date DATE,
    archived     BOOLEAN,
    publisher    VARCHAR(100),
    cover_state  VARCHAR(50),
    label_id     INTEGER REFERENCES label (id)
)