/*
 DROP DATABASE progetto;
 CREATE DATABASE progetto;
 USE progetto;
 */

 -- 1)
 insert into Cliente(Codice, Tipo, IndirizzoPEC, Nome, Email, Via, NumCivico, Citta, CAP)
 	values('19245125', 'privato', null, 'Maurizio Verdi', null, null, null, null, null);

insert into TelefonoCliente(Numero, Cliente) values('3336933856', '19245125');

-- lo mettiamo NULL il valore Email dove c'è la PEC?
insert into Cliente(Codice, Tipo, IndirizzoPEC, Nome, Email, Via, NumCivico, Citta, CAP)
  values('00382520427', 'pa', 'protocollo@pec.univpm.it', 'Universita Politecnica delle Marche', 'protocollo@pec.univpm.it', 'Piazza Roma', '22', 'Ancona', 60121);

insert into TelefonoCliente(Numero, Cliente) values('0712201', '00382520427');

insert into Cliente(Codice, Tipo, IndirizzoPEC, Nome, Email, Via, NumCivico, Citta, CAP)
  values('00754150100', 'pa', 'protocollo@pec.unige.it', 'Universita degli studi di Genova', 'protocollo@pec.unige.it', 'Via Balbi', '5', 'Genova', 16126);

insert into TelefonoCliente(Numero, Cliente) values('01020991', '00754150100');


-- 2)
insert into RichiestaMEPA(Numero, CodicePA, OffertaProposta, LimiteSpesa, InizioOfferte, TermineOfferte)
	values(1776266, '00754150100', 2784.78, 2900, '2017-11-20', '2017-11-27');

insert into Gara(RichiestaMEPA, Aggiudicatario, OffertaVincitore)
	values(1776266, null, null);

-- 3)
insert into RichiestaMEPA(Numero, CodicePA, OffertaProposta, LimiteSpesa, InizioOfferte, TermineOfferte)
	values(274635, '84001850589', 1921.24, 2000, '2017-10-17', '2017-10-23');

insert into Trattativa(RichiestaMEPA, Stipulata)
	values(274635, null);

-- 5)
insert into Servizio(Codice, Tipologia, Costo)
  values ('1', 'Riparazione software', 50);
insert into Servizio(Codice, Tipologia, Costo)
  values ('2', 'Sostituzione componente', 30);

-- 6) non mi ricordo, per il destinatario usiamo il codice cliente o il nome cliente?
insert into Fattura(Codice, Emittente, Destinatario, Importo, Emissione, Scadenza, DataPagamento, Spedizione)
	values(null, 'Rimini Service', '00382520427', 2784.78, NOW(), adddate(NOW(), 30), null, null);

-- 10)
insert into ContrattoAssistenza(Codice, Importo, Cliente, Inizio, Termine, Fattura)
	values(null, 1600, '00382520427', '2018-01-15', '2018-07-15', null);

insert into ElencazioneAssistenza(Contratto, Servizio)
	values ((select MAX(Codice) from ContrattoAssistenza), '1');

insert into ElencazioneAssistenza(Contratto, Servizio)
	values ((select MAX(Codice) from ContrattoAssistenza), '2');

insert into Fattura(Codice, Emittente, Destinatario, Importo, Emissione, Scadenza, DataPagamento, Spedizione)
	values(null, 'Rimini Service', '00382520427', 1600, NOW(), adddate(NOW(), 30), null, null);

update ContrattoAssistenza
  set Fattura = (select MAX(Codice) from Fattura)
  order by Codice DESC limit 1;
