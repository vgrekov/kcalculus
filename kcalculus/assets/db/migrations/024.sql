-- This is a fix for a bug with `ingredients.dish_id` referencing `dishes_old (id)` instead of `dishes (id)` after migration #016.
-- From [https://www.sqlite.org/lang_altertable.html]:
-- Prior to version 3.26.0 (2018-12-01), with PRAGMA foreign_keys=OFF, FOREIGN KEY constraints would not be changed when the table that the foreign key referred to (the "parent table") was renamed.
-- Beginning with version 3.26.0, FOREIGN KEY constraints are always converted when a table is renamed, unless the PRAGMA legacy_alter_table=ON setting is engaged.

CREATE TABLE ingredients_new (
    dish_id TEXT NOT NULL,
    edible_id TEXT NOT NULL,
    amount_value REAL NOT NULL,
    amount_unit TEXT NOT NULL,
    sequence_number INTEGER,
    FOREIGN KEY (dish_id) REFERENCES dishes (id),
    FOREIGN KEY (edible_id) REFERENCES edibles (id),
    PRIMARY KEY(dish_id, edible_id)
);

--SQL-STATEMENT-SEPARATOR

INSERT INTO ingredients_new (
    dish_id,
    edible_id,
    amount_value,
    amount_unit,
    sequence_number
)
SELECT
    dish_id,
    edible_id,
    amount_value,
    amount_unit,
    sequence_number
FROM ingredients;

--SQL-STATEMENT-SEPARATOR

DROP TABLE ingredients;

--SQL-STATEMENT-SEPARATOR

ALTER TABLE ingredients_new RENAME TO ingredients;
