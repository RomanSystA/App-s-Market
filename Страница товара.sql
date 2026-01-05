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

CREATE TABLE "reviews" (
  "id" integer PRIMARY KEY,
  "user_id" integer,
  "item_id" integer,
  "rating_id" smallint,
  "comment" text,
  "created_at" timestamp
);

CREATE TABLE "item_rating" (
  "id" smallint PRIMARY KEY,
  "value" decimal
);

CREATE TABLE "favorites" (
  "user_id" integer PRIMARY KEY,
  "item_id" integer PRIMARY KEY,
  PRIMARY KEY ("user_id", "item_id")
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

CREATE TABLE "seller" (
  "id" integer PRIMARY KEY,
  "name" varchar,
  "rating" smallint
);

CREATE TABLE "seller_rating" (
  "id" smallint PRIMARY KEY,
  "value" decimal
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

COMMENT ON COLUMN "users"."tg_username" IS 'логин в тг, к которому привязан акк';

COMMENT ON COLUMN "item_rating"."id" IS '"item_rating"."id" < "item"."rating"';

ALTER TABLE "reviews" ADD FOREIGN KEY ("rating_id") REFERENCES "item_rating" ("id");

ALTER TABLE "favorites" ADD FOREIGN KEY ("user_id") REFERENCES "users" ("id");;

ALTER TABLE "reviews" ADD FOREIGN KEY ("user_id") REFERENCES "users" ("id");

ALTER TABLE "reviews" ADD FOREIGN KEY ("item_id") REFERENCES "item" ("id");

ALTER TABLE "item" ADD FOREIGN KEY ("rating") REFERENCES "item_rating" ("id");

ALTER TABLE "cart" ADD FOREIGN KEY ("user_id") REFERENCES "users" ("id");

ALTER TABLE "opt_value" ADD FOREIGN KEY ("option_id") REFERENCES "option" ("id");

ALTER TABLE "option" ADD FOREIGN KEY ("item_id") REFERENCES "item" ("id");

ALTER TABLE "seller" ADD FOREIGN KEY ("rating") REFERENCES "seller_rating" ("id");

ALTER TABLE "item_category" ADD FOREIGN KEY ("category_id") REFERENCES "category" ("id");

ALTER TABLE "item_category" ADD FOREIGN KEY ("item_id") REFERENCES "item" ("id");

ALTER TABLE "seller_item" ADD FOREIGN KEY ("seller_id") references "seller" ("id");

ALTER TABLE "item" ADD FOREIGN KEY ("id") REFERENCES "seller_item" ("item_id");
