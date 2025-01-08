ALTER TABLE dishes
ADD COLUMN mass_per_amount_value REAL;

--SQL-STATEMENT-SEPARATOR

ALTER TABLE dishes
ADD COLUMN mass_per_amount_unit TEXT;

--SQL-STATEMENT-SEPARATOR

ALTER TABLE dishes
ADD COLUMN mass_total_amount_value REAL;

--SQL-STATEMENT-SEPARATOR

ALTER TABLE dishes
ADD COLUMN mass_total_amount_unit TEXT;

--SQL-STATEMENT-SEPARATOR

ALTER TABLE dishes
ADD COLUMN volume_per_amount_value REAL;

--SQL-STATEMENT-SEPARATOR

ALTER TABLE dishes
ADD COLUMN volume_per_amount_unit TEXT;

--SQL-STATEMENT-SEPARATOR

ALTER TABLE dishes
ADD COLUMN volume_total_amount_value REAL;

--SQL-STATEMENT-SEPARATOR

ALTER TABLE dishes
ADD COLUMN volume_total_amount_unit TEXT;

--SQL-STATEMENT-SEPARATOR

ALTER TABLE dishes
ADD COLUMN quantity_per_amount_value REAL;

--SQL-STATEMENT-SEPARATOR

ALTER TABLE dishes
ADD COLUMN quantity_per_amount_unit TEXT;

--SQL-STATEMENT-SEPARATOR

ALTER TABLE dishes
ADD COLUMN quantity_total_amount_value REAL;

--SQL-STATEMENT-SEPARATOR

ALTER TABLE dishes
ADD COLUMN quantity_total_amount_unit TEXT;

--SQL-STATEMENT-SEPARATOR

UPDATE dishes
SET
    mass_per_amount_value = 100,
    mass_per_amount_unit = 'gram',
    mass_total_amount_value = weight_in_grams,
    mass_total_amount_unit = 'gram';

--SQL-STATEMENT-SEPARATOR

ALTER TABLE dishes
DROP COLUMN weight_in_grams;
