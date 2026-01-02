CREATE TABLE "users" (
  "id" integer PRIMARY KEY,
  "email" varchar,
  "phone_number" varchar,
  "tg_username" varchar
);

CREATE TABLE "item" (
  "id" integer PRIMARY KEY,
  "seller_id" integer,
  "name" varchar,
  "category" varchar,
  "base_price" decimal,
  "rating" smallient,
  "reviews_quantity" decimal
);

CREATE TABLE "item_category" (
  "id" integer PRIMARY KEY,
  "item_id" integer,
  "name" varchar
);

CREATE TABLE "favourites" (
  "id" integer PRIMARY KEY,
  "user_id" integer
);

CREATE TABLE "cart" (
  "id" integer PRIMARY KEY,
  "user_id" integer
);

CREATE TABLE "cart_item" (
  "id" integer PRIMARY KEY,
  "user_id" integer,
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
  "item_id" integer,
  "name" varchar,
  "rating" smallient
);

CREATE TABLE "seller_rating" (
  "id" smalliant PRIMARY KEY,
  "value" decimal
);

CREATE TABLE "item_rating" (
  "id" smalliant PRIMARY KEY,
  "value" decimal
);

COMMENT ON COLUMN "users"."tg_username" IS 'логин в тг, к которому привязан акк';

ALTER TABLE "item" ADD FOREIGN KEY ("id") REFERENCES "item_category" ("item_id");

ALTER TABLE "users" ADD FOREIGN KEY ("id") REFERENCES "favourites" ("user_id");

ALTER TABLE "users" ADD FOREIGN KEY ("id") REFERENCES "cart" ("user_id");

ALTER TABLE "option" ADD FOREIGN KEY ("id") REFERENCES "opt_value" ("option_id");

ALTER TABLE "item" ADD FOREIGN KEY ("id") REFERENCES "option" ("item_id");

ALTER TABLE "favourites" ADD FOREIGN KEY ("id") REFERENCES "cart_item" ("user_id");

ALTER TABLE "cart" ADD FOREIGN KEY ("id") REFERENCES "cart_item" ("cart_id");

ALTER TABLE "item" ADD FOREIGN KEY ("id") REFERENCES "cart_item" ("item_id");

ALTER TABLE "seller" ADD FOREIGN KEY ("rating") REFERENCES "seller_rating" ("id");

ALTER TABLE "item" ADD FOREIGN KEY ("seller_id") REFERENCES "seller" ("id");

ALTER TABLE "item" ADD FOREIGN KEY ("rating") REFERENCES "item_rating" ("id");
