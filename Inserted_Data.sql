USE AquariumFishCareStore;

INSERT INTO Customer (first_name, last_name, email, phone)
VALUES
('Luis', 'Miguel', 'luis@gmail.com', '1111111111'),
('Rebero', 'Carlos', 'rebero@gmail.com', '2222222222'),
('Jose', 'Samurai', 'jose@gmail.com', '3333333333');

INSERT INTO Fish (species, water_type, price, stocky_qty)
VALUES
('Goldfish', 'Freshwater', 10, 10),
('Betta', 'Freshwater', 15, 5),
('Clownfish', 'Saltwater', 20, 8);

INSERT INTO Product (prod_name, Category, price, stocky_qty)
VALUES
('Fish Food', 'Food', 5, 20),
('Fish Tank', 'Tank', 50, 10),
('Water Filter', 'Filter', 25, 15);

USE AquariumFishCareStore;

INSERT INTO Sale (customer_id, Sale_date, total_amt)
VALUES
(1, '2026-09-29', 25),
(2, '2026-09-29', 50),
(3, '2026-09-29', 20);

INSERT INTO Sale_item (sale_id, fish_id, product_id, quantity, unit_price)
VALUES
(1, 1, NULL, 1, 10),
(1, NULL, 1, 1, 5),
(2, NULL, 2, 1, 50),
(3, 3, NULL, 1, 20);