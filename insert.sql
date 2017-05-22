-- Explicit IDs for easier insertion of related records --


INSERT INTO medewerker (id, naam, email, telefoon, adres) VALUES 
  (1, 'Sipahi',      'JSipahi@gmail.com',       '+3226867075',  'Duisburgsesteenweg 23'),
  (2, 'Vandervoort', 'AVandervoortl@skynet.be', '005622872072', 'Langeweg 7'),
  (3, 'Trompet',     'Jtrompet@gmail.com',      '024474472',    'Leuvensesteenweg 128'),
  (4, 'Dutoit',      'TDutoit@gmail.com',       '+3325477752',  'Wingerstraat 17'),
  (5, 'Braine',      'ABraine@gmail.com',       '+3225993242',  'Lindaal 11b'),
  (6, 'Tastenhoye',  'KTastenhoye@gmail.com',   '+3225111142',  'Bosweg 64');
	
  
INSERT INTO service_area (manager_id, naam) VALUES 
  (1, 'Marketing'),
  (2, 'Sales'),
  (3, 'Management'),
  (4, 'Purchase'),
  (5, 'Development'),
  (6, 'Human Resources');


UPDATE medewerker SET service_area_naam = 'Marketing'  WHERE id = 1;
UPDATE medewerker SET service_area_naam = 'Management' WHERE id = 2;


INSERT INTO verlof (van, tot, betaald, goedgekeurd, medewerker_id) VALUES
	('2007-10-31 10:00:00', '2007-11-1 10:00:00',  true,  false,  1),
  ('2007-09-18 10:00:00', '2008-07-20 10:00:00', true,  true,   2),
  ('2005-02-12 10:00:00', '2005-04-18 10:00:00', false, true,   3);


INSERT INTO contract_type (naam) VALUES
	('Aannemer'),
	('Voltijds medewerker'),
	('Halftijds medewerker'),
  ('Onafhankelijk medewerker');


INSERT INTO contract (van, tot, uurloon, medewerker_id, contract_type_naam) VALUES
  ('2007-10-25 10:00:00', '2012-10-25 10:00:00', 11.49, 1, 'Voltijds medewerker'),
  ('2007-09-18 10:00:00', '2015-07-20 10:00:00', 11.49, 2, 'Voltijds medewerker'),
  ('2005-02-12 10:00:00', '2014-04-18 10:00:00', 10.49, 3, 'Halftijds medewerker'),
  ('2004-06-09 10:00:00', '2012-05-19 10:00:00', 10.39, 4, 'Onafhankelijk medewerker'),
  ('2008-12-01 10:00:00', '2018-09-15 10:00:00', 11.49, 5, 'Voltijds medewerker');
  

INSERT INTO klant (id, naam, email, telefoon, adres) VALUES
	(1, 'Stevens',  'st@gmail.com',        '026667596', 'Duisburgstraat 12'),
	(2, 'Vermeir',  'verm@hotmail.com',    '027778465', 'Schavei 11'),
	(3, 'Nivel',    'n@gmail.com',         '024888888', 'Nieuwstraat 45'),
	(4, 'Molenaer', 'molen@hotmail.com',   '027777777', 'Moppenstraat 78'),
	(5, 'Trompet' , 'trompet@hotmail.com', '027874496', 'Motbroekstraat 14'),
	(6, 'Dubois' ,  'dubois@gmail.com',    '027444496', 'Motbroekstraat 10');


INSERT INTO project (id, naam, beschrijving, prijs, klant_id) VALUES
  (1, 'Project 1', 'Een project voor Stevens', 999.5,     1),
  (2, 'Project 2', 'Een ander project',        1999,      2),
  (3, 'Project 3', 'Intern project',           1570599,   NULL);


INSERT INTO fase (id, naam, beschrijving, project_id) VALUES
  (1, 'Fase 1', 'Fase 1 van project 1',                                     1),
  (2, 'Fase 2', 'Fase 2 van Stevens-project\nHier wordt niet veel gedaan.', 1),
  (3, 'Start',   NULL,                                                      2),
  (4, 'Default', NULL,                                                      3);


INSERT INTO taak (id, gedaan, naam, beschrijving, fase_id) VALUES
	(1, true,  'Taak 1',    'Project 1 Fase 1 Taak 1', 1),
	(2, true,  'Taak 2',    'Project 1 Fase 1 Taak 2', 1),
  (3, true,  'Evaluatie', 'Project 1 Fase 2 Taak 1', 2),
  (4, false, 'Taak 3',    'Project 1 Fase 2 Taak 2', 2),
  (5, false, 'Start',     NULL,                      3),
  (6, true,  'Antivirus', 'Installatie Avast',       4);


INSERT INTO rating (score, comment, datum, taak_id, klant_id, medewerker_id) VALUES
	(8,    'Goed',                 '2009-08-12 10:00:00', 1, 4,    NULL),
	(7,    NULL,                   '2009-11-20 10:00:00', 2, 4,    NULL),
	(NULL, 'Er was een probleem.', '2008-01-02 10:00:00', 3, NULL, 2);


INSERT INTO locatie (naam) VALUES
	('Zetel Leuven'),
	('Zetel Brussel'),
	('Zetel Arenberg'),
  ('Zetel Zaventem'),
  ('Home Office');


INSERT INTO uren (van, tot, medewerker_id, taak_id, locatie_naam) VALUES
	('2007-10-25 10:00:00', '2007-10-25 12:00:00', 1, 1, NULL),
  ('2007-10-25 13:00:00', '2007-10-25 18:00:00', 1, 1, 'Zetel Brussel'),
  ('2007-10-25 10:00:00', '2007-10-25 17:00:00', 3, 2, 'Zetel Brussel'),
  ('2009-08-01 09:00:00', '2009-08-01 12:30:00', 2, 3, 'Home Office'),
  ('2009-10-25 10:00:00', '2009-10-25 11:00:00', 3, 4, 'Home Office');


INSERT INTO materiaal (id, naam, prijs_per_stuk) VALUES 
	(1, 'MacBook Pro 15"', 2499.5),
  (2, 'Microsoft Office Licentie', 120),
  (3, 'Avast Free Antivirus', 0);


INSERT INTO verbruik (aantal, materiaal_id, taak_id) VALUES
  (5, 1, 2),
  (145, 2, 3),
  (145, 3, 4),
  (1, 3, 6);


