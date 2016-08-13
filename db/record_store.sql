DROP TABLE stocks;
DROP TABLE albums;
DROP TABLE artists;

CREATE TABLE artists (
  id SERIAL4 PRIMARY KEY,
  name VARCHAR(255),
  genre VARCHAR(255)
);

CREATE TABLE albums (
  id serial4 PRIMARY KEY,
  name VARCHAR(255),
  artist_id INT4 REFERENCES artists(id) ON DELETE CASCADE
);

CREATE TABLE stocks (
  id SERIAL4 PRIMARY KEY,
  album_id INT4 REFERENCES albums(id) ON DELETE CASCADE,
  format VARCHAR(255),
  stock INT4,
  threshold INT4,
  buy_price INT4,
  sell_price INT4
)