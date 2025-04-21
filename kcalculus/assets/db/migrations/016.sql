PRAGMA foreign_keys = OFF;

--SQL-STATEMENT-SEPARATOR

ALTER TABLE dishes RENAME TO dishes_old;

--SQL-STATEMENT-SEPARATOR

CREATE TABLE dishes (
    id TEXT NOT NULL PRIMARY KEY,
    mass_per_amount_value REAL,
    mass_per_amount_unit TEXT,
    mass_total_amount_value REAL,
    mass_total_amount_unit TEXT,
    volume_per_amount_value REAL,
    volume_per_amount_unit TEXT,
    volume_total_amount_value REAL,
    volume_total_amount_unit TEXT,
    quantity_per_amount_value REAL,
    quantity_per_amount_unit TEXT,
    quantity_total_amount_value REAL,
    quantity_total_amount_unit TEXT,
    FOREIGN KEY (id) REFERENCES edibles (id)
);

--SQL-STATEMENT-SEPARATOR

INSERT INTO dishes (
    id,
    mass_total_amount_value
)
SELECT
    id,
    weight_in_grams
FROM dishes_old;

--SQL-STATEMENT-SEPARATOR

UPDATE dishes
SET
    mass_per_amount_value = 100,
    mass_per_amount_unit = 'gram',
    mass_total_amount_unit = 'gram';

--SQL-STATEMENT-SEPARATOR

DROP TABLE dishes_old;

--SQL-STATEMENT-SEPARATOR

PRAGMA foreign_keys = ON;
