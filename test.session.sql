

--
-- Class Inventory as table inventory
--

CREATE TABLE "inventory" (
  "id" serial,
  "medicineId" integer NOT NULL,
  "price" integer NOT NULL,
  "stock" integer NOT NULL,
  "chemistsId" integer NOT NULL
);

ALTER TABLE ONLY "inventory"
  ADD CONSTRAINT inventory_pkey PRIMARY KEY (id);

ALTER TABLE ONLY "inventory"
  ADD CONSTRAINT inventory_fk_0
    FOREIGN KEY("medicineId")
      REFERENCES medicine(id)
        ON DELETE CASCADE;
ALTER TABLE ONLY "inventory"
  ADD CONSTRAINT inventory_fk_1
    FOREIGN KEY("chemistsId")
      REFERENCES chemists(id)
        ON DELETE CASCADE;
