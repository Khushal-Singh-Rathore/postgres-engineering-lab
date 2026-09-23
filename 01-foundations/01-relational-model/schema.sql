-- ============================================================
-- RELATIONAL MODEL
-- ============================================================

-- users table
CREATE TABLE users (
    id INTEGER PRIMARY KEY,
    username TEXT NOT NULL
);

-- posts table
-- One user can have many posts.
-- user_id connects each post to its author.
CREATE TABLE posts (
    id INTEGER PRIMARY KEY,
    user_id INTEGER REFERENCES users(id),
    content TEXT NOT NULL
);


-- ============================================================
-- RELATIONSHIP
-- ============================================================
-- users (1) ───────────< posts (many)
--
-- users.id       = primary key
-- posts.user_id = foreign key
--
-- A user's id can appear in many posts.


-- ============================================================
-- JOIN MENTAL MODEL
-- ============================================================
--
-- INNER JOIN:
--   Only matching rows survive.
--
-- LEFT JOIN:
--   Every row from the left table survives.
--   If there is no matching row on the right,
--   right-table columns become NULL.
--
-- Example:
--
-- SELECT users.username, posts.content
-- FROM users
-- JOIN posts
--     ON users.id = posts.user_id;
--
-- SELECT users.username, posts.content
-- FROM users
-- LEFT JOIN posts
--     ON users.id = posts.user_id;


-- ============================================================
-- JOIN + AGGREGATION
-- ============================================================
--
-- JOINs can produce multiple rows for one user.
--
-- Example:
--   Alice → post 1
--   Alice → post 2
--
-- GROUP BY groups the resulting rows.
--
-- COUNT(column) counts non-NULL values.
--
-- Example:
--
-- SELECT users.username, COUNT(posts.content)
-- FROM users
-- LEFT JOIN posts
--     ON users.id = posts.user_id
-- GROUP BY users.username;
--
-- Result:
--   alice   → 2
--   bob     → 1
--   charlie → 0
