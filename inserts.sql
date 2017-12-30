/* insert per popolare le tabelle */
insert into Cliente(Codice, Tipo, IndirizzoPEC, Nome, Email, Via, NumCivico, Citta, CAP)
  values('4439089234', 'privato', null, 'Sergio Manenti', 'manentisergio@outlook.com', 'Via Gargano', 43, 'Rimini', 47924);
insert into TelefonoCliente(Numero, Cliente) values('3379494900', '4439089234');

insert into Cliente(Codice, Tipo, IndirizzoPEC, Nome, Email, Via, NumCivico, Citta, CAP)
  values('00356250529', 'pa', 'protocollo@comune.rimini.it', 'Comune di Rimini', 'protocollo@comune.rimini.it', 'Piazza Cavour', '5', 'Rimini', 47924);
insert into TelefonoCliente(Numero, Cliente) values('0541362293', '00356250529');


insert into RichiestaMEPA(Numero, CodicePA, OffertaProposta, LimiteSpesa, InizioOfferte, TermineOfferte)
	values(2174635, '00382520427', 683, 700, '2017-10-30', '2017-11-09');
insert into Trattativa(RichiestaMEPA, Stipulata)
	values(2174635, null);


insert into Fornitore(Codice, IndirizzoPEC, Nome, Email, Via, NumCivico, Citta, CAP)
  values('4499338742', null, 'Danilo Cappelli', 'danicap@hotmail.com', 'Via Flaminia', 91, 'Riccione', 47922);
insert into TelefonoFornitore(Numero, Fornitore) values('3340019246', '4499338742');

insert into Fornitore(Codice, IndirizzoPEC, Nome, Email, Via, NumCivico, Citta, CAP)
  values('6998521202', null, 'Mattia Santarini', 'santarini@famila.net', 'Viale Dante', 8, 'Rimini', 47923);
insert into TelefonoFornitore(Numero, Fornitore) values('3284839013', '6998521202');

insert into Fornitore(Codice, IndirizzoPEC, Nome, Email, Via, NumCivico, Citta, CAP)
  values('9105839357', null, 'Filippo Ferrari', 'filippo@ferraristore.it', 'Piazza Pertini', 39, 'Rimini', 47924);
insert into TelefonoFornitore(Numero, Fornitore) values('3382079421', '9105839357');


insert into CostoSpedizione(Costo, Tempo, PesoMax, SommaMisureMax)
  values(9, 5, 13, 83);
insert into CostoSpedizione(Costo, Tempo, PesoMax, SommaMisureMax)
  values(18, 5, 23, 109);
insert into CostoSpedizione(Costo, Tempo, PesoMax, SommaMisureMax)
  values(25, 8, 32, 209);

insert into ElencazioneCostiSpedizione(Fornitore, Costo)
  values('4499338742', 4);
insert into ElencazioneCostiSpedizione(Fornitore, Costo)
  values('4499338742', 5);
insert into ElencazioneCostiSpedizione(Fornitore, Costo)
  values('6998521202', 1);
insert into ElencazioneCostiSpedizione(Fornitore, Costo)
  values('6998521202', 2);
insert into ElencazioneCostiSpedizione(Fornitore, Costo)
  values('6998521202', 6);
insert into ElencazioneCostiSpedizione(Fornitore, Costo)
  values('9105839357', 2);
insert into ElencazioneCostiSpedizione(Fornitore, Costo)
  values('9105839357', 4);


/* notebook */
insert into ProdottoServizio(Codice) values ('DK.303.RL');
insert into Prodotto(Codice, Produttore, Modello, Peso, Dimensioni)
  values('DK.303.RL', 'Acer', 'Ultrabook 13', 1.5, '27x24x3');
insert into Notebook(Codice, Processore, RAM, Storage, Schermo, SistemaOperativo)
  values('DK.303.RL', 'Intel Core i7', 8, 256, 13.3, 'Windows 10');
/* notebook */
insert into ProdottoServizio(Codice) values ('VTY506583');
insert into Prodotto(Codice, Produttore, Modello, Peso, Dimensioni)
  values('VTY506583', 'Lenovo', 'Thinkpad 15', 2.4, '34x28x5');
insert into Notebook(Codice, Processore, RAM, Storage, Schermo, SistemaOperativo)
  values('VTY506583', 'Intel Core i5', 4, 250, 15.6, 'Linux');


/* monitor */
insert into ProdottoServizio(Codice) values ('LED2384');
insert into Prodotto(Codice, Produttore, Modello, Peso, Dimensioni)
  values('LED2384', 'Asus', 'Monitor LED 24"', 2.2, '45x33x4');
insert into Monitor(Codice, Dimensione, Risoluzione)
  values('LED2384', 23.6, '1920x1200');
/* monitor */
insert into ProdottoServizio(Codice) values ('NVDGI');
insert into Prodotto(Codice, Produttore, Modello, Peso, Dimensioni)
  values('NVDGI', 'HP', 'Lightscreen 27', 3.5, '58x41x4');
insert into Monitor(Codice, Dimensione, Risoluzione)
  values('NVDGI', 27.2, '2560x1600');

/* pc desktop */
insert into ProdottoServizio(Codice) values ('E65TY03');
insert into Prodotto(Codice, Produttore, Modello, Peso, Dimensioni)
  values('E65TY03', 'HP', 'Compaq Desktop E65TY03', 4.5, '63x31x57');
insert into PCDesktop(Codice, Processore, RAM, Storage, SistemaOperativo)
  values('E65TY03', 'Intel Core i3', 4, 500, 'Windows 10');
/* pc desktop */
insert into ProdottoServizio(Codice) values ('NIX8080');
insert into Prodotto(Codice, Produttore, Modello, Peso, Dimensioni)
  values('NIX8080', 'Nilox', 'TowerPC', 4.3, '57x28x53');
insert into PCDesktop(Codice, Processore, RAM, Storage, SistemaOperativo)
  values('NIX8080', 'Intel Core i5', 8, 512, 'Free Dos');


/* stampante */
insert into ProdottoServizio(Codice) values ('EPS6792');
insert into Prodotto(Codice, Produttore, Modello, Peso, Dimensioni)
  values('EPS6792', 'Epson', 'Fotocopiatrice 6792', 14, '57x28x53');
insert into Stampante(Codice, Tecnologia, FormatoMax, Velocita, Connettivita)
  values('EPS6792', 'Inkjet', 'A4', 21, 'WiFi');
/* stampante */
insert into ProdottoServizio(Codice) values ('C405N3');
insert into Prodotto(Codice, Produttore, Modello, Peso, Dimensioni)
  values('C405N3', 'Canon', 'Canon C405N3', 17, '41x48x41');
insert into Stampante(Codice, Tecnologia, FormatoMax, Velocita, Connettivita)
  values('C405N3', 'Laser', 'A4', 27, 'USB');
/* stampante */
insert into ProdottoServizio(Codice) values ('MFC-9140CDN');
insert into Prodotto(Codice, Produttore, Modello, Peso, Dimensioni)
  values('MFC-9140CDN', 'Brother', 'Brother MFC-9140CDN', 23, '38x49x44');
insert into Stampante(Codice, Tecnologia, FormatoMax, Velocita, Connettivita)
  values('MFC-9140CDN', 'Inkjet', 'A4', 23, 'WiFi');


insert into ProdottoServizio(Codice) values ('003');
insert into Servizio(Codice, Tipologia, Costo)
  values('003', 'Configurazione programma', 40);
insert into ProdottoServizio(Codice) values ('004');
insert into Servizio(Codice, Tipologia, Costo)
  values('004', 'Formattazione pc', 60);
insert into ProdottoServizio(Codice) values ('005');
insert into Servizio(Codice, Tipologia, Costo)
  values('005', 'Installazione rete WiFi', 90);


insert into Fattura(Codice, Emittente, Destinatario, Importo, Emissione, Scadenza, DataPagamento, Spedizione)
  values(null, 'Rimini Service', '00382520427', 1100, NOW(), adddate(NOW(), 30), null, null);
insert into ContrattoAssistenza(Codice, Importo, Cliente, Inizio, Termine, Fattura)
	values(null, 1100, '00382520427', '2018-07-16', '2018-10-15', (select max(Codice) from Fattura));
insert into ElencazioneAssistenza(Contratto, Servizio)
	values((select max(Codice) from ContrattoAssistenza), '001');

insert into Fattura(Codice, Emittente, Destinatario, Importo, Emissione, Scadenza, DataPagamento, Spedizione)
  values(null, 'Rimini Service', '00754150100', 1420, NOW(), adddate(NOW(), 30), null, null);
insert into ContrattoAssistenza(Codice, Importo, Cliente, Inizio, Termine, Fattura)
	values(null, 1420, '00754150100', '2018-03-15', '2018-09-15', (select max(Codice) from Fattura));
insert into ElencazioneAssistenza(Contratto, Servizio)
	values((select max(Codice) from ContrattoAssistenza), '002');
insert into ElencazioneAssistenza(Contratto, Servizio)
	values((select max(Codice) from ContrattoAssistenza), '003');

insert into Fattura(Codice, Emittente, Destinatario, Importo, Emissione, Scadenza, DataPagamento, Spedizione)
  values(null, 'Rimini Services', '00356250529', 900, NOW(), adddate(NOW(), 30), null, null);
insert into ContrattoAssistenza(Codice, Importo, Cliente, Inizio, Termine, Fattura)
	values(null, 900, '00356250529', '2018-02-10', '2018-06-10', (select max(Codice) from Fattura));
insert into ElencazioneAssistenza(Contratto, Servizio)
	values((select max(Codice) from ContrattoAssistenza), '001');



insert into Catalogo(Fornitore, Prodotto, Prezzo, InizioValidita, FineValidita)
  values('4499338742', '24M38A', 140, '2017-12-01', '2017-12-31');
insert into Catalogo(Fornitore, Prodotto, Prezzo, InizioValidita, FineValidita)
  values('1924512551', '24M38A', 135, '2017-12-01', '2017-12-31');
insert into Catalogo(Fornitore, Prodotto, Prezzo, InizioValidita, FineValidita)
  values('4499338742', 'DK.303.RL', 877, '2017-12-01', '2017-12-31');
insert into Catalogo(Fornitore, Prodotto, Prezzo, InizioValidita, FineValidita)
  values('6998521202', 'DK.303.RL', 889, '2017-12-01', '2017-12-31');
insert into Catalogo(Fornitore, Prodotto, Prezzo, InizioValidita, FineValidita)
  values('9105839357', 'C405N3', 98, '2017-12-01', '2017-12-31');
insert into Catalogo(Fornitore, Prodotto, Prezzo, InizioValidita, FineValidita)
  values('9105839357', 'E65TY03', 113.47, '2017-12-01', '2017-12-31');
insert into Catalogo(Fornitore, Prodotto, Prezzo, InizioValidita, FineValidita)
  values('1924512551', 'EPS6792', 131, '2017-12-01', '2017-12-31');
insert into Catalogo(Fornitore, Prodotto, Prezzo, InizioValidita, FineValidita)
  values('1924512551', 'MFC-9140CDN', 88, '2017-12-01', '2017-12-31');
insert into Catalogo(Fornitore, Prodotto, Prezzo, InizioValidita, FineValidita)
  values('6998521202', 'NIX8080', 361.58, '2017-12-01', '2017-12-31');
insert into Catalogo(Fornitore, Prodotto, Prezzo, InizioValidita, FineValidita)
  values('9105839357', 'NVDGI', 187.14, '2017-12-01', '2017-12-31');
insert into Catalogo(Fornitore, Prodotto, Prezzo, InizioValidita, FineValidita)
  values('1924512551', 'VC65R-G026Z', 478.96, '2017-12-01', '2017-12-31');
insert into Catalogo(Fornitore, Prodotto, Prezzo, InizioValidita, FineValidita)
  values('4499338742', 'VTY506583', 634, '2017-12-01', '2017-12-31');


insert into DescrizioneRichiesta(RichiestaMEPA, ProdottoServizio, Quantita)
  values(92148, 'EPS6792', 2);
insert into DescrizioneRichiesta(RichiestaMEPA, ProdottoServizio, Quantita)
  values(92148, 'LED2384', 3);
insert into DescrizioneRichiesta(RichiestaMEPA, ProdottoServizio, Quantita)
  values(274635, 'NIX8080', 4);
insert into DescrizioneRichiesta(RichiestaMEPA, ProdottoServizio, Quantita)
  values(1776266, 'MF839T/A', 1);
insert into DescrizioneRichiesta(RichiestaMEPA, ProdottoServizio, Quantita)
  values(2174635, 'VC65R-G026Z', 2);
insert into DescrizioneRichiesta(RichiestaMEPA, ProdottoServizio, Quantita)
  values(8421935, '24M38A', 2);
insert into DescrizioneRichiesta(RichiestaMEPA, ProdottoServizio, Quantita)
  values(94432633, 'DK.303.RL', 3);


/* acquisto prodotto */
insert into Fattura(Codice, Emittente, Destinatario, Importo, Emissione, Scadenza, DataPagamento, Spedizione)
	values(null, '4499338742', 'Rimini Service', null, NOW(), adddate(NOW(), 30), null, null);
insert into Acquisto(Fattura, Prodotto, Quantita)
  values((select max(Codice) from Fattura), '24M38A', 2);

update Fattura
  set Importo = (
    select sum(Quantita*Prezzo)
      from (select min(Prezzo) as Prezzo, Fornitore
      	from Catalogo
      	where Prodotto = '24M38A' and InizioValidita < NOW() and FineValidita > NOW()
      	group by Fornitore
      ) as PrezzoVendita, Acquisto
      where Acquisto.Fattura = (select max(Fattura) from Acquisto) and Acquisto.Prodotto = '24M38A'
  ),
  Spedizione = (
    select Codice
      from CostoSpedizione, ElencazioneCostiSpedizione
      where (select Peso
          from Prodotto
          where Codice = '24M38A') <= PesoMax
      and (select
        (select SUBSTRING_INDEX(Dimensioni, 'x', 1) from Prodotto where Codice = '24M38A') +
        (select SUBSTRING_INDEX(SUBSTRING_INDEX(Dimensioni, 'x', 2), 'x', 1) from Prodotto where Codice = '24M38A') +
        (select SUBSTRING_INDEX(Dimensioni, 'x', -1) from Prodotto where Codice = '24M38A')
        ) <= SommaMisureMax
      and ElencazioneCostiSpedizione.Fornitore = Fattura.Emittente
    	order by CostoSpedizione.Costo limit 1
  )
  order by Codice DESC limit 1;

/* acquisto prodotto */
insert into Fattura(Codice, Emittente, Destinatario, Importo, Emissione, Scadenza, DataPagamento, Spedizione)
	values(null, '6998521202', 'Rimini Service', null, NOW(), adddate(NOW(), 30), null, null);
insert into Acquisto(Fattura, Prodotto, Quantita)
  values((select max(Codice) from Fattura), 'NIX8080', 4);

update Fattura
  set Importo = (
    select sum(Quantita*Prezzo)
      from (select min(Prezzo) as Prezzo, Fornitore
      	from Catalogo
      	where Prodotto = 'NIX8080' and InizioValidita < NOW() and FineValidita > NOW()
      	group by Fornitore
      ) as PrezzoVendita, Acquisto
      where Acquisto.Fattura = (select max(Fattura) from Acquisto) and Acquisto.Prodotto = 'NIX8080'
  ),
  Spedizione = (
    select Codice
      from CostoSpedizione, ElencazioneCostiSpedizione
      where (select Peso
          from Prodotto
          where Codice = 'NIX8080') <= PesoMax
      and (select
        (select SUBSTRING_INDEX(Dimensioni, 'x', 1) from Prodotto where Codice = 'NIX8080') +
        (select SUBSTRING_INDEX(SUBSTRING_INDEX(Dimensioni, 'x', 2), 'x', 1) from Prodotto where Codice = 'NIX8080') +
        (select SUBSTRING_INDEX(Dimensioni, 'x', -1) from Prodotto where Codice = 'NIX8080')
        ) <= SommaMisureMax
      and ElencazioneCostiSpedizione.Fornitore = Fattura.Emittente
    	order by CostoSpedizione.Costo limit 1
  )
  order by Codice DESC limit 1;


insert into Fattura(Codice, Emittente, Destinatario, Importo, Emissione, Scadenza, DataPagamento, Spedizione)
	values(null, '6998521202', 'Rimini Service', null, NOW(), adddate(NOW(), 30), null, null);
insert into Acquisto(Fattura, Prodotto, Quantita)
  values((select max(Codice) from Fattura), 'DK.303.RL', 3);

update Fattura
  set Importo = (
    select sum(Quantita*Prezzo)
      from (select min(Prezzo) as Prezzo, Fornitore
      	from Catalogo
      	where Prodotto = 'DK.303.RL' and InizioValidita < NOW() and FineValidita > NOW()
      	group by Fornitore
      ) as PrezzoVendita, Acquisto
      where Acquisto.Fattura = (select max(Fattura) from Acquisto) and Acquisto.Prodotto = 'DK.303.RL'
  ),
  Spedizione = (
    select Codice
      from CostoSpedizione, ElencazioneCostiSpedizione
      where (select Peso
          from Prodotto
          where Codice = 'DK.303.RL') <= PesoMax
      and (select
        (select SUBSTRING_INDEX(Dimensioni, 'x', 1) from Prodotto where Codice = 'DK.303.RL') +
        (select SUBSTRING_INDEX(SUBSTRING_INDEX(Dimensioni, 'x', 2), 'x', 1) from Prodotto where Codice = 'DK.303.RL') +
        (select SUBSTRING_INDEX(Dimensioni, 'x', -1) from Prodotto where Codice = 'DK.303.RL')
        ) <= SommaMisureMax
      and ElencazioneCostiSpedizione.Fornitore = Fattura.Emittente
    	order by CostoSpedizione.Costo limit 1
  )
  order by Codice DESC limit 1;


/* vendita prodotto */
insert into Fattura(Codice, Emittente, Destinatario, Importo, Emissione, Scadenza, DataPagamento, Spedizione)
	values(null, 'Rimini Service', '8421935', null, NOW(), adddate(NOW(), 30), null, null);
insert into Vendita(Fattura, ProdottoServizio, Quantita)
  values((select max(Codice) from Fattura), '24M38A', 2);

update Fattura
  set Importo = (
    select sum(Quantita*Prezzo*1.1)
      from (select min(Prezzo) as Prezzo, Fornitore
      	from Catalogo
      	where Prodotto = '24M38A' and InizioValidita < NOW() and FineValidita > NOW()
      	group by Fornitore
      ) as PrezzoVendita, Vendita
      where Vendita.Fattura = (select max(Fattura) from Vendita) and Vendita.ProdottoServizio = '24M38A'
  )
  order by Codice DESC limit 1;
/* vendita prodotto */
insert into Fattura(Codice, Emittente, Destinatario, Importo, Emissione, Scadenza, DataPagamento, Spedizione)
	values(null, 'Rimini Service', '274635', null, NOW(), adddate(NOW(), 30), null, null);
insert into Vendita(Fattura, ProdottoServizio, Quantita)
  values((select max(Codice) from Fattura), 'NIX8080', 4);

update Fattura
  set Importo = (
    select sum(Quantita*Prezzo*1.1)
      from (select min(Prezzo) as Prezzo, Fornitore
      	from Catalogo
      	where Prodotto = 'NIX8080' and InizioValidita < NOW() and FineValidita > NOW()
      	group by Fornitore
      ) as PrezzoVendita, Vendita
      where Vendita.Fattura = (select max(Fattura) from Vendita) and Vendita.ProdottoServizio = 'NIX8080'
  )
  order by Codice DESC limit 1;
/* vendita prodotto */
insert into Fattura(Codice, Emittente, Destinatario, Importo, Emissione, Scadenza, DataPagamento, Spedizione)
	values(null, 'Rimini Service', '94432633', null, NOW(), adddate(NOW(), 30), null, null);
insert into Vendita(Fattura, ProdottoServizio, Quantita)
  values((select max(Codice) from Fattura), 'DK.303.RL', 3);

update Fattura
  set Importo = (
    select sum(Quantita*Prezzo*1.1)
      from (select min(Prezzo) as Prezzo, Fornitore
      	from Catalogo
      	where Prodotto = 'DK.303.RL' and InizioValidita < NOW() and FineValidita > NOW()
      	group by Fornitore
      ) as PrezzoVendita, Vendita
      where Vendita.Fattura = (select max(Fattura) from Vendita) and Vendita.ProdottoServizio = 'DK.303.RL'
  )
  order by Codice DESC limit 1;
