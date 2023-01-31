--
-- Class Chemists as table chemists
--

CREATE TABLE "chemists" (
  "id" serial,
  "name" text NOT NULL,
  "address" text,
  "geoPoint" json,
  "images" json NOT NULL,
  "openTime" timestamp without time zone,
  "closeTime" timestamp without time zone,
  "email" text,
  "phoneNo" integer
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
-- Class Patient as table patient
--

CREATE TABLE "patient" (
  "id" serial,
  "name" text NOT NULL,
  "age" integer NOT NULL,
  "gender" text NOT NULL,
  "weight" text,
  "height" text,
  "createdAt" timestamp without time zone NOT NULL,
  "userId" integer NOT NULL
);

ALTER TABLE ONLY "patient"
  ADD CONSTRAINT patient_pkey PRIMARY KEY (id);


