drop extension "pgcrypto";
drop extension "uuid-ossp";
create EXTENSION IF NOT EXISTS "uuid-ossp";
create EXTENSION "pgcrypto";

create type baner_location as ENUM ('main_central','main_small');
create type baners_status as ENUM ('uses','not use');

create TABLE "baners"
(
    "baner_id"      serial         NOT NULL,
    "image_id"      uuid           NOT NULL,
    "title"         text,
    "page_location" baner_location not null,
    "baner_status"  baners_status,
    CONSTRAINT "baners_pkey" PRIMARY KEY ("baner_id")
);


create TABLE "images"
(
    "image_id"   uuid DEFAULT gen_random_uuid() NOT NULL,
    "image_patch" text                           NOT NULL,
    CONSTRAINT "images_pkey" PRIMARY KEY ("image_id")
);

create type payment_type as ENUM ('cash','non-cash');
create type order_status as ENUM ('creating','moderation','delivering','successfully','canceled by user',
    'canceled by sales');

create TABLE "orders"
(
    "order_id"          uuid         NOT NULL DEFAULT gen_random_uuid(),
    "is_payment"        bool         NOT NULL,
    "payment_type"      payment_type,
    "order_delivery_id" uuid,
    "order_status"      order_status NOT NULL,
    "user_id"           uuid         NOT NULL,
    CONSTRAINT "order_pkey" PRIMARY KEY ("order_id")
);

create type order_delivery_status as ENUM ('successfully','canceled by user','canceled by sales','not delivered');

create TABLE "orders_delivery"
(
    "order_delivery_id"     uuid NOT NULL DEFAULT gen_random_uuid(),
    "order_delivery_status" order_delivery_status,
    "address"               text,
    "delivery_date"         timestamp(6),
    "delivery_id"           uuid,
    CONSTRAINT "order_delivery_pkey" PRIMARY KEY ("order_delivery_id")
);

create type reviews_type as ENUM ('order','site','product');

create TABLE "reviews"
(
    "review_id"          uuid         NOT NULL DEFAULT gen_random_uuid(),
    "review_title"       text,
    "user_id"            uuid         NOT NULL,
    "review_mark"        int4         NOT NULL,
    "review_description" text,
    "review_type"        reviews_type NOT NULL,
    CONSTRAINT "Review_pkey" PRIMARY KEY ("review_id")
);

create TABLE "order_review"
(
    "order_review_id" uuid NOT NULL default gen_random_uuid(),
    "order_id"        uuid NOT NULL,
    "review_id"       uuid NOT NULL,
    CONSTRAINT "order_review_pkey" PRIMARY KEY ("order_review_id")
);

create TABLE "product_reviews"
(
    "product_reviews_id" uuid NOT NULL default gen_random_uuid(),
    "review_id"          uuid NOT NULL,
    "product_id"         uuid NOT NULL,
    CONSTRAINT "product_review_pkey" PRIMARY KEY ("product_reviews_id")
);

create TABLE "persons"
(
    "person_id"    uuid NOT NULL default gen_random_uuid(),
    "person_phone" text,
    "first_name"   text NOT NULL,
    "last_name"    text NOT NULL,
    CONSTRAINT "person_pkey" PRIMARY KEY ("person_id")
);

create TABLE "products"
(
    "product_id"          uuid           NOT NULL default gen_random_uuid(),
    "name_product"        text           NOT NULL,
    "product_category_id" int4           NOT NULL,
--    numeric(14, 2)
    "price"               numeric(14, 2) NOT NULL,
    "image_id"            uuid           NOT NULL,
--TODO нужно создать отдельную таблицу коллекции-продукты и выпелить collection_id
    "collection_id"       int4,
    "properties"          text           NOT NULL,
    "product_description" text,
    CONSTRAINT "product_pkey" PRIMARY KEY ("product_id")
);

create TABLE "products_delivery"
(
    "product_delivery_id" uuid NOT NULL default gen_random_uuid(),
    "sale_delivery"       numeric(14, 2),
    "product_id"          uuid ,
    "delivery_id"         uuid NOT NULL,
    CONSTRAINT "product_delivery_pkey" PRIMARY KEY ("product_delivery_id")
);

create TABLE "collections"
(
    "collection_id"          serial NOT NULL,
    "collection_name"        text   NOT NULL,
    "collection_description" text,
    "image_id"               uuid,
    CONSTRAINT "product_type_pkey" PRIMARY KEY ("collection_id")
);

create TABLE "sales"
(
    "sale_id"   serial         NOT NULL,
    "sale_name" text           NOT NULL,
    "image_id"  uuid,
--    numeric(14, 2)
    "discount"  numeric(14, 2) NOT NULL,
    CONSTRAINT "sales_pkey" PRIMARY KEY ("sale_id")
);

create TABLE "sales_product"
(
    "sale_product_id" uuid NOT NULL default gen_random_uuid(),
    "sale_id"         int4 NOT NULL,
    "product_id"      uuid NOT NULL,
    CONSTRAINT "sales_product_pkey" PRIMARY KEY ("sale_product_id")
);

create TABLE "users"
(
    "users_id"      uuid NOT NULL default gen_random_uuid(),
    "person_id"     uuid NOT NULL,
    "email"         text NOT NULL,
    "image_id"      uuid,
    "password_hash" text NOT NULL,
    CONSTRAINT "user_pkey" PRIMARY KEY ("users_id")
);

create TABLE "orders_products"
(
    "order_product_id" uuid DEFAULT gen_random_uuid() NOT NULL,
    "product_id"       uuid                           NOT NULL,
    "order_id"         uuid                           NOT NULL,
    "count"            int4                           NOT NULL,
    CONSTRAINT "order_product_pkey" PRIMARY KEY ("order_product_id")
);

create TABLE "delivery"
(
    "delivery_id"    uuid DEFAULT gen_random_uuid() NOT NULL,
    "delivery_area"  text                           NOT NULL,
    "price_delivery" numeric(14, 2)                 NOT NULL,
    CONSTRAINT "delivery_pkey" PRIMARY KEY ("delivery_id")
);

create TABLE "categories"
(
    "category_id"        int4 NOT NULL,
    "parent_category_id" int4,
    "category_name"      text NOT NULL,
    CONSTRAINT "category_pkey" PRIMARY KEY ("category_id")
);

create TABLE "favorite_category"
(
    "favorite_category_id" uuid NOT NULL,
    "category_id"          int4 NOT NULL,
    CONSTRAINT "favorite_category_pkey" PRIMARY KEY ("favorite_category_id")
);

create TABLE "favorite_category_products"
(
    "favorite_category_product_id" uuid NOT NULL,
    "product_id"                    uuid NOT NULL,
    "favorite_category_id"          uuid NOT NULL,
    CONSTRAINT "favorite_category_product_pkey" PRIMARY KEY ("favorite_category_product_id")
);


ALTER TABLE "collections"
    ADD CONSTRAINT "fk_baners_images" FOREIGN KEY ("image_id") REFERENCES "images" ("image_id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "baners"
    ADD CONSTRAINT "fk_baners_images" FOREIGN KEY ("image_id") REFERENCES "images" ("image_id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "categories"
    ADD CONSTRAINT "fk_categories_parentCategories" FOREIGN KEY ("parent_category_id") REFERENCES "categories" ("category_id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "favorite_category"
    ADD CONSTRAINT "fk_favoriteCategory_categories" FOREIGN KEY ("category_id") REFERENCES "categories" ("category_id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "favorite_category_products"
    ADD CONSTRAINT "fk_favoriteCategoryProducts_favoriteCategory" FOREIGN KEY ("favorite_category_id") REFERENCES "favorite_category" ("favorite_category_id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "favorite_category_products"
    ADD CONSTRAINT "fk_favoriteCategoryProducts_products" FOREIGN KEY ("product_id") REFERENCES "products" ("product_id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "order_review"
    ADD CONSTRAINT "fk_orderReview_orders" FOREIGN KEY ("order_id") REFERENCES "orders" ("order_id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "order_review"
    ADD CONSTRAINT "fk_orderReview_reviews" FOREIGN KEY ("review_id") REFERENCES "reviews" ("review_id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "orders"
    ADD CONSTRAINT "fk_orders_ordersDelivery" FOREIGN KEY ("order_delivery_id") REFERENCES "orders_delivery" ("order_delivery_id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "orders"
    ADD CONSTRAINT "fk_orders_users" FOREIGN KEY ("user_id") REFERENCES "users" ("users_id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "orders_delivery"
    ADD CONSTRAINT "fk_ordersDelivery_delivery" FOREIGN KEY ("delivery_id") REFERENCES "delivery" ("delivery_id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "orders_products"
    ADD CONSTRAINT "fk_ordersProducts_products" FOREIGN KEY ("product_id") REFERENCES "products" ("product_id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "orders_products"
    ADD CONSTRAINT "fk_orders_productsOrders" FOREIGN KEY ("order_id") REFERENCES "orders" ("order_id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "product_reviews"
    ADD CONSTRAINT "fk_productReviews_products" FOREIGN KEY ("product_id") REFERENCES "products" ("product_id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "product_reviews"
    ADD CONSTRAINT "fk_productReviews_reviews" FOREIGN KEY ("review_id") REFERENCES "reviews" ("review_id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "products"
    ADD CONSTRAINT "fk_products_categories" FOREIGN KEY ("product_category_id") REFERENCES "categories" ("category_id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "products"
    ADD CONSTRAINT "fk_products_collections" FOREIGN KEY ("collection_id") REFERENCES "collections" ("collection_id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "products"
    ADD CONSTRAINT "fk_products_images" FOREIGN KEY ("image_id") REFERENCES "images" ("image_id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "products_delivery"
    ADD CONSTRAINT "fk_productsDelivery_delivery" FOREIGN KEY ("delivery_id") REFERENCES "delivery" ("delivery_id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "products_delivery"
    ADD CONSTRAINT "fk_productsDelivery_products" FOREIGN KEY ("product_id") REFERENCES "products" ("product_id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "reviews"
    ADD CONSTRAINT "fk_reviews_users" FOREIGN KEY ("user_id") REFERENCES "users" ("users_id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "sales"
    ADD CONSTRAINT "fk_sales_images" FOREIGN KEY ("image_id") REFERENCES "images" ("image_id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "sales_product"
    ADD CONSTRAINT "fk_salesProduct_products" FOREIGN KEY ("product_id") REFERENCES "products" ("product_id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "sales_product"
    ADD CONSTRAINT "fk_salesProduct_sales" FOREIGN KEY ("sale_id") REFERENCES "sales" ("sale_id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "users"
    ADD CONSTRAINT "fk_users_persons" FOREIGN KEY ("person_id") REFERENCES "persons" ("person_id") ON DELETE NO ACTION ON UPDATE NO ACTION;