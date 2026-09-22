-- users table
CREATE TABLE users (
    id INTEGER PRIMARY KEY,
    username TEXT NOT NULL
);

-- posts table

CREATE TABLE posts (
    id INTEGER PRIMARY KEY,
    user_id INTEGER REFERENCES users(id),
    content TEXT NOT NULL
);
