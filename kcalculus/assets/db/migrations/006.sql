CREATE TABLE meals (
    id TEXT NOT NULL PRIMARY KEY,
    edible_id TEXT NOT NULL,
    amount_value REAL NOT NULL,
    amount_unit TEXT NOT NULL,
    eaten_at TEXT NOT NULL,
    FOREIGN KEY (edible_id) REFERENCES edibles (id)
);
