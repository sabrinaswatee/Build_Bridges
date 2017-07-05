
CREATE TABLE users(
  id SERIAL4 PRIMARY KEY,
  email VARCHAR(400),
  password_digest TEXT,
  name VARCHAR(600),
  address VARCHAR(800)
);

CREATE TABLE posts(
  id SERIAL4 PRIMARY KEY,
  user_id INTEGER,
  body text,
  location VARCHAR(800),
  category VARCHAR(500),
  stamp VARCHAR(500)
);

CREATE TABLE enquiries(
  id SERIAL4 PRIMARY KEY,
  post_id INTEGER,
  body TEXT,
  stamp VARCHAR(500)
);
