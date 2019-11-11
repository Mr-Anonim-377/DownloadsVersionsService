-- Создание базы данных
CREATE DATABASE sales OWNER postgres;
GRANT ALL privileges ON DATABASE sales TO postgres;
--Перейти в базу данных Sales (установить как активный обьект в субд или через консоль /c sales)
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";
CREATE EXTENSION "pgcrypto";
