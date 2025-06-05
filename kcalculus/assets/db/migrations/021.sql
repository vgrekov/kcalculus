CREATE TABLE nutrient_goals (
    id TEXT NOT NULL PRIMARY KEY,
    nutrient TEXT NOT NULL,
    amount_value REAL NOT NULL,
    amount_unit TEXT NOT NULL,
    created_at TEXT NOT NULL,
    deleted_at TEXT
);

--SQL-STATEMENT-SEPARATOR

CREATE INDEX idx_nutrient_goals_audit ON nutrient_goals (
    created_at,
    deleted_at
);
