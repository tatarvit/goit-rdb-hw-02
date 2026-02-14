-- 1. Clients
CREATE TABLE client (
	id SERIAL PRIMARY KEY,
	full_name VARCHAR(100) NOT NULL,
	address VARCHAR(100) NOT NULL
);

-- 2. Orders
CREATE TABLE orders (
	id SERIAL PRIMARY KEY,
	client_id INT NOT NULL REFERENCES client(id),
	order_date DATE NOT NULL
);

--  3. Products
CREATE TABLE product (
	id SERIAL PRIMARY KEY,
	product_name VARCHAR(100) NOT NULL UNIQUE
);

-- 4. Order Items
CREATE TABLE order_items(
	order_id INT NOT NULL REFERENCES orders(id),
	product_id INT NOT NULL REFERENCES product(id),
	quantity INT NOT NULL CHECK (quantity> 0),
	PRIMARY KEY (order_id, product_id)
);