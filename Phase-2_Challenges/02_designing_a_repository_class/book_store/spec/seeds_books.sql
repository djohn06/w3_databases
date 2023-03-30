TRUNCATE TABLE books RESTART IDENTITY; -- replace with your own table name.

-- Below this line there should only be `INSERT` statements.
-- Replace these statements with your own seed data.

INSERT INTO books (title, author_name) VALUES ('The Lord of the Rings', 'J.R.R. Tolkien');
INSERT INTO books (title, author_name) VALUES ('To Kill a Mockingbird', 'Harper Lee');