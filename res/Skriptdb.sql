-- Создание базы данных
CREATE DATABASE sales OWNER postgres;
GRANT ALL privileges ON DATABASE sales TO postgres;
--Перейти в базу данных Sales (установить как активный обьект в субд или через консоль /c sales)
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";
CREATE EXTENSION "pgcrypto";

-- Создание таблиц  TODO (В разработке)
CREATE TABLE "baners"
(
    "id"       float8 NOT NULL DEFAULT nextval('baners_id_seq'::regclass),
    "image_id" uuid   NOT NULL,
    "title"    text COLLATE "default",
    CONSTRAINT "baners_pkey" PRIMARY KEY ("id")
)
    WITHOUT OIDS;
ALTER TABLE "baners"
    OWNER TO "postgres";

CREATE TABLE "images"
(
    "id"          uuid                   NOT NULL DEFAULT gen_random_uuid(),
    "image_patch" text COLLATE "default" NOT NULL,
    CONSTRAINT "images_pkey" PRIMARY KEY ("id")
)
    WITHOUT OIDS;
ALTER TABLE "images"
    OWNER TO "postgres";

CREATE TABLE "orders"
(
    "id"                uuid                   NOT NULL DEFAULT gen_random_uuid(),
    "is_payment"        bool,
    "payment_type"      text COLLATE "default" NOT NULL,
    "order_delivery_id" uuid,
    "statys"            text COLLATE "default",
    "user_id"           uuid                   NOT NULL,
    CONSTRAINT "order_pkey" PRIMARY KEY ("id")
)
    WITHOUT OIDS;
ALTER TABLE "orders"
    OWNER TO "postgres";

CREATE TABLE "orders_delivery"
(
    "id"      uuid NOT NULL DEFAULT gen_random_uuid(),
    "status"  text COLLATE "default",
    "address" text COLLATE "default",
    "date"    timestamp(6),
    CONSTRAINT "order_delivery_pkey" PRIMARY KEY ("id")
)
    WITHOUT OIDS;
ALTER TABLE "orders_delivery"
    OWNER TO "postgres";

CREATE TABLE "order_reviews"
(
    "id"          uuid NOT NULL DEFAULT gen_random_uuid(),
    "title"       text COLLATE "default",
    "user_id"     uuid NOT NULL,
    "mark"        int4 NOT NULL,
    "order_id"    uuid NOT NULL,
    "description" text,
    CONSTRAINT "order_review_pkey" PRIMARY KEY ("id")
)
    WITHOUT OIDS;
ALTER TABLE "order_reviews"
    OWNER TO "postgres";

CREATE TABLE "persons"
(
    "id"     uuid                   NOT NULL DEFAULT gen_random_uuid(),
    "phone"  text COLLATE "default",
    "f_name" text COLLATE "default" NOT NULL,
    "l_name" text COLLATE "default" NOT NULL,
    CONSTRAINT "person_pkey" PRIMARY KEY ("id")
)
    WITHOUT OIDS;
ALTER TABLE "persons"
    OWNER TO "postgres";

CREATE TABLE "products"
(
    "id"                  uuid                   NOT NULL DEFAULT gen_random_uuid(),
    "title"               text COLLATE "default" NOT NULL,
    "product_category_id" int4                   NOT NULL,
    "price"               float8                 NOT NULL,
    "image_id"            uuid                   NOT NULL,
    "collection_id"       int4,
    "delivery_id"         uuid,
    "properties"          text COLLATE "default" NOT NULL,
    "description"         text COLLATE "default",
    CONSTRAINT "product_pkey" PRIMARY KEY ("id")
)
    WITHOUT OIDS;
ALTER TABLE "products"
    OWNER TO "postgres";

CREATE TABLE "products_delivery"
(
    "id"                uuid NOT NULL DEFAULT gen_random_uuid(),
    "possible_delivery" bool,
    "sale_delivery"     float8,
    CONSTRAINT "product_delivery_pkey" PRIMARY KEY ("id")
)
    WITHOUT OIDS;
ALTER TABLE "products_delivery"
    OWNER TO "postgres";

CREATE TABLE "product_reviews"
(
    "id"          uuid NOT NULL DEFAULT gen_random_uuid(),
    "title"       text COLLATE "default",
    "user_id"     uuid NOT NULL,
    "mark"        int4 NOT NULL,
    "description" text,
    CONSTRAINT "product_review_pkey" PRIMARY KEY ("id")
)
    WITHOUT OIDS;
ALTER TABLE "product_reviews"
    OWNER TO "postgres";

CREATE TABLE "product_review_products"
(
    "id"                uuid NOT NULL DEFAULT gen_random_uuid(),
    "product_id"        uuid NOT NULL,
    "product_review_id" uuid NOT NULL,
    CONSTRAINT "product_review_product_pkey" PRIMARY KEY ("id")
)
    WITHOUT OIDS;
ALTER TABLE "product_review_products"
    OWNER TO "postgres";

CREATE TABLE "collections"
(
    "id"          int4 NOT NULL DEFAULT nextval('product_type_id_seq'::regclass),
    "title"       text COLLATE "default",
    "description" text COLLATE "default",
    CONSTRAINT "product_type_pkey" PRIMARY KEY ("id")
)
    WITHOUT OIDS;
ALTER TABLE "collections"
    OWNER TO "postgres";

CREATE TABLE "sales"
(
    "id"       int4                   NOT NULL DEFAULT nextval('sales_id_seq'::regclass),
    "title"    text COLLATE "default" NOT NULL,
    "image_id" uuid,
    "discount" float8                 NOT NULL,
    CONSTRAINT "sales_pkey" PRIMARY KEY ("id")
)
    WITHOUT OIDS;
ALTER TABLE "sales"
    OWNER TO "postgres";

CREATE TABLE "sales_product"
(
    "id"         uuid NOT NULL DEFAULT gen_random_uuid(),
    "sale_id"    int4 NOT NULL,
    "product_id" uuid NOT NULL,
    CONSTRAINT "sales_product_pkey" PRIMARY KEY ("id")
)
    WITHOUT OIDS;
ALTER TABLE "sales_product"
    OWNER TO "postgres";

CREATE TABLE "site_reviews"
(
    "id"          uuid NOT NULL DEFAULT gen_random_uuid(),
    "title"       text COLLATE "default",
    "user_id"     uuid NOT NULL,
    "mark"        int4 NOT NULL,
    "description" text,
    CONSTRAINT "site_review_pkey" PRIMARY KEY ("id")
)
    WITHOUT OIDS;
ALTER TABLE "site_reviews"
    OWNER TO "postgres";

CREATE TABLE "users"
(
    "id"            uuid                   NOT NULL DEFAULT gen_random_uuid(),
    "person_id"     uuid                   NOT NULL,
    "email"         text COLLATE "default" NOT NULL,
    "image_id"      uuid,
    "password_hash" text COLLATE "default" NOT NULL,
    CONSTRAINT "user_pkey" PRIMARY KEY ("id")
)
    WITHOUT OIDS;
ALTER TABLE "users"
    OWNER TO "postgres";

CREATE TABLE "orders_products"
(
    "id"         uuid NOT NULL,
    "product_id" uuid NOT NULL,
    "order_id"   uuid NOT NULL,
    "number"     int4 NOT NULL,
    PRIMARY KEY ("id")
)
    WITHOUT OIDS;
CREATE TABLE "delivery"
(
    "id"   uuid NOT NULL,
    "area" text NOT NULL,
    PRIMARY KEY ("id")
)
    WITHOUT OIDS;
CREATE TABLE "categories"
(
    "id"        uuid NOT NULL,
    "parent_id" uuid,
    "title"     varchar(255),
    PRIMARY KEY ("id")
)
    WITHOUT OIDS;
CREATE TABLE "baners"
(
    "id"       int4 NOT NULL,
    "image_id" uuid NOT NULL,
    "title"    text NOT NULL,
    PRIMARY KEY ("id")
)
    WITHOUT OIDS;
CREATE TABLE "favorite_categories"
(
    "id"          uuid NOT NULL,
    "category_id" int4 NOT NULL,
    "title"       text NOT NULL,
    PRIMARY KEY ("id")
)
    WITHOUT OIDS;
CREATE TABLE "favorite_category_products"
(
    "id"                   uuid NOT NULL,
    "product_id"           uuid NOT NULL,
    "favorite_categoru_id" uuid NOT NULL,
    PRIMARY KEY ("id")
)
    WITHOUT OIDS;

ALTER TABLE "baners"
    ADD CONSTRAINT "baners_fk0" FOREIGN KEY ("image_id") REFERENCES "images" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "orders"
    ADD CONSTRAINT "order_fk0" FOREIGN KEY ("order_delivery_id") REFERENCES "orders_delivery" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "orders"
    ADD CONSTRAINT "order_fk1" FOREIGN KEY ("user_id") REFERENCES "users" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "order_reviews"
    ADD CONSTRAINT "order_review_fk0" FOREIGN KEY ("user_id") REFERENCES "users" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "order_reviews"
    ADD CONSTRAINT "order_review_fk1" FOREIGN KEY ("order_id") REFERENCES "orders" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "products"
    ADD CONSTRAINT "product_fk0" FOREIGN KEY ("collection_id") REFERENCES "collections" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "products"
    ADD CONSTRAINT "product_fk1" FOREIGN KEY ("image_id") REFERENCES "images" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "products"
    ADD CONSTRAINT "product_fk2" FOREIGN KEY ("delivery_id") REFERENCES "products_delivery" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "product_review_products"
    ADD CONSTRAINT "product_review_product_fk0" FOREIGN KEY ("product_id") REFERENCES "products" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "product_review_products"
    ADD CONSTRAINT "product_review_product_fk1" FOREIGN KEY ("product_review_id") REFERENCES "product_reviews" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "sales"
    ADD CONSTRAINT "sales_fk0" FOREIGN KEY ("image_id") REFERENCES "images" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "sales_product"
    ADD CONSTRAINT "sales_product_fk0" FOREIGN KEY ("sale_id") REFERENCES "sales" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "sales_product"
    ADD CONSTRAINT "sales_product_fk1" FOREIGN KEY ("product_id") REFERENCES "products" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "site_reviews"
    ADD CONSTRAINT "site_review_fk0" FOREIGN KEY ("user_id") REFERENCES "users" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "users"
    ADD CONSTRAINT "user_fk0" FOREIGN KEY ("person_id") REFERENCES "persons" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "users"
    ADD CONSTRAINT "user_fk1" FOREIGN KEY ("image_id") REFERENCES "images" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "orders_products"
    ADD CONSTRAINT "product_id" FOREIGN KEY ("product_id") REFERENCES "products" ("id");
ALTER TABLE "orders_products"
    ADD CONSTRAINT "order_id" FOREIGN KEY ("order_id") REFERENCES "orders" ("id");
ALTER TABLE "products_delivery"
    ADD CONSTRAINT "delivery_id" FOREIGN KEY ("sale_delivery") REFERENCES "delivery" ("id");
ALTER TABLE "products"
    ADD CONSTRAINT "product_category" FOREIGN KEY ("product_category_id") REFERENCES "categories" ("id");
ALTER TABLE "categories"
    ADD CONSTRAINT "parent_id" FOREIGN KEY ("parent_id") REFERENCES "categories" ("id");
ALTER TABLE "baners"
    ADD CONSTRAINT "image_id" FOREIGN KEY ("image_id") REFERENCES "images" ("id");
ALTER TABLE "favorite_categories"
    ADD CONSTRAINT "categoriy_id" FOREIGN KEY ("category_id") REFERENCES "categories" ("id");
ALTER TABLE "favorite_category_products"
    ADD CONSTRAINT "favorite_category_id" FOREIGN KEY ("favorite_categoru_id") REFERENCES "favorite_categories" ("id");
ALTER TABLE "favorite_category_products"
    ADD CONSTRAINT "product_id" FOREIGN KEY ("product_id") REFERENCES "products" ("id");