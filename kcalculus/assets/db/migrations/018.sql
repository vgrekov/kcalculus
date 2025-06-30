CREATE TABLE food_containers (
    id TEXT NOT NULL PRIMARY KEY,
    name TEXT NOT NULL,
    description TEXT,
    weight_unit TEXT NOT NULL,
    weight_value REAL NOT NULL,
    created_at TEXT NOT NULL DEFAULT '',
    updated_at TEXT,
    deleted_at TEXT
);
