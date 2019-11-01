CREATE TABLE "baners"
(
    "id"       serial NOT NULL,
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
    "product_category_id" uuid                   NOT NULL,
    "price"               float8                 NOT NULL,
    "image_id"            uuid                   NOT NULL,
    "collection_id"       int4,
    "delivery_id"         uuid,
    "properties"          text COLLATE "default" NOT NULL,
    "description"         text COLLATE "default",
    CONSTRAINT "product_pkey" PRIMARY KEY ("id"),
    CONSTRAINT "product_fk2" FOREIGN KEY ("delivery_id") REFERENCES "products_delivery" ("id")
)
    WITHOUT OIDS;
ALTER TABLE "products"
    OWNER TO "postgres";

CREATE TABLE "products_delivery"
(
    "id"                uuid NOT NULL DEFAULT gen_random_uuid(),
    "possible_delivery" bool,
    "sale_delivery"     float8,
    "delivery_id"       uuid,
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
    "id"          serial NOT NULL,
    "title"       text COLLATE "default",
    "description" text COLLATE "default",
    CONSTRAINT "product_type_pkey" PRIMARY KEY ("id")
)
    WITHOUT OIDS;
ALTER TABLE "collections"
    OWNER TO "postgres";

CREATE TABLE "sales"
(
    "id"       serial                 not null,
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
);

CREATE TABLE "delivery"
(
    "id"   uuid NOT NULL,
    "area" text NOT NULL,
    PRIMARY KEY ("id")
);

CREATE TABLE "categories"
(
    "id"        uuid NOT NULL,
    "parent_id" uuid,
    "title"     varchar(255),
    PRIMARY KEY ("id")
);


CREATE TABLE "favorite_categories"
(
    "id"          uuid NOT NULL,
    "category_id" uuid NOT NULL,
    "title"       text NOT NULL,
    PRIMARY KEY ("id")
);

CREATE TABLE "favorite_category_products"
(
    "id"                   uuid NOT NULL,
    "product_id"           uuid NOT NULL,
    "favorite_categoru_id" uuid NOT NULL,
    PRIMARY KEY ("id")
);