DROP SCHEMA IF EXISTS recipe CASCADE;
CREATE SCHEMA IF NOT EXISTS recipe;

DROP TABLE IF EXISTS recipe.recipe;
CREATE TABLE IF NOT EXISTS recipe.recipe (
    recipe_id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    description TEXT,
    instructions TEXT
);

DROP TABLE IF EXISTS recipe.ingredient;
CREATE TABLE IF NOT EXISTS recipe.ingredient (
    ingredient_id SERIAL PRIMARY KEY,
    name TEXT NOT NULL
);

DROP TABLE IF EXISTS recipe.measure;
CREATE TABLE IF NOT EXISTS recipe.measure (
    measure_id SERIAL PRIMARY KEY,
    name TEXT NOT NULL
);

DROP TABLE IF EXISTS recipe.recipe_ingredient;
CREATE TABLE IF NOT EXISTS recipe.recipe_ingredient (
    recipe_id INT NOT NULL REFERENCES recipe.recipe (recipe_id) ON DELETE CASCADE,
    ingredient_id INT NOT NULL REFERENCES recipe.ingredient (ingredient_id) ON DELETE CASCADE,
    measure_id INT NOT NULL REFERENCES recipe.measure (measure_id) ON DELETE CASCADE,
    amount INT NOT NULL CHECK (amount > 0),
    PRIMARY KEY (recipe_id, ingredient_id, measure_id)
);
