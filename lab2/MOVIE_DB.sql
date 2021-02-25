CREATE TABLE "MOVIE" (
  "id" SERIAL PRIMARY KEY,
  "m_title" varchar,
  "m_year" int,
  "m_length" float,
  "m_plot" text
);

CREATE TABLE "PERSON" (
  "id" SERIAL PRIMARY KEY,
  "name" varchar,
  "date_of_birth" date
);

CREATE TABLE "PRODUCION_COMPANY" (
  "id" SERIAL PRIMARY KEY,
  "name" varchar,
  "address" varchar
);

CREATE TABLE "GENRE" (
  "id" SERIAL PRIMARY KEY,
  "genre" varchar
);

CREATE TABLE "QUOTE" (
  "id" SERIAL PRIMARY KEY,
  "quote" text,
  "person" int
);

CREATE TABLE "_DIRECTS" (
  "id" SERIAL PRIMARY KEY,
  "person_id" int,
  "movie_id" int
);

CREATE TABLE "_PLAYS_AT" (
  "id" SERIAL PRIMARY KEY,
  "person_id" int,
  "movie_id" int
);

CREATE TABLE "_TELLS" (
  "person_id" int,
  "quote_id" int
);

CREATE TABLE "_IS_GENRE" (
  "id" int,
  "genre_id" int,
  "movie_id" int
);

CREATE TABLE "_IS_FILMED_AT" (
  "movie_id" int,
  "production_company_id" int
);

ALTER TABLE "_DIRECTS" ADD FOREIGN KEY ("person_id") REFERENCES "PERSON" ("id");

ALTER TABLE "_DIRECTS" ADD FOREIGN KEY ("movie_id") REFERENCES "MOVIE" ("id");

ALTER TABLE "_PLAYS_AT" ADD FOREIGN KEY ("person_id") REFERENCES "PERSON" ("id");

ALTER TABLE "_PLAYS_AT" ADD FOREIGN KEY ("movie_id") REFERENCES "MOVIE" ("id");

ALTER TABLE "_TELLS" ADD FOREIGN KEY ("person_id") REFERENCES "PERSON" ("id");

ALTER TABLE "_TELLS" ADD FOREIGN KEY ("quote_id") REFERENCES "QUOTE" ("id");

ALTER TABLE "_IS_GENRE" ADD FOREIGN KEY ("movie_id") REFERENCES "MOVIE" ("id");

ALTER TABLE "_IS_GENRE" ADD FOREIGN KEY ("genre_id") REFERENCES "GENRE" ("id");

ALTER TABLE "_IS_FILMED_AT" ADD FOREIGN KEY ("movie_id") REFERENCES "MOVIE" ("id");

ALTER TABLE "_IS_FILMED_AT" ADD FOREIGN KEY ("production_company_id") REFERENCES "PRODUCION_COMPANY" ("id");
