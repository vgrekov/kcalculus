CREATE TABLE foods (
    fdc_id INTEGER NOT NULL PRIMARY KEY,
    name TEXT NOT NULL,
    description TEXT,
    data_type TEXT NOT NULL,
    priority INTEGER NOT NULL
);

--SQL-STATEMENT-SEPARATOR

CREATE TABLE portions (
    fdc_id INTEGER NOT NULL,
    measure_unit_id INTEGER NOT NULL,
    amount REAL,
    gram_weight REAL NOT NULL,
    FOREIGN KEY (fdc_id) REFERENCES foods (fdc_id)
);

--SQL-STATEMENT-SEPARATOR

CREATE TABLE nutrients (
    fdc_id INTEGER NOT NULL,
    number TEXT NOT NULL,
    amount REAL NOT NULL,
    unit_name TEXT NOT NULL,
    FOREIGN KEY (fdc_id) REFERENCES foods (fdc_id)
);