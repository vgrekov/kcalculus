CREATE TABLE nutrition_facts (
    edible_id TEXT NOT NULL,
    amount_value REAL NOT NULL,
    amount_unit TEXT NOT NULL,
    calories REAL NOT NULL,
    fat_in_grams REAL NOT NULL,
    carbs_in_grams REAL NOT NULL,
    fiber_in_grams REAL NOT NULL,
    protein_in_grams REAL NOT NULL,
    FOREIGN KEY (edible_id) REFERENCES edibles (id),
    PRIMARY KEY(edible_id, amount_unit)
);
