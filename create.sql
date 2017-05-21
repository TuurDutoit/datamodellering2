CREATE TABLE medewerker (
    id serial PRIMARY KEY,
    naam varchar(45) NOT NULL,
    email varchar(45),
    telefoon varchar(20),
    adres varchar(100),
    service_area_naam varchar(45) NOT NULL
);


CREATE TABLE service_area (
    naam varchar(45) PRIMARY KEY,
    manager_id serial NOT NULL,
    
    CONSTRAINT fk_manager_id
      FOREIGN KEY (manager_id)
      REFERENCES medewerker (id)
      ON DELETE RESTRICT
      ON UPDATE CASCADE
);


ALTER TABLE medewerker
  ADD CONSTRAINT fk_service_area_naam
    FOREIGN KEY (service_area_naam)
    REFERENCES service_area (naam)
    ON DELETE RESTRICT
    ON UPDATE CASCADE;


CREATE TABLE verlof (
    id serial PRIMARY KEY,
    van timestamp NOT NULL,
    tot timestamp NOT NULL,
    betaald boolean NOT NULL,
    goedgekeurd boolean DEFAULT false,
    medewerker_id integer NOT NULL,
    
    CONSTRAINT fk_medewerker_id
      FOREIGN KEY (medewerker_id)
      REFERENCES medewerker (id)
      ON DELETE CASCADE
      ON UPDATE CASCADE
);


CREATE TABLE contract_type (
    naam varchar(45) PRIMARY KEY
);


CREATE TABLE contract (
    id serial PRIMARY KEY,
    van timestamp NOT NULL,
    tot timestamp NOT NULL,
    uurloon integer NOT NULL,
    medewerker_id integer NOT NULL,
    contract_type_naam varchar(45) NOT NULL,
    
    CONSTRAINT fk_medewerker_id
      FOREIGN KEY (medewerker_id)
      REFERENCES medewerker (id)
      ON DELETE CASCADE
      ON UPDATE CASCADE,
    
    CONSTRAINT fk_contract_type_naam
      FOREIGN KEY (contract_type_naam)
      REFERENCES contract_type (naam)
      ON DELETE RESTRICT
      ON UPDATE CASCADE
);


CREATE TABLE klant (
    id serial PRIMARY KEY,
    naam varchar(45) NOT NULL,
    email varchar(45),
    telefoon varchar(20),
    adres varchar(100)
);


CREATE TABLE project (
    id serial PRIMARY KEY,
    naam varchar(45) NOT NULL,
    beschrijving text DEFAULT '',
    prijs integer,
    klant_id integer,
    
    CONSTRAINT fk_klant_id
      FOREIGN KEY (klant_id)
      REFERENCES klant (id)
      ON DELETE RESTRICT
      ON UPDATE CASCADE
);


CREATE TABLE fase (
    id serial PRIMARY KEY,
    naam varchar(45) NOT NULL,
    beschrijving text DEFAULT '',
    project_id integer NOT NULL,
    
    CONSTRAINT fk_project_id
      FOREIGN KEY (project_id)
      REFERENCES project (id)
      ON DELETE CASCADE
      ON UPDATE CASCADE
);


CREATE TABLE taak (
    id serial PRIMARY KEY,
    naam varchar(45) NOT NULL,
    beschrijving text DEFAULT '',
    gedaan boolean DEFAULT false,
    fase_id integer NOT NULL,
    
    CONSTRAINT fk_fase_id
      FOREIGN KEY (fase_id)
      REFERENCES fase (id)
      ON DELETE CASCADE
      ON UPDATE CASCADE
);


CREATE TABLE rating (
    id serial PRIMARY KEY,
    score integer,
    comment text,
    datum timestamp NOT NULL,
    taak_id integer NOT NULL,
    klant_id integer,
    medewerker_id integer,
    
    CONSTRAINT fk_taak_id
      FOREIGN KEY (taak_id)
      REFERENCES taak (id)
      ON DELETE CASCADE
      ON UPDATE CASCADE,
    
    CONSTRAINT fk_klant_id
      FOREIGN KEY (klant_id)
      REFERENCES klant (id)
      ON DELETE RESTRICT
      ON UPDATE CASCADE,
    
    CONSTRAINT fk_medewerker_id
      FOREIGN KEY (medewerker_id)
      REFERENCES medewerker (id)
      ON DELETE CASCADE
      ON UPDATE CASCADE
);


CREATE TABLE locatie (
    naam varchar(45) PRIMARY KEY NOT NULL
);


CREATE TABLE uren (
    id serial PRIMARY KEY,
    van timestamp NOT NULL,
    tot timestamp,
    medewerker_id integer NOT NULL,
    taak_id integer NOT NULL,
    locatie_naam varchar(45),
    
    CONSTRAINT fk_medewerker_id
      FOREIGN KEY (medewerker_id)
      REFERENCES medewerker (id)
      ON DELETE CASCADE
      ON UPDATE CASCADE,
    
    CONSTRAINT fk_taak_id
      FOREIGN KEY (taak_id)
      REFERENCES taak (id)
      ON DELETE CASCADE
      ON UPDATE CASCADE,
    
    CONSTRAINT fk_locatie_naam
      FOREIGN KEY (locatie_naam)
      REFERENCES locatie (naam)
      ON DELETE RESTRICT
      ON UPDATE CASCADE
);


CREATE TABLE materiaal (
  id serial PRIMARY KEY,
  naam varchar(45) NOT NULL,
  prijs_per_stuk integer NOT NULL
);


CREATE TABLE verbruik (
  id serial PRIMARY KEY,
  materiaal_id integer NOt NULL,
  taak_id integer NOT NULL,
  
  CONSTRAINT fk_materiaal_id
    FOREIGN KEY (materiaal_id)
    REFERENCES materiaal (id)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  
  CONSTRAINT fk_taak_id
    FOREIGN KEY (taak_id)
    REFERENCES taak (id)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);
