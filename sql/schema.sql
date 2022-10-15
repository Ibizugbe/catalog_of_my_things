
-- Create authors table
create table authors(
  id serial not null primary key,
  name varchar(100),
  last_name varchar(100)
);

-- create games table
create table games(
  id serial not null primary key,
  multiplayer varchar(100),
  last_played date,
  publish_date date
);
