-- Создание базы данных
CREATE DATABASE Sales OWNER postgres;
GRANT ALL privileges ON DATABASE Sales TO postgres;

CREATE EXTENSION IF NOT EXISTS "uuid-ossp";
CREATE EXTENSION "pgcrypto";

CREATE SCHEMA pub;
-- Создание таблиц  TODO (В разработке)

create table if not exists product
(
    id              uuid default gen_random_uuid() not null
        constraint product_pkey
            primary key,
    title           text,
    product_type_id INTEGER,
    price           double precision,
    image_id        uuid,
    collection_id    INTEGER,
    delivery_id     uuid,
    properties_id   INTEGER,
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
    image text
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


create table if not exists order
(
    id              uuid default gen_random_uuid() not null
        constraint product_pkey
            primary key,
    is_payment BOOLEAN,
    payment_type text,
    order_delivery_id uuid,
    statys text,
    user_id uuid

);

alter table order
    owner to postgres;

create table if not exists order_review
(
    id              uuid default gen_random_uuid() not null
        constraint product_pkey
            primary key,
    title text,
    user_id uuid,
    marks Integer,
    order_id uuid
);

alter table order_review
    owner to postgres;

create table if not exists order_delivery
(
    id              uuid default gen_random_uuid() not null
        constraint product_pkey
            primary key,
    statys text,
    address text,
    date timestamp

);

alter table order_delivery
    owner to postgres;

create table if not exists site_review
(
    id              uuid default gen_random_uuid() not null
        constraint product_pkey
            primary key,
    title text,
    user_id uuid,
    marks Integer

);

alter table site_review
    owner to postgres;

create table if not exists product_review_product
(
    id              uuid default gen_random_uuid() not null
        constraint product_pkey
            primary key,
    product_id uuid,
    product_review_id uuid

);

alter table product_review_product
    owner to postgres;

create table if not exists product_review
(
    id              uuid default gen_random_uuid() not null
        constraint product_pkey
            primary key,
    title text,
    user_id uuid,
    marks Integer

);

alter table product_review
    owner to postgres;

create table if not exists product_delivery
(
    id              uuid default gen_random_uuid() not null
        constraint product_pkey
            primary key,
    possible_delivery BOOLEAN,
    sale_delivery DOUBLE PRECISION

);

alter table product_delivery
    owner to postgres;

create table if not exists product_type
(
    id        serial not null
        constraint sales_pkey
            primary key,
    title text,
    description text

);

alter table product_type
    owner to postgres;


create table if not exists sales_product
(
    id              uuid default gen_random_uuid() not null
        constraint product_pkey
            primary key,
    sales_id INTEGER,
    product_id uuid

);

alter table sales_product
    owner to postgres;


create table if not exists properties
(
    id        serial not null
        constraint sales_pkey
            primary key,
    title text,
    conventional_units uuid

);

alter table properties
    owner to postgres;

create table if not exists baners
(
    id        serial not null
        constraint sales_pkey
            primary key,
    image_id uuid,
    title text

);

alter table baners
    owner to postgres;


ALTER TABLE "user" ADD CONSTRAINT "user_fk0" FOREIGN KEY ("person_id") REFERENCES "person"("id");
ALTER TABLE "user" ADD CONSTRAINT "user_fk1" FOREIGN KEY ("imager_id") REFERENCES "images"("id");


ALTER TABLE "site_review" ADD CONSTRAINT "site_review_fk0" FOREIGN KEY ("user_id") REFERENCES "user"("id");

ALTER TABLE "product_review_product" ADD CONSTRAINT "product_review_product_fk0" FOREIGN KEY ("product_id") REFERENCES "product"("id");
ALTER TABLE "product_review_product" ADD CONSTRAINT "product_review_product_fk1" FOREIGN KEY ("product_review_id") REFERENCES "product_review"("id");


ALTER TABLE "sales_product" ADD CONSTRAINT "sales_product_fk0" FOREIGN KEY ("sales_id") REFERENCES "sales"("id");
ALTER TABLE "sales_product" ADD CONSTRAINT "sales_product_fk1" FOREIGN KEY ("product_id") REFERENCES "product"("id");

ALTER TABLE "product" ADD CONSTRAINT "product_fk0" FOREIGN KEY ("product_type_id") REFERENCES "product_type"("id");
ALTER TABLE "product" ADD CONSTRAINT "product_fk1" FOREIGN KEY ("image_id") REFERENCES "images"("id");
ALTER TABLE "product" ADD CONSTRAINT "product_fk2" FOREIGN KEY ("delivery_id") REFERENCES "product_delivery"("id");

ALTER TABLE "sales" ADD CONSTRAINT "sales_fk0" FOREIGN KEY ("images_id") REFERENCES "images"("id");



ALTER TABLE "order" ADD CONSTRAINT "order_fk0" FOREIGN KEY ("order_delivery_id") REFERENCES "order_delivery"("id");
ALTER TABLE "order" ADD CONSTRAINT "order_fk1" FOREIGN KEY ("user_id") REFERENCES "user"("id");

ALTER TABLE "order_review" ADD CONSTRAINT "order_review_fk0" FOREIGN KEY ("user_id") REFERENCES "user"("id");
ALTER TABLE "order_review" ADD CONSTRAINT "order_review_fk1" FOREIGN KEY ("order_id") REFERENCES "order"("id");

ALTER TABLE "baners" ADD CONSTRAINT "baners_fk0" FOREIGN KEY ("image_id") REFERENCES "images"("id");


-- Создание тестовых данных TODO (В разработке)

INSERT INTO public.sales (id, title, images_id)
VALUES ('e27050aa-16be-4c85-a298-5bbf4f0d3e6d', 'Скидка 90% на все ', '10c3de72-fe8a-45e8-a90b-6aef99e4af19');
INSERT INTO public.sales (id, title, images_id)
VALUES ('06aee656-fb29-4541-b28b-d4d915320ba6', 'скидка 10% на покупку от 1000 рублей',
        '11eb2f39-7337-4fc7-a59a-806bd45800ba');
INSERT INTO public.sales (id, title, images_id)
VALUES ('5fb312b2-457c-4e83-bc0b-e2dc9a598721', 'купи один,получи второй в подарок',
        'c11c38bc-f5d1-4869-8989-67b3670558ae');


INSERT INTO public.product (id, title, product_type_id, price, image_id, collection_id, delivery_id, properties_id, type
)
VALUES ('33ca8fd0-5fc7-484f-be43-9eac73a98be9', 'a qui officia deserunt mol', 45,
        100, '9bb36f75-82a4-440b-9e11-4bce59efc161', 46,
        '4516a583-5157-49e9-8a48-49fef3d3cf96', '5d7a069b-fac1-4cc0-a8e2-8151913d0357',
        'exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in repr');
INSERT INTO public.product (id, title, product_type_id, price, image_id, collection_id, delivery_id, properties_id, type)
VALUES ('55224f94-e12b-406a-901b-e12f8e3328d7', ' non proident, sunt in culpa qui offic',
        45, 27.56, '5ad22b42-fa3d-4ecf-baeb-2df4e0403f58',
        46, '9e835abb-3041-4574-b9b3-b51780b6a99d',
        '0a3c8ca9-9d67-4421-bec3-087f34397ce3', 'aute irure dolor in reprehenderit in voluptate v');
INSERT INTO public.product (id, title, product_type_id, price, image_id, collection_id, delivery_id, properties_id, type)
VALUES ('6f1a625b-0fc7-458b-9afb-1f5c573f57c2', 'dese',45, 1345,
        '5f085d1b-2aa5-4cba-afdb-2cbceaa62af3', 46,
        'c0a4977e-8d89-41de-a0dd-813ac3358f2c', '9ba2cc6c-e729-48c6-8267-d52d7e574953',
        '. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat');
INSERT INTO public.product (id, title, product_type_id, price, image_id, collection_id, delivery_id, properties_id, type)
VALUES ('1aeddfd8-fe73-463a-8670-32884596e61b', 'd est laborum.Lorem ipsum dolor sit amet, consectetur adip',
        45, 123, '1cbec8d6-391f-4b93-9b29-c8e844905402',
        46, '43cf2e23-52a5-48cd-8b0d-739a9b863d6c',
        '2c71a078-9484-4739-a885-fa131cef636d',
        'olor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepte');
