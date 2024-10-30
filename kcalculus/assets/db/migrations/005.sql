CREATE TABLE ingredients (
    dish_id TEXT NOT NULL,
    edible_id TEXT NOT NULL,
    amount_value REAL NOT NULL,
    amount_unit TEXT NOT NULL,
    FOREIGN KEY (dish_id) REFERENCES dishes (id),
    FOREIGN KEY (edible_id) REFERENCES edibles (id),
    PRIMARY KEY(dish_id, edible_id)
);
