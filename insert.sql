INSERT INTO medewerker (id, naam, email, telefoon, adres, service_area_naam) VALUES 
  (1, 'Sipahi' ,      'JSipahi@gmail.com' ,       026867075, 'Duisburgsesteenweg 23' , 'Marketing'),
  (2, 'Vandervoort' , 'AVandervoortl@skynet.be' , 022872072, 'Langeweg 7' , 'Purchase'),
  (3, 'Trompet' ,     'Jtrompet@gmail.com' ,      024474472, 'Leuvensesteenweg 128' , 'Management'),
  (4, 'Dutoit' ,      'TDutoit@gmail.com' ,       025477752, 'Wingerstraat 17' , 'Management'),
  (5, 'Braine' ,      'ABraine@gmail.com' ,       025993242, 'Lindaal 11b' , 'Sales'),
  (6, 'Tastenhoye' ,  'KTastenhoye@gmail.com' ,   025111142, 'Bosweg 64' , 'Human Resources');
	
INSERT INTO service_area (naam, manager_id) VALUES 
('Marketing', 1),
('Sales', 2),
('Management', 3),
('Purchase', 4),
('Development', 5),
('Human Resources', 6);

INSERT INTO verlof (van, tot, betaald, goedgekeurd, mederwerker_id) VALUES
	('2007-10-31 10:00:00', '2007-11-1 10:00:00', true, 1),
('2007-09-18 10:00:00', '2008-07-20 10:00:00', true, 2),
('2005-02-12 10:00:00', '2005-04-18 10:00:00', false, 3);

INSERT INTO contract_type (naam) VALUES
	('aannemer'),
	('voltijds medewerker'),
	('halftijds medewerker'),
('onafhankelijk medewerker');


INSERT INTO contract (van, tot, uurloon, medewerker_id, contract_type_naam) VALUES
('2007-10-25 10:00:00', '2012-10-25 10:00:00', 11.49, 1, 'voltijds medewerker'),
('2007-09-18 10:00:00', '2015-07-20 10:00:00', 11.49, 2, 'voltijds medewerker'),
('2005-02-12 10:00:00', '2014-04-18 10:00:00', 10.49, 3, 'halftijds medewerker'),
('2004-06-09 10:00:00', '2012-05-19 10:00:00', 10.39, 4, 'onafhankelijk medewerker'),
('2008-12-01 10:00:00', '2018-09-15 10:00:00', 11.49, 5, 'voltijds medewerker');
		






INSERT INTO klant (id, naam, email, telefoon, adres) VALUES
	(1, 'Stevens', 'st@gmail.com', 026667596, 'Duisburgstraat 12'),
	(2, 'Vermeir', 'verm@hotmail.com', 027778465, 'Schavei 11'),
	(3, 'Nivel', 'n@gmail.com', 024888888, 'Nieuwstraat 45'),
	(4, 'Molenaer', 'molen@hotmail.com', 027777777, 'Moppenstraat 78'),
	(5, 'Trompet' , 'trompet@hotmail.com', 027874496, 'Motbroekstraat 14'),
	(6, 'Dubois' , 'dubois@gmail.com', 027444496, 'Motbroekstraat 10');

INSERT INTO project (id, naam, beschrijving, prijs, klant_id) VALUES
			(1, 'Project1', 999, 1),
			(2, 'Project2', 1999, 2),
(3, 'Project3', 2999, 3);

INSERT INTO fase (id, naam, beschrijving, project_id) VALUES
		(1, 'Project1', 'Project1 beschrijving', 1),
		(2, 'Project2', 'Project2 beschrijving', 2),
		(3, 'Project3', 'Project3 beschrijving', 3);

INSERT INTO taak (id, gedaan, naam, beschrijving, fase_id) VALUES
		(1, true, 'Project1_taak1', 'Taak1', 1),
		(2, true, 'Project1_taak2', 'Taak2', 1),
(3, true, 'Project2_taak1', 'Taak1', 2),
(4, false, 'Project2_taak2', 'Taak2', 2),
(5, false, 'Project3_taak1', 'Taak1', 3);

INSERT INTO rating (id, score, comment, datum, taak_id, klant_id, medewerker_id) VALUES
	(1, 8, 'Goed', '2009-08-12 10:00:00', 1, 4, 5),
		(2, 7, 'Goed', '2009-11-20 10:00:00', 2, 4, 3),
		(3, 9, 'Zeer goed', '2008-01-02 10:00:00', 3, 2, 2);

INSERT INTO locatie (naam) VALUES
	('zetel Leuven'),
	('zetel Brussel'),
	('zetel Arenberg'),
('zetel Zaventem');

INSERT INTO uren (van, tot, medewerker_id, taak_id) VALUES
	('2007-10-25 10:00:00', '2008-10-30 10:00:00', 1, 1),
('2007-10-25 10:00:00', '2007-10-30 10:00:00', 2, 1),
('2007-10-25 10:00:00', '2007-10-30 10:00:00', 3, 1),
('2009-10-25 10:00:00', '2009-10-30 10:00:00', 2, 1),
('2009-10-25 10:00:00', '2009-10-30 10:00:00', 3, 1);

	


