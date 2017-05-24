/*
 *  MEDEWERKERS
 */
 

-- Per medewerker: van wanneer tot wanneer gewerkt --
SELECT van, tot
FROM uren
WHERE medewerker_id = 1;


-- Lopend contract van een medewerker --
SELECT contract.uurloon, contract_type.naam
FROM contract
INNER JOIN contract_type ON contract.contract_type_naam = contract_type.naam
WHERE medewerker_id = 5 AND van <= LOCALTIMESTAMP AND LOCALTIMESTAMP <= tot;


-- Verlofdagen van een medewerker voor dit jaar --
SELECT van, tot, goedgekeurd, betaald
FROM verlof
WHERE medewerker_id = 1 AND
      EXTRACT(YEAR FROM van) <= EXTRACT(YEAR FROM CURRENT_DATE) AND
      EXTRACT(YEAR FROM tot) >= EXTRACT(YEAR FROM CURRENT_DATE);


-- Favoriete locatie van een medewerker --
SELECT locatie_naam, SUM(tot - van) AS duur
FROM uren
WHERE medewerker_id = 1 AND locatie_naam IS NOT NULL
GROUP BY locatie_naam
ORDER BY SUM(tot - van) DESC
LIMIT 1;


-- Uren gewerkt per medewerker, per locatie --
SELECT medewerker.naam, uren.locatie_naam, SUM(uren.tot - uren.van) AS duur
FROM medewerker
INNER JOIN uren ON uren.medewerker_id = medewerker.id
GROUP BY medewerker.id, uren.locatie_naam
HAVING locatie_naam IS NOT NULL;



/*
 * SERVICE AREA'S
 */


-- Medewerkers per service area --
SELECT naam, email, telefoon, adres
FROM medewerker
WHERE service_area_naam = 'Marketing';


-- Manager van een service area --
SELECT medewerker.naam, email, telefoon, adres
FROM service_area
INNER JOIN medewerker ON medewerker.id = service_area.manager_id
WHERE service_area.naam = 'Marketing';



/*
 * PROJECTEN
 */

-- Lijst van fases van een project --
SELECT naam, beschrijving
FROM fase
WHERE project_id = 1;


-- Lijst van taken van een project --
SELECT taak.naam, taak.beschrijving, taak.gedaan, fase.naam, fase.beschrijving
FROM taak
INNER JOIN fase ON fase.id = taak.fase_id
WHERE fase.project_id = 1;


/*
 * TAKEN
 */


-- Ratings / comments van een taak --
SELECT klant_id, medewerker_id, score, comment, taak_id
FROM rating
WHERE taak_id = 1;


-- Factuur voor gewerkte uren aan taak --
SELECT medewerker.naam, uren.van, uren.tot, (uren.tot - uren.van) AS duur, contract.uurloon,
  contract.uurloon * (EXTRACT(epoch FROM (uren.tot - uren.van))/3600) AS totaal
FROM uren
INNER JOIN medewerker ON medewerker.id = uren.medewerker_id
INNER JOIN contract ON contract.id = uren.medewerker_id
WHERE uren.taak_id = 1 AND contract.van <= uren.van AND uren.van <= contract.tot;


-- Totale uren gewerkt aan taak --
SELECT SUM(uren.tot - uren.van) AS tijd
FROM uren
WHERE taak_id = 1;


-- Materiaal verbruikt bij taak --
SELECT verbruik.aantal, materiaal.naam, materiaal.prijs_per_stuk,
  materiaal.prijs_per_stuk * verbruik.aantal AS totaal
FROM verbruik
INNER JOIN materiaal ON materiaal.id = verbruik.materiaal_id
WHERE taak_id = 3;


-- Totale prijs taak --
SELECT kost_manuren.totaal + kost_materiaal.totaal AS totaal
FROM (
  SELECT SUM(contract.uurloon * (EXTRACT(epoch FROM (uren.tot - uren.van))/3600)) AS totaal
  FROM uren
  INNER JOIN medewerker ON medewerker.id = uren.medewerker_id
  INNER JOIN contract ON contract.id = uren.medewerker_id
  WHERE uren.taak_id = 3 AND contract.van <= uren.van AND uren.van <= contract.tot
) AS kost_manuren, (
  SELECT SUM(materiaal.prijs_per_stuk * verbruik.aantal) AS totaal
  FROM verbruik
  INNER JOIN materiaal ON materiaal.id = verbruik.materiaal_id
  WHERE taak_id = 3
) AS kost_materiaal;