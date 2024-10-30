CREATE TABLE dishes (
    id TEXT NOT NULL PRIMARY KEY,
    weight_in_grams REAL NOT NULL,
    FOREIGN KEY (id) REFERENCES edibles (id)
);
