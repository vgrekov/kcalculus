PRAGMA foreign_keys = OFF;

--SQL-STATEMENT-SEPARATOR

ALTER TABLE nutrition_facts RENAME TO nutrition_facts_old;

--SQL-STATEMENT-SEPARATOR

CREATE TABLE nutrition_facts (
    id TEXT NOT NULL PRIMARY KEY,
    edible_id TEXT NOT NULL,
    amount_value REAL NOT NULL,
    amount_unit TEXT NOT NULL,
    FOREIGN KEY (edible_id) REFERENCES edibles (id)
);

--SQL-STATEMENT-SEPARATOR

INSERT INTO nutrition_facts (
    id,
    edible_id,
    amount_value,
    amount_unit
)
SELECT
    edible_id || '_' || amount_unit,
    edible_id,
    amount_value,
    amount_unit
FROM nutrition_facts_old;

--SQL-STATEMENT-SEPARATOR

CREATE TABLE nutrient_amounts (
    nutrition_facts_id TEXT NOT NULL,
    nutrient TEXT NOT NULL,
    amount_value REAL NOT NULL,
    amount_unit TEXT NOT NULL,
    position INTEGER NOT NULL,
    FOREIGN KEY (nutrition_facts_id) REFERENCES nutrition_facts (id),
    PRIMARY KEY(nutrition_facts_id, nutrient)
);

--SQL-STATEMENT-SEPARATOR

INSERT INTO nutrient_amounts (
    nutrition_facts_id,
    nutrient,
    amount_value,
    amount_unit,
    position
)
SELECT
    edible_id || '_' || amount_unit,
    'energy',
    calories,
    'calorie',
    0
FROM nutrition_facts_old;

--SQL-STATEMENT-SEPARATOR

INSERT INTO nutrient_amounts (
    nutrition_facts_id,
    nutrient,
    amount_value,
    amount_unit,
    position
)
SELECT
    edible_id || '_' || amount_unit,
    'fat',
    fat_in_grams,
    'gram',
    1
FROM nutrition_facts_old;

--SQL-STATEMENT-SEPARATOR

INSERT INTO nutrient_amounts (
    nutrition_facts_id,
    nutrient,
    amount_value,
    amount_unit,
    position
)
SELECT
    edible_id || '_' || amount_unit,
    'totalCarbs',
    carbs_in_grams,
    'gram',
    2
FROM nutrition_facts_old;

--SQL-STATEMENT-SEPARATOR

INSERT INTO nutrient_amounts (
    nutrition_facts_id,
    nutrient,
    amount_value,
    amount_unit,
    position
)
SELECT
    edible_id || '_' || amount_unit,
    'fiber',
    fiber_in_grams,
    'gram',
    3
FROM nutrition_facts_old;

--SQL-STATEMENT-SEPARATOR

INSERT INTO nutrient_amounts (
    nutrition_facts_id,
    nutrient,
    amount_value,
    amount_unit,
    position
)
SELECT
    edible_id || '_' || amount_unit,
    'protein',
    protein_in_grams,
    'gram',
    4
FROM nutrition_facts_old;

--SQL-STATEMENT-SEPARATOR

DROP TABLE nutrition_facts_old;

--SQL-STATEMENT-SEPARATOR

PRAGMA foreign_keys = ON;
