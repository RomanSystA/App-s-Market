CREATE TABLE "users" (
  "id" integer PRIMARY KEY,
  "first_name" varchar,
  "last_name" varchar,
  "email" varchar,
  "phone_number" varchar,
  "created_at" timestamp,
  "tg_username" varchar
);

CREATE TABLE "item" (
  "id" integer PRIMARY KEY,
  "name" varchar,
  "base_price" decimal,
  "rating" smallint,
  "reviews_quantity" decimal
);

CREATE TABLE "category" (
  "id" integer PRIMARY KEY,
  "name" varchar
);

CREATE TABLE "favorites" (
  "user_id" integer,
  "item_id" integer,
  PRIMARY KEY ("user_id", "item_id")
);

CREATE TABLE "cart" (
  "id" integer PRIMARY KEY,
  "user_id" integer
);

CREATE TABLE "cart_item" (
  "id" integer PRIMARY KEY,
  "cart_id" integer,
  "item_id" integer,
  "quantity" decimal,
  "price" decimal
);

CREATE TABLE "option" (
  "id" integer PRIMARY KEY,
  "item_id" integer,
  "name" varchar
);

CREATE TABLE "opt_value" (
  "id" integer PRIMARY KEY,
  "option_id" integer,
  "value" varchar,
  "price_delta" decimal
);

CREATE TABLE "seller" (
  "id" integer PRIMARY KEY,
  "name" varchar,
  "rating" smallint
);

CREATE TABLE "seller_rating" (
  "id" smalliant PRIMARY KEY,
  "value" decimal
);

CREATE TABLE "item_rating" (
  "id" smallint PRIMARY KEY,
  "value" decimal
);

CREATE TABLE "cart_item_opt_value" (
  "cart_item_id" integer,
  "opt_value_id" integer
);

CREATE TABLE "item_category" (
  "item_id" integer,
  "category_id" integer
);

CREATE TABLE "seller_item" (
  "id" integer PRIMARY KEY,
  "item_id" integer,
  "seller_id" integer,
  "price" decimal,
  "available" boolean
);

COMMENT ON COLUMN "user"."tg_username" IS 'логин в тг, к которому привязан акк';

ALTER TABLE "favorites" ADD FOREIGN KEY ("user_id") REFERENCES "user" ("id");

ALTER TABLE "user" ADD FOREIGN KEY ("id") REFERENCES "cart" ("user_id");

ALTER TABLE "option" ADD FOREIGN KEY ("id") REFERENCES "opt_value" ("option_id");

ALTER TABLE "item" ADD FOREIGN KEY ("id") REFERENCES "option" ("item_id");

ALTER TABLE "cart" ADD FOREIGN KEY ("id") REFERENCES "cart_item" ("cart_id");

ALTER TABLE "cart_item" ADD FOREIGN KEY ("item_id") REFERENCES "item" ("id");

ALTER TABLE "seller" ADD FOREIGN KEY ("rating") REFERENCES "seller_rating" ("id");

ALTER TABLE "item" ADD FOREIGN KEY ("rating") REFERENCES "item_rating" ("id");

ALTER TABLE "cart_item_opt_value" ADD FOREIGN KEY ("cart_item_id") REFERENCES "cart_item" ("id");

ALTER TABLE "cart_item_opt_value" ADD FOREIGN KEY ("opt_value_id") REFERENCES "opt_value" ("id");

ALTER TABLE "item_category" ADD FOREIGN KEY ("category_id") REFERENCES "category" ("id");

ALTER TABLE "item_category" ADD FOREIGN KEY ("item_id") REFERENCES "item" ("id");

ALTER TABLE "favorites" ADD FOREIGN KEY ("item_id") REFERENCES "item" ("id");

ALTER TABLE "seller_item" ADD FOREIGN KEY ("seller_id") REFERENCES "seller" ("id");

ALTER TABLE "item" ADD FOREIGN KEY ("id") REFERENCES "seller_item" ("item_id");
