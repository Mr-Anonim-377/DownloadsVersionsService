-- Создание базы данных
CREATE DATABASE Sales OWNER postgres;
GRANT ALL privileges ON DATABASE Sales TO postgres;


-- Создание таблиц  TODO (В разработке)

create table if not exists product
(
    id              uuid default gen_random_uuid() not null
        constraint product_pkey
            primary key,
    title           text,
    product_type_id uuid,
    price           double precision,
    image_id        uuid,
    colection_id    uuid,
    delivery_id     uuid,
    properties_id   uuid,
    type            text
);

alter table product
    owner to postgres;

create table if not exists sales
(
    id        uuid default gen_random_uuid() not null
        constraint sales_pkey
            primary key,
    title     text                           not null,
    images_id uuid                           not null
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

-- Создание тестовых данных TODO (В разработке)
INSERT INTO public.sales (id, title, images_id)
VALUES ('e27050aa-16be-4c85-a298-5bbf4f0d3e6d', 'Скидка 90% на все ', '10c3de72-fe8a-45e8-a90b-6aef99e4af19');
INSERT INTO public.sales (id, title, images_id)
VALUES ('06aee656-fb29-4541-b28b-d4d915320ba6', 'скидка 10% на покупку от 1000 рублей',
        '11eb2f39-7337-4fc7-a59a-806bd45800ba');
INSERT INTO public.sales (id, title, images_id)
VALUES ('5fb312b2-457c-4e83-bc0b-e2dc9a598721', 'купи один,получи второй в подарок',
        'c11c38bc-f5d1-4869-8989-67b3670558ae');