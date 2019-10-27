-- Создание базы данных
CREATE DATABASE sales OWNER postgres;
GRANT ALL privileges ON DATABASE sales TO postgres;
--Перейти в базу данных Sales (установить как активный обьект в субд или через консоль /c sales)
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";
CREATE EXTENSION "pgcrypto";

-- Создание таблиц  TODO (В разработке)

create table if not exists product
(
    id              uuid    default gen_random_uuid() not null
        constraint product_pkey
            primary key,
    title           text,
    product_type_id INTEGER default null,
    price           double precision,
    image_id        uuid    default null,
    collection_id   INTEGER default null,
    delivery_id     uuid    default null,
    properties      json    default null,
    type            text
);

alter table product
    owner to postgres;

create table if not exists sales
(
    id        serial not null
        constraint sales_pkey
            primary key,
    title     text   not null,
    images_id uuid   not null
);

alter table sales
    owner to postgres;

create table if not exists images
(
    id    uuid default gen_random_uuid() not null
        constraint images_pkey
            primary key,
    image text                           not null
);

alter table images
    owner to postgres;

create table if not exists person
(
    id     uuid default gen_random_uuid() not null
        constraint person_pkey
            primary key,
    phone  text,
    f_name text                           not null,
    l_name text                           not null
);

alter table person
    owner to postgres;


create table if not exists "user"
(
    id            uuid default gen_random_uuid() not null
        constraint user_pkey
            primary key,
    person_id     uuid                           not null,
    email         text                           not null,
    imager_id     uuid,
    passvord_hash text                           not null
);

alter table "user"
    owner to postgres;


create table if not exists "order"
(
    id                uuid default gen_random_uuid() not null
        constraint order_pkey
            primary key,
    is_payment        BOOLEAN,
    payment_type      text                           not null,
    order_delivery_id uuid default null,
    statys            text,
    user_id           uuid                           not null

);

alter table "order"
    owner to postgres;

create table if not exists order_review
(
    id       uuid default gen_random_uuid() not null
        constraint order_review_pkey
            primary key,
    title    text                           not null,
    user_id  uuid,
    marks    Integer,
    order_id uuid                           not null
);

alter table order_review
    owner to postgres;

create table if not exists order_delivery
(
    id      uuid default gen_random_uuid() not null
        constraint order_delivery_pkey
            primary key,
    status  text,
    address text,
    date    timestamp

);

alter table order_delivery
    owner to postgres;

create table if not exists site_review
(
    id      uuid default gen_random_uuid() not null
        constraint site_review_pkey
            primary key,
    title   text                           not null,
    user_id uuid,
    marks   Integer

);

alter table site_review
    owner to postgres;

create table if not exists product_review_product
(
    id                uuid default gen_random_uuid() not null
        constraint product_review_product_pkey
            primary key,
    product_id        uuid                           not null,
    product_review_id uuid                           not null

);

alter table product_review_product
    owner to postgres;

create table if not exists product_review
(
    id      uuid default gen_random_uuid() not null
        constraint product_review_pkey
            primary key,
    title   text                           not null,
    user_id uuid,
    marks   Integer

);

alter table product_review
    owner to postgres;

create table if not exists product_delivery
(
    id                uuid default gen_random_uuid() not null
        constraint product_delivery_pkey
            primary key,
    possible_delivery BOOLEAN,
    sale_delivery     DOUBLE PRECISION

);

alter table product_delivery
    owner to postgres;

create table if not exists product_type
(
    id          serial not null
        constraint product_type_pkey
            primary key,
    title       text,
    description text

);

alter table product_type
    owner to postgres;


create table if not exists sales_product
(
    id         uuid default gen_random_uuid() not null
        constraint sales_product_pkey
            primary key,
    sales_id   INTEGER                        not null,
    product_id uuid                           not null

);

alter table sales_product
    owner to postgres;

create table if not exists baners
(
    id       serial not null
        constraint baners_pkey
            primary key,
    image_id uuid   not null,
    title    text default null

);

alter table baners
    owner to postgres;

ALTER TABLE "user"
    ADD CONSTRAINT "user_fk0" FOREIGN KEY ("person_id") REFERENCES "person" ("id");
ALTER TABLE "user"
    ADD CONSTRAINT "user_fk1" FOREIGN KEY ("imager_id") REFERENCES "images" ("id");

ALTER TABLE "site_review"
    ADD CONSTRAINT "site_review_fk0" FOREIGN KEY ("user_id") REFERENCES "user" ("id");

ALTER TABLE "product_review_product"
    ADD CONSTRAINT "product_review_product_fk0" FOREIGN KEY ("product_id") REFERENCES "product" ("id");
ALTER TABLE "product_review_product"
    ADD CONSTRAINT "product_review_product_fk1" FOREIGN KEY ("product_review_id") REFERENCES "product_review" ("id");

ALTER TABLE "sales_product"
    ADD CONSTRAINT "sales_product_fk0" FOREIGN KEY ("sales_id") REFERENCES "sales" ("id");
ALTER TABLE "sales_product"
    ADD CONSTRAINT "sales_product_fk1" FOREIGN KEY ("product_id") REFERENCES "product" ("id");

ALTER TABLE "product"
    ADD CONSTRAINT "product_fk0" FOREIGN KEY ("product_type_id") REFERENCES "product_type" ("id");
ALTER TABLE "product"
    ADD CONSTRAINT "product_fk1" FOREIGN KEY ("image_id") REFERENCES "images" ("id");
ALTER TABLE "product"
    ADD CONSTRAINT "product_fk2" FOREIGN KEY ("delivery_id") REFERENCES "product_delivery" ("id");

ALTER TABLE "sales"
    ADD CONSTRAINT "sales_fk0" FOREIGN KEY ("images_id") REFERENCES "images" ("id");

ALTER TABLE "order"
    ADD CONSTRAINT "order_fk0" FOREIGN KEY ("order_delivery_id") REFERENCES "order_delivery" ("id");
ALTER TABLE "order"
    ADD CONSTRAINT "order_fk1" FOREIGN KEY ("user_id") REFERENCES "user" ("id");

ALTER TABLE "order_review"
    ADD CONSTRAINT "order_review_fk0" FOREIGN KEY ("user_id") REFERENCES "user" ("id");
ALTER TABLE "order_review"
    ADD CONSTRAINT "order_review_fk1" FOREIGN KEY ("order_id") REFERENCES "order" ("id");

ALTER TABLE "baners"
    ADD CONSTRAINT "baners_fk0" FOREIGN KEY ("image_id") REFERENCES "images" ("id");

