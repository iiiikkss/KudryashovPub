BEGIN;

CREATE TABLE shop (
   id serial,
   city varchar(255),
   street varchar(255),
   house_number integer,
   latitude real,
   longitude real,
   date_open date,
   date_close date,
   CONSTRAINT shop_id PRIMARY KEY (id)
);

CREATE TABLE department (
    id serial,
    name varchar(255),
    CONSTRAINT department_id PRIMARY KEY (id)
);

CREATE TABLE division (
    id serial,
    name varchar(255),
    description varchar(255),
    date_start date,
    department_id integer REFERENCES department,
    CONSTRAINT division_id PRIMARY KEY (id)
);

CREATE TABLE employee (
    id serial,
    name varchar(255),
    surname varchar(255),
    second_name varchar(255),
    shop_id integer REFERENCES shop,
    division_id integer REFERENCES division,
    date_start date,
    date_finish date,
    CONSTRAINT employee_id PRIMARY KEY (id)
);

CREATE TABLE schedule (
    start_time varchar(255),
    finish_time varchar(255),
    Monday boolean,
    Tuesday boolean,
    Wednesday boolean,
    Thursday boolean,
    Friday boolean,
    Saturday boolean,
    Sunday boolean,
    employee_id integer REFERENCES employee
);

CREATE TABLE provider (
    id serial,
    name varchar(255),
    address varchar(255),
    contact_information varchar(255),
    CONSTRAINT provider_id PRIMARY KEY(id)
);

CREATE TABLE product (
id serial,
name varchar(255),
CONSTRAINT product_id PRIMARY KEY(id)
);

CREATE TABLE product_description (
    product_id integer REFERENCES product,
    product_Adjective varchar(255),
    product_Material varchar(255)
);

CREATE TABLE provider_product (
    id serial,
    provider_id integer REFERENCES provider,
    product_id integer REFERENCES product,
    price real,
	amount integer,
    CONSTRAINT provider_product_id PRIMARY KEY (id)
);

CREATE TABLE delivery (
    id serial,
    employee_id integer REFERENCES employee,
    shop_id integer REFERENCES shop,
    provider_product_id integer REFERENCES provider_product,
    amount integer,
    CONSTRAINT delivery_id PRIMARY KEY(id)
);

CREATE TABLE shop_product (
    id serial,
    delivery_id integer REFERENCES delivery,
    price real,
    amount integer,
    CONSTRAINT shop_product_id PRIMARY KEY(id)
);

CREATE TABLE client (
    id serial,
    name varchar(255),
    surname varchar(255),
    second_name varchar(255),
    email varchar(255),
    phone_number varchar(255),
	CONSTRAINT client_id PRIMARY KEY(id)
);

CREATE TABLE discount (
    id serial,
    client_id integer REFERENCES client,
    terms real,
    amount integer,
    CONSTRAINT discount_id PRIMARY KEY(id)
);

CREATE TABLE discount_history (
    discount_id integer REFERENCES discount,
    date_start date,
    date_finish date
);

CREATE TABLE price_history (
    shop_product_id integer REFERENCES shop_product,
    date_start date,
    date_finish date,
    amount real
);

INSERT INTO shop (city, street, house_number, latitude, longitude, date_open, date_close)
VALUES('New Antoinetteville', 'Katelynn Falls', 83, '29.5857', '-151.2917', '2014-01-12','null'),
('Wizamouth', 'Fabiola Squares', 78, '-0.4435', '-62.2849', '2013-09-01','null'),
('Port Anya', 'Gleichner Plaza', 61, '76.3508', '-178.9255', '2018-06-06','2028-03-09'),
('East Jeanie', 'Elvera Knoll', 194, '82.0388', '-16.9231', '2017-01-28','2024-01-02'),
('Archside', 'Monty Plaza', 83, '-23.0505', '123.6029', '2017-03-22','null'),
('New Melynatown', 'Wisoky Pines', 105, '83.7465', '1.0503', '2014-03-16','null'),
('Jaredmouth', 'Martina Forks', 99, '-68.6552', '-143.8167', '2017-09-29','2024-07-22'),
('Sporerview', 'Emery Greens', 70, '-32.6891', '-19.2954', '2020-01-13','null'),
('Krajcikberg', 'Felix Forges', 19, '-37.5832', '161.1205', '2012-06-06','2024-03-03'),
('New Eleanore', 'Gerlach Vista', 99, '41.2903', '121.1039', '2011-11-29','2024-10-06');

INSERT INTO department (name)
VALUES('niches'),
('markets'),
('platforms');

INSERT INTO division (name, description, date_start, department_id)
VALUES('benchmark', 'mobile', '2018-07-06', 3),
('knowledge base', 'demand-driven', '2017-11-24', 3),
('neural-net', 'optimal', '2012-09-02', 2),
('implementation', 'local', '2012-08-19', 3),
('model', 'global', '2019-10-27', 1),
('instruction set', 'leading edge', '2013-08-08', 1);

INSERT INTO employee (name, surname, second_name, shop_id, division_id, date_start, date_finish)
VALUES('Anastasia', 'Vandervort', 'Robin', null, 2, '2019-05-14', '2021-12-14'),
('Geraldine', 'Reinger', 'Roman', 10, null, '2016-12-07', '2025-07-17'),
('Winston', 'Heaney', 'Dejah', 4, null, '2016-01-22', '2029-06-06'),
('Alene', 'Corwin', 'Carmel', 2, null, '2016-06-26', 'null'),
('Damien', 'Hammes', 'Eino', 5, null, '2013-02-23', '2028-12-13'),
('Stan', 'Becker', 'Clay', 3, null, '2010-11-08', '2029-12-28'),
('Alda', 'Roberts', 'Ashton', 5, null, '2019-02-14', '2029-04-20'),
('Bethany', 'Smitham', 'Margaretta', 9, null, '2012-10-20', '2026-01-26'),
('Imogene', 'Donnelly', 'Daphne', null, 2, '2018-08-17', 'null'),
('Reese', 'Johnson', 'Greyson', 4, null, '2018-05-13', '2027-10-26'),
('Leatha', 'Johnson', 'Fannie', null, 2, '2011-11-27', '2021-06-24'),
('Katelyn', 'Toy', 'Deonte', null, 3, '2012-10-29', '2022-09-29'),
('Rickie', 'Gislason', 'Mohamed', 1, null, '2011-07-18', '2026-12-16'),
('Chadd', 'Batz', 'Lucile', 6, null, '2013-02-26', '2023-07-26'),
('Cary', 'Mohr', 'Beaulah', null, 4, '2018-08-23', 'null'),
('Talia', 'Terry', 'Marisol', 3, null, '2017-11-25', 'null'),
('Susie', 'Boyer', 'Stefanie', null, 3, '2019-03-08', '2021-04-01'),
('Annamae', 'Stracke', 'Martin', 9, null, '2014-11-05', 'null'),
('Don', 'Murazik', 'Sherman', null, 4, '2010-06-26', '2023-11-02'),
('Lavern', 'Parisian', 'Dulce', 1, null, '2015-11-24', '2027-11-08');

INSERT INTO schedule (start_time, finish_time, employee_id)
VALUES('800', '1700', 0),
('800', '1700', 1),
('800', '1700', 2),
('800', '1700', 3),
('800', '1700', 4),
('800', '1700', 5),
('800', '1700', 6),
('800', '1700', 7),
('800', '1700', 8),
('800', '1700', 9),
('800', '1700', 10),
('800', '1700', 11),
('800', '1700', 12),
('800', '1700', 13),
('800', '1700', 14),
('800', '1700', 15),
('800', '1700', 16),
('800', '1700', 17),
('800', '1700', 18),
('800', '1700', 19);

INSERT INTO provider (name, address, contact_information)
VALUES('Lehner - Fisher', '4337 Nina Lake', '1-710-973-2591'),
('Quigley - Terry', '32014 Hickle Stream', '1-183-542-8920'),
('Altenwerth, Nitzsche and Fritsch', '8141 Amy Courts', '1-276-754-5167'),
('Mayert Inc', '14508 Collin Port', '413-286-3473 x1410'),
('Strosin, Hilll and Fahey', '4654 Antonetta Stream', '658.494.6822 x0580'),
('Rutherford Inc', '8052 Erdman Shores', '306.692.2362 x7200'),
('Von - McDermott', '357 Clara Well', '1-069-950-4301'),
('Schmidt - Hartmann', '448 Miller Viaduct', '043-010-1840'),
('Okuneva and Sons', '335 Parisian Views', '(342) 203-5772 x4748'),
('Gutkowski - Conn', '711 Muller Station', '1-341-241-5701 x47189');

INSERT INTO product (name)
VALUES('Tuna'),
('Chicken'),
('Gloves'),
('Tuna'),
('Soap'),
('Ball'),
('Car'),
('Towels'),
('Shirt'),
('Cheese');

INSERT INTO product_description (product_id, product_Adjective, product_Material)
VALUES(4,'Tasty','Metal'),
(5,'Intelligent','Granite'),
(8,'Handmade','Cotton'),
(2,'Awesome','Steel'),
(1,'Ergonomic','Frozen'),
(4,'Unbranded','Concrete'),
(4,'Ergonomic','Frozen'),
(10,'Licensed','Cotton'),
(7,'Handcrafted','Cotton'),
(1,'Refined','Metal'),
(6,'Gorgeous','Rubber'),
(3,'Intelligent','Frozen'),
(6,'Incredible','Soft'),
(3,'Refined','Wooden'),
(4,'Licensed','Wooden'),
(6,'Tasty','Granite'),
(10,'Unbranded','Steel'),
(1,'Incredible','Metal'),
(8,'Ergonomic','Plastic'),
(3,'Rustic','Concrete');

INSERT INTO provider_product (provider_id, product_id, price, amount)
VALUES(1,3,'292.00', 90),
(2,3,'819.00', 85),
(7,10,'926.00', 74),
(4,3,'562.00', 47),
(3,7,'590.00', 74),
(5,3,'574.00', 10),
(5,7,'792.00', 6),
(1,10,'414.00', 57),
(10,5,'613.00', 32),
(5,5,'71.00', 97);

INSERT INTO delivery (employee_id, shop_id, provider_product_id, amount)
VALUES(2, 1, 9, 17),
(10, 6, 10, 85),
(11, 5, 8, 54),
(2, 5, 4, 25),
(9, 1, 8, 73),
(2, 7, 7, 91),
(12, 2, 9, 13),
(5, 6, 3, 40),
(12, 9, 4, 42),
(16, 8, 6, 81),
(15, 9, 8, 54),
(10, 3, 5, 21),
(6, 10, 10, 55),
(3, 1, 6, 81),
(15, 2, 7, 47),
(13, 3, 6, 15),
(17, 8, 3, 86),
(5, 9, 7, 89),
(18, 6, 8, 13),
(10, 10, 1, 18);

INSERT INTO shop_product (delivery_id, price, amount)
VALUES(19, '536.00', 53),
(8, '234.00', 28),
(19, '997.00', 94),
(11, '75.00', 69),
(6, '900.00', 28),
(16, '599.00', 83),
(11, '474.00', 1),
(1, '479.00', 74),
(18, '342.00', 39),
(17, '106.00', 34),
(2, '72.00', 87),
(10, '187.00', 24),
(10, '878.00', 91),
(16, '174.00', 4),
(17, '681.00', 56),
(5, '421.00', 21),
(11, '455.00', 58),
(10, '1000.00', 91),
(4, '290.00', 77),
(9, '404.00', 33);

INSERT INTO client (name, surname, second_name, email, number)
VALUES('Buster', 'Dietrich', 'Manley', 'Rasheed97@hotmail.com', '635.292.7495'),
('Katherine', 'Cole', 'Kellen', 'Jayne_Gutmann74@gmail.com', '(923) 662-4472 x75407'),
('Katelin', 'Luettgen', 'Charlene', 'Clotilde.West@gmail.com', '141.763.8758'),
('Lucinda', 'Wisoky', 'Gregg', 'Daphney_Heaney@hotmail.com', '(197) 612-2661 x22119'),
('Taylor', 'Runte', 'Sonya', 'Kale_Veum@hotmail.com', '606.382.3796 x15775'),
('Blair', 'Osinski', 'Linwood', 'Lee.Halvorson1@hotmail.com', '(874) 470-6260'),
('Myron', 'Reichel', 'Lia', 'Caden.Smith@gmail.com', '109.999.7697 x646'),
('Ryleigh', 'Moen', 'Dakota', 'Aleen41@hotmail.com', '223-450-3014'),
('Jevon', 'Aufderhar', 'Mylene', 'Laisha.Nienow@yahoo.com', '(848) 317-0636'),
('Susana', 'Kuphal', 'Muhammad', 'Shanon11@hotmail.com', '1-961-436-0145');

INSERT INTO discount (client_id, terms, amount)
VALUES(8, '147.00', 161),
(4, '587.00', 192),
(9, '882.00', 68),
(5, '939.00', 157),
(10, '546.00', 70),
(6, '439.00', 73),
(4, '329.00', 132),
(4, '246.00', 21),
(10, '672.00', 239),
(10, '701.00', 195);

INSERT INTO discount_history (discount_id, date_start, date_finish)
VALUES(0, '2011-03-19', '2025-01-21'),
(1, '2013-06-21', 'null'),
(2, '2015-08-10', 'null'),
(3, '2010-08-15', '2023-06-08'),
(4, '2014-12-04', '2028-08-09'),
(5, '2010-06-11', '2023-03-02'),
(6, '2018-03-12', '2027-01-05'),
(7, '2016-12-21', '2029-11-12'),
(8, '2012-08-31', '2022-04-08'),
(9, '2019-07-23', 'null');

INSERT INTO price_history (shop_product_id, date_start, date_finish, amount)
VALUES(1, '2014-01-07', null, 793.00),
(2, '2013-02-09', '2029-09-27', 104.00),
(3, '2011-07-08', '2028-01-07', 93.00),
(4, '2013-03-11', '2027-08-30', 280.00),
(5, '2017-10-04', '2029-08-15', 858.00),
(6, '2014-06-13', '2026-03-13', 452.00),
(7, '2011-09-01', '2022-08-11', 477.00),
(8, '2015-11-30', '2022-12-23', 103.00),
(9, '2011-12-10', null, 381.00),
(10, '2012-05-10', '2020-06-06', 150.00);

COMMIT;