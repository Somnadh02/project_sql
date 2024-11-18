DROP SCHEMA IF EXISTS ecommerce_app CASCADE;
CREATE SCHEMA IF NOT EXISTS ecommerce_app;

DROP TABLE IF EXISTS ecommerce_app.users;
CREATE TABLE ecommerce_app.users (
    user_id TEXT PRIMARY KEY,
    password TEXT,
    first_name TEXT,
    last_name TEXT,
    created_at DATE,
    email TEXT
);

DROP TABLE IF EXISTS ecommerce_app.customers;
CREATE TABLE ecommerce_app.customers (
    customer_id TEXT PRIMARY KEY,
    password TEXT,
    first_name TEXT,
    last_name TEXT,
    created_at DATE,
    email TEXT,
    phone TEXT,
    last_active TIMESTAMP
);

DROP TABLE IF EXISTS ecommerce_app.employee_roles;
CREATE TABLE ecommerce_app.employee_roles (
    role_id TEXT PRIMARY KEY,
    role_name TEXT,
    is_internal BOOLEAN,
    vendor TEXT
);

DROP TABLE IF EXISTS ecommerce_app.employees;
CREATE TABLE ecommerce_app.employees (
    employee_id TEXT PRIMARY KEY,
    role_id TEXT REFERENCES ecommerce_app.employee_roles (role_id),
    first_name TEXT,
    last_name TEXT,
    joined_on DATE,
    email TEXT,
    phone TEXT,
    contract_end DATE
);

DROP TABLE IF EXISTS ecommerce_app.payments;
CREATE TABLE ecommerce_app.payments (
    payment_id TEXT PRIMARY KEY,
    total_amount DECIMAL(10, 2),
    payment_method TEXT,
    payment_date TIMESTAMP,
    success BOOLEAN
);

DROP TABLE IF EXISTS ecommerce_app.orders;
CREATE TABLE ecommerce_app.orders (
    order_id TEXT PRIMARY KEY,
    customer_id TEXT REFERENCES ecommerce_app.customers (customer_id),
    payment_id TEXT REFERENCES ecommerce_app.payments (payment_id),
    is_delivered BOOLEAN,
    delivery_date DATE,
    delivered_by TEXT REFERENCES ecommerce_app.employees (employee_id)
);

DROP TABLE IF EXISTS ecommerce_app.products;
CREATE TABLE ecommerce_app.products (
    product_id TEXT PRIMARY KEY,
    sku TEXT,
    name TEXT,
    category TEXT,
    description TEXT,
    image JSON,
    seller TEXT,
    price DECIMAL(10, 2),
    discount DECIMAL(10, 2),
    stock INT
);

DROP TABLE IF EXISTS ecommerce_app.order_items;
CREATE TABLE ecommerce_app.order_items (
    order_item_id SERIAL PRIMARY KEY,
    product_id TEXT REFERENCES ecommerce_app.products (product_id),
    order_id TEXT REFERENCES ecommerce_app.orders (order_id)
);

DROP TABLE IF EXISTS ecommerce_app.delivery_status;
CREATE TABLE ecommerce_app.delivery_status (
    status_id SERIAL PRIMARY KEY,
    order_id TEXT REFERENCES ecommerce_app.orders (order_id),
    delivery_stage TEXT
);
