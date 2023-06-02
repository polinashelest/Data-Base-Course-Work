DROP DATABASE base;
GO

CREATE DATABASE base;
GO
USE base;

CREATE TABLE countries (
  countries_id INT PRIMARY KEY IDENTITY,
  countries_name VARCHAR(250) NOT NULL
);

CREATE TABLE alpinists (
  alpinist_id INT PRIMARY KEY IDENTITY,
  alpinist_first_name VARCHAR(50) NOT NULL,
  alpinist_last_name VARCHAR(50) NOT NULL,
  alpinist_country INT REFERENCES countries ON DELETE CASCADE NOT NULL
);

CREATE TABLE housing (
  housing_id INT PRIMARY KEY IDENTITY,
  housing_type VARCHAR(50) NOT NULL,
  housing_price DECIMAL(10,2) NOT NULL
);

CREATE TABLE meals (
  meal_id INT PRIMARY KEY IDENTITY,
  meal_type VARCHAR(50) NOT NULL,
  meal_price DECIMAL(10,2) NOT NULL
);

CREATE TABLE base_living (
  base_living_id INT PRIMARY KEY IDENTITY,
  base_living_alpinist INT REFERENCES alpinists ON DELETE CASCADE NOT NULL,
  base_living_housing INT REFERENCES housing ON DELETE CASCADE NOT NULL,
  base_living_date DATE NOT NULL
);

CREATE TABLE base_liv_meals (
  base_liv_meal_id INT PRIMARY KEY IDENTITY,
  base_living_id INT REFERENCES base_living ON DELETE CASCADE NOT NULL,
  meal_id INT REFERENCES meals ON DELETE CASCADE NOT NULL
);

CREATE TABLE groups (
  group_id INT PRIMARY KEY IDENTITY,
  start_date DATE NOT NULL,
  end_date DATE NOT NULL,
  radio_station VARCHAR(50) NOT NULL,
  return_radio VARCHAR(50),
  state_of_route VARCHAR(MAX)
);

CREATE TABLE groups_alpin (
  groups_alpin_id INT PRIMARY KEY IDENTITY,
  alpinist_id INT REFERENCES alpinists ON DELETE CASCADE NOT NULL,
  group_id INT REFERENCES groups ON DELETE CASCADE NOT NULL
);

CREATE TABLE storage (
  storage_id INT PRIMARY KEY IDENTITY,
  item VARCHAR(50) NOT NULL,
  item_price DECIMAL(10,2) NOT NULL,
  item_quantity INT NOT NULL
);

CREATE TABLE groups_storage (
  groups_storage_id INT PRIMARY KEY IDENTITY,
  storage_id INT REFERENCES storage ON DELETE CASCADE NOT NULL,
  group_id INT REFERENCES groups ON DELETE CASCADE NOT NULL,
  item_quantity INT NOT NULL
);

CREATE TABLE rescue_service (
  rescue_service_id INT PRIMARY KEY IDENTITY,
  permission VARCHAR(50) NOT NULL,
  group_id INT REFERENCES groups ON DELETE CASCADE NOT NULL,
);

CREATE TABLE call_base (
  call_base_id INT PRIMARY KEY IDENTITY,
  call_base_massage VARCHAR(250) NOT NULL,
  call_base_date DATETIME NOT NULL,
  group_id INT REFERENCES groups ON DELETE CASCADE NOT NULL,
);

INSERT INTO countries VALUES
('Грузія'),
('Киргизстан'),
('Таджикистан');

INSERT INTO alpinists VALUES
('John', 'Smith', 1),
('Anna', 'Johnson', 2),
('Robert', 'Williams', 3),
('Olivia', 'Brown', 1),
('William', 'Davis', 2),
('Sophia', 'Garcia', 3),
('Michael', 'Miller', 1),
('Isabella', 'Wilson', 2),
('Benjamin', 'Martinez', 3),
('Emma', 'Anderson', 1);

INSERT INTO housing VALUES
('Палатка', 1300.00),
('Кімната', 2000.00),
('Будинок', 5000.00);

INSERT INTO meals VALUES
('Сніданок', 600.00),
('Обід', 750.00),
('Вечеря', 500.00);

INSERT INTO base_living VALUES
(1, 1, '2023-04-20'),
(2, 2, '2023-04-21'),
(3, 3, '2023-04-22'),
(4, 1, '2023-04-20'),
(6, 3, '2023-04-22'),
(7, 1, '2023-04-20'),
(9, 3, '2023-04-22'),
(10, 1, '2023-04-23'),
(1, 2, '2023-04-24'),
(2, 3, '2023-04-25'),
(3, 1, '2023-04-23'),
(4, 2, '2023-04-24'),
(6, 1, '2023-04-23'),
(7, 2, '2023-04-24'),
(8, 3, '2023-04-25'),
(9, 1, '2023-04-23');

INSERT INTO base_liv_meals VALUES
(1, 1),
(1, 2),
(1, 3),
(2, 1),
(2, 2),
(3, 1),
(3, 3),
(4, 1),
(4, 2),
(5, 2),
(5, 3),
(6, 1),
(6, 3),
(7, 1),
(7, 2),
(7, 3),
(8, 1),
(8, 2),
(8, 3),
(9, 1),
(9, 2),
(11, 1),
(11, 3),
(12, 2),
(12, 3),
(13, 1),
(13, 2),
(13, 3),
(14, 1),
(14, 2),
(15, 3);

INSERT INTO groups VALUES
('2023-04-01', '2023-04-07', 'Видана', 'Так', 'Повернулися всі живі та здорові. При спуску з вершини стався нещасний випадок, але група вдалося евакуюватися.'),
('2023-04-15', '2023-04-19', 'Видана', 'Так', 'Повернулися всі живі та здорові'),
('2023-04-19', '2023-04-22', 'Ні', 'Ні', 'В процесі'),
('2023-05-01', '2023-05-05', 'Ні', 'Ні', 'Не розпочато'),
('2023-05-10', '2023-05-13', 'Ні', 'Ні', 'Не розпочато');

INSERT INTO groups_alpin VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 2),
(5, 2),
(6, 2),
(7, 3),
(8, 3),
(9, 3),
(10, 4),
(1, 4),
(2, 4),
(3, 4),
(4, 4),
(5, 4),
(6, 4),
(7, 5),
(8, 5),
(9, 5),
(10, 5);

INSERT INTO storage VALUES
('Палатка', 3000.00, 5),
('Підйомник', 2000.00, 1),
('Канати', 500.00, 10),
('Карабіни', 100.00, 50),
('Набір їжі', 1000.00, 20);

INSERT INTO groups_storage VALUES
(1, 1, 2),
(2, 1, 1),
(3, 1, 5),
(4, 1, 5),
(5, 1, 10),
(1, 2, 1),
(2, 2, 2),
(3, 2, 3),
(4, 2, 10),
(5, 2, 15),
(1, 3, 2),
(2, 3, 5),
(3, 3, 8),
(4, 3, 15),
(5, 3, 7),
(1, 4, 1),
(2, 4, 3),
(3, 4, 6),
(4, 4, 20),
(5, 4, 12),
(1, 5, 1),
(2, 5, 3),
(3, 5, 6),
(4, 5, 17),
(5, 5, 9);

INSERT INTO rescue_service VALUES
('Дозвіл на похід', 1),
('Дозвіл на похід', 2),
('Дозвіл на похід', 3),
('Дозвіл на похід', 4),
('Дозвіл на похід', 5),
('Дозвіл на льодолазання', 4),
('Дозвіл на зйомки', 5),
('Дозвіл на нічний похід', 1),
('Дозвіл на самостійний спуск', 2);

INSERT INTO call_base VALUES
('Все в порядку.', '2023-04-03 10:30:00', 1),
('Один з учасників групи стомився, затримка в плані.', '2023-04-04 15:45:00', 1),
('Група не може продовжувати рух через сильну зливу та снігопад.', '2023-04-06 13:20:00', 1),
('Все в порядку.', '2023-04-16 08:10:00', 2),
('Все в порядку.', '2023-04-18 11:00:00', 2);