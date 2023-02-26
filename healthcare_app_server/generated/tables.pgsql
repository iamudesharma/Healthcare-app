--
-- Class Chemists as table chemists
--

CREATE TABLE "chemists" (
  "id" serial,
  "name" text NOT NULL,
  "address" text,
  "geoPoint" json,
  "images" text,
  "openTime" timestamp without time zone,
  "closeTime" timestamp without time zone,
  "email" text,
  "phoneNo" integer,
  "userId" integer NOT NULL,
  "latitude" double precision,
  "longitude" double precision,
  "invertory" json
);

ALTER TABLE ONLY "chemists"
  ADD CONSTRAINT chemists_pkey PRIMARY KEY (id);


--
-- Class Doctor as table doctor
--

CREATE TABLE "doctor" (
  "id" serial,
  "name" text,
  "age" integer,
  "address" text,
  "fees" integer,
  "experience" integer,
  "geoPoint" json
);

ALTER TABLE ONLY "doctor"
  ADD CONSTRAINT doctor_pkey PRIMARY KEY (id);


--
-- Class GeoPoint as table geopoint
--

CREATE TABLE "geopoint" (
  "id" serial,
  "lat" double precision NOT NULL,
  "long" double precision NOT NULL
);

ALTER TABLE ONLY "geopoint"
  ADD CONSTRAINT geopoint_pkey PRIMARY KEY (id);


--
-- Class Medicine as table medicine
--

CREATE TABLE "medicine" (
  "id" serial,
  "name" text,
  "category" text,
  "description" text,
  "subCategory" text,
  "idCode" integer NOT NULL,
  "image" text,
  "manufactures" text,
  "packaging" text,
  "pack_info" text,
  "introduction" text,
  "benefits" text,
  "howToUse" text,
  "safetyAdvise" text,
  "ingredients" text,
  "manufactureAddress" text,
  "countryOfOrigin" text,
  "medicineType" text,
  "useOf" text
);

ALTER TABLE ONLY "medicine"
  ADD CONSTRAINT medicine_pkey PRIMARY KEY (id);

CREATE INDEX medicine_name_idx ON "medicine" USING btree ("name");


--
-- Class Inventory as table inventory
--

CREATE TABLE "inventory" (
  "id" serial,
  "medicineId" integer NOT NULL,
  "price" integer NOT NULL,
  "stock" integer NOT NULL
);

ALTER TABLE ONLY "inventory"
  ADD CONSTRAINT inventory_pkey PRIMARY KEY (id);

ALTER TABLE ONLY "inventory"
  ADD CONSTRAINT inventory_fk_0
    FOREIGN KEY("medicineId")
      REFERENCES medicine(id)
        ON DELETE CASCADE;

--
-- Class Patient as table patient
--

CREATE TABLE "patient" (
  "id" serial,
  "name" text NOT NULL,
  "age" integer,
  "gender" text,
  "weight" text,
  "height" text,
  "createdAt" timestamp without time zone NOT NULL,
  "userId" integer NOT NULL,
  "address" text,
  "phoneNo" integer,
  "geoPoint" json,
  "image" text
);

ALTER TABLE ONLY "patient"
  ADD CONSTRAINT patient_pkey PRIMARY KEY (id);


