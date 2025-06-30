CREATE TABLE default_nutrients (
    name TEXT NOT NULL PRIMARY KEY,
    position INTEGER NOT NULL
);

--SQL-STATEMENT-SEPARATOR

INSERT INTO default_nutrients
    (name, position)
VALUES
    ('energy', 0),
    ('fat', 1),
    ('saturatedFat', 2),
    ('transFat', 3),
    ('totalCarbs', 4),
    ('fiber', 5),
    ('sugar', 6),
    ('protein', 7),
    ('cholesterol', 8),
    ('sodium', 9),
    ('potassium', 10),
    ('calcium', 11),
    ('iron', 12);
