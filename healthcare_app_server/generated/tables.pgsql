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
  "userInfo" json NOT NULL
);

ALTER TABLE ONLY "patient"
  ADD CONSTRAINT patient_pkey PRIMARY KEY (id);


