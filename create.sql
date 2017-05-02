CREATE TABLE medewerkers (
    id SERIAL PRIMARY KEY,
    naam varchar(20) NOT NULL,
    email varchar(30),
    telefoon varchar(15),
    adres varchar(50)
)