CREATE TABLE medewerker (
    id SERIAL PRIMARY KEY,
    naam varchar(20) NOT NULL,
    email varchar(30),
    telefoon varchar(15),
    adres varchar(50)
);

CREATE TABLE uren (
    id SERIAL PRIMARY KEY,
    van TIMESTAMP NOT NULL,
    tot TIMESTAMP NOT NULL
);

CREATE TABLE verlof (
    id SERIAL PRIMARY KEY,
    van TIMESTAMP NOT NULL,
    tot TIMESTAMP NOT NULL,
    betaald BOOLEAN NOT NULL,
    goedgekeurd BOOLEAN DEFAULT false
);

CREATE TABLE contract (
    van TIMESTAMP NOT NULL,
    tot TIMESTAMP NOT NULL,
    uurloon smallint NOT NULL
);

CREATE TABLE contract_type (
    naam varchar(20) NOT NULL
);

CREATE TABLE locatie (
    naam varchar(20) NOT NULL
);

CREATE TABLE service_area (
    naam varchar(20) NOT NULL
);

CREATE TABLE taak (
    gedaan BOOLEAN NOT NULL,
    naam varchar(20) NOT NULL,
    beschrijving text DEFAULT ''
);

CREATE TABLE fase (
    naam varchar(20) NOT NULL,
    beschrijving text DEFAULT ''
);

CREATE TABLE fase_type (
    naam varchar(20) NOT NULL,
    beschrijving text DEFAULT ''
);

CREATE TABLE project (
    naam varchar(20) NOT NULL,
    beschrijving text DEFAULT ''
);

CREATE TABLE project (
    naam varchar(20) NOT NULL,
    beschrijving text DEFAULT '',
    prijs INT,
    intern BOOLEAN DEFAULT false
);

CREATE TABLE rating (
    score INT,
    comment TEXT,
    datum TIMESTAMP
);

CREATE TABLE klant (
    id SERIAL PRIMARY KEY,
    naam varchar(20) NOT NULL,
    email varchar(30),
    telefoon varchar(15),
    adres varchar(50)
);

CREATE TABLE verbruik (
    aantal INT NOT NULL
);

CREATE TABLE materiaal (
    naam varchar(20) NOT NULL,
    prijs INT NOT NULL
);