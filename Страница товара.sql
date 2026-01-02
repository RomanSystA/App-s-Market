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

CREATE TABLE "reviews" (
  "id" integer PRIMARY KEY,
  "user_id" integer,
  "item_id" integer,
  "quantity" decimal,
  "rating_id" smalliant
);

CREATE TABLE "rating" (
  "id" smalliant PRIMARY KEY,
  "value" decimal
);

CREATE TABLE "favourites" (
  "id" integer PRIMARY KEY,
  "user_id" integer
);

CREATE TABLE "cart" (
  "id" integer PRIMARY KEY,
  "user_id" integer
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

COMMENT ON COLUMN "users"."tg_username" IS 'логин в тг, к которому привязан акк';

COMMENT ON COLUMN "reviews"."rating_id" IS '1...5';

ALTER TABLE "item" ADD FOREIGN KEY ("id") REFERENCES "item_category" ("item_id");

ALTER TABLE "reviews" ADD FOREIGN KEY ("rating_id") REFERENCES "rating" ("id");

ALTER TABLE "users" ADD FOREIGN KEY ("id") REFERENCES "favourites" ("user_id");

ALTER TABLE "users" ADD FOREIGN KEY ("id") REFERENCES "reviews" ("user_id");

ALTER TABLE "item" ADD FOREIGN KEY ("id") REFERENCES "reviews" ("item_id");

ALTER TABLE "item" ADD FOREIGN KEY ("rating") REFERENCES "rating" ("id");

ALTER TABLE "users" ADD FOREIGN KEY ("id") REFERENCES "cart" ("user_id");

ALTER TABLE "option" ADD FOREIGN KEY ("id") REFERENCES "opt_value" ("option_id");

ALTER TABLE "item" ADD FOREIGN KEY ("id") REFERENCES "option" ("item_id");
