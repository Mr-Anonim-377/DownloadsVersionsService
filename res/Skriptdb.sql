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
    product_type_id integer,
    price           double precision,
    image_id        uuid,
    colection_id    integer,
    delivery_id     uuid,
    properties_id   uuid,
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

-- Создание тестовых данных TODO (В разработке)
INSERT INTO public.sales (id, title, images_id)
VALUES (1, 'Скидка 90% на все ', '10c3de72-fe8a-45e8-a90b-6aef99e4af19');
INSERT INTO public.sales (id, title, images_id)
VALUES (2, 'скидка 10% на покупку от 1000 рублей',
        '11eb2f39-7337-4fc7-a59a-806bd45800ba');
INSERT INTO public.sales (id, title, images_id)
VALUES (3, 'купи один,получи второй в подарок',
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
