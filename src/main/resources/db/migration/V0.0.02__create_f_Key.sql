ALTER TABLE "products"
    ADD CONSTRAINT "product_fk0" FOREIGN KEY ("collection_id") REFERENCES "collections" ("id") ;
ALTER TABLE "products"
    ADD CONSTRAINT "product_fk1" FOREIGN KEY ("image_id") REFERENCES "images" ("id") ;
ALTER TABLE "products"
    ADD CONSTRAINT "product_fk2" FOREIGN KEY ("delivery_id") REFERENCES "products_delivery" ("id") ;
--
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
    ADD CONSTRAINT "product_id" FOREIGN KEY ("product_id") REFERENCES "products" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "orders_products"
    ADD CONSTRAINT "order_id" FOREIGN KEY ("order_id") REFERENCES "orders" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "products_delivery"
    ADD CONSTRAINT "delivery_id" FOREIGN KEY ("delivery_id") REFERENCES "delivery" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "products"
    ADD CONSTRAINT "product_category" FOREIGN KEY ("product_category_id") REFERENCES "categories" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "categories"
    ADD CONSTRAINT "parent_id" FOREIGN KEY ("parent_id") REFERENCES "categories" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "baners"
    ADD CONSTRAINT "image_id" FOREIGN KEY ("image_id") REFERENCES "images" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "favorite_categories"
    ADD CONSTRAINT "categoriy_id" FOREIGN KEY ("category_id") REFERENCES "categories" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "favorite_category_products"
    ADD CONSTRAINT "favorite_category_id" FOREIGN KEY ("favorite_categoru_id") REFERENCES "favorite_categories" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "favorite_category_products"
    ADD CONSTRAINT "product_id" FOREIGN KEY ("product_id") REFERENCES "products" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;