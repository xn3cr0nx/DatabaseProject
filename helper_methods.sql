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

insert into RichiestaMEPA(Numero, CodicePA, OffertaProposta, LimiteSpesa, InizioOfferte, TermineOfferte)
	values(8421935, '00754150100', 1284.89, 1300, '2017-12-10', '2017-12-22');
insert into Gara(RichiestaMEPA, Aggiudicatario, OffertaVincitore)
	values(8421935, null, null);

insert into RichiestaMEPA(Numero, CodicePA, OffertaProposta, LimiteSpesa, InizioOfferte, TermineOfferte)
	values(94432633, '00754150100', 1700, 1800, '2017-12-10', '2017-12-22');
insert into Gara(RichiestaMEPA, Aggiudicatario, OffertaVincitore)
	values(94432633, null, null);

-- 3)
insert into RichiestaMEPA(Numero, CodicePA, OffertaProposta, LimiteSpesa, InizioOfferte, TermineOfferte)
	values(274635, '00382520427', 1921.24, 2000, '2017-10-17', '2017-10-23');
insert into Trattativa(RichiestaMEPA, Stipulata)
	values(274635, null);

insert into RichiestaMEPA(Numero, CodicePA, OffertaProposta, LimiteSpesa, InizioOfferte, TermineOfferte)
	values(92148, '00382520427', 3201, 3250, '2017-11-17', '2017-11-23');
insert into Trattativa(RichiestaMEPA, Stipulata)
	values(92148, null);

-- 4)
/* notebook */
insert into ProdottoServizio(Codice) values ('MF839T/A');
insert into Prodotto(Codice, Produttore, Modello, Peso, Dimensioni)
  values('MF839T/A', 'Apple', 'Macbook Pro 13', 1.3, '28x22x3');
insert into Notebook(Codice, Processore, RAM, Storage, Schermo, SistemaOperativo)
  values('MF839T/A', 'Intel Core i5', 8, 128, 13.3, 'Mac OS X');

/* monitor */
insert into ProdottoServizio(Codice) values ('24M38A');
insert into Prodotto(Codice, Produttore, Modello, Peso, Dimensioni)
  values('24M38A', 'LG', 'Monitor LED 24"', 2.7, '46x34x4');
insert into Monitor(Codice, Dimensione, Risoluzione)
  values('24M38A', 23.6, '1920x1080');

/* pc desktop */
insert into ProdottoServizio(Codice) values ('VC65R-G026Z');
insert into Prodotto(Codice, Produttore, Modello, Peso, Dimensioni)
  values('VC65R-G026Z', 'Asus', 'VivoPC VC65R-G026Z', 3.8, '52x24x48');
insert into PCDesktop(Codice, Processore, RAM, Storage, SistemaOperativo)
  values('VC65R-G026Z', 'Intel Core i5', 8, 1000, 'Windows 10');

-- 5)
insert into ProdottoServizio(Codice) values ('1');
insert into Servizio(Codice, Tipologia, Costo)
  values('1', 'Riparazione software', 50);

insert into ProdottoServizio(Codice) values ('2');
insert into Servizio(Codice, Tipologia, Costo)
  values('2', 'Sostituzione componente', 30);

-- 6)
insert into Fattura(Codice, Emittente, Destinatario, Importo, Emissione, Scadenza, DataPagamento, Spedizione)
	values(null, 'Rimini Service', '00382520427', 2784.78, NOW(), adddate(NOW(), 30), null, null);

-- 7)
insert into Fornitore(Codice, IndirizzoPEC, Nome, Email, Via, NumCivico, Citta, CAP)
  values('1924512551', null, 'Marcello Sordi', null, null, null, null, null);

-- 8)
insert into Catalogo(Fornitore, Prodotto, Prezzo, InizioValidita, FineValidita)
  values('1924512551', 'MF839T/A', 1300, '2017-12-01', '2017-12-31');

-- 6)
/* vendita prodotto */
insert into Fattura(Codice, Emittente, Destinatario, Importo, Emissione, Scadenza, DataPagamento, Spedizione)
	values(null, 'Rimini Service', '19245125', null, NOW(), adddate(NOW(), 30), null, null);
insert into Vendita(Fattura, ProdottoServizio, Quantita)
  values((select max(Codice) from Fattura), 'MF839T/A', 2);

update Fattura
  set Importo = (
    select sum(Quantita*Prezzo*1.1)
      from (select min(Prezzo) as Prezzo, Fornitore
      	from Catalogo
      	where Prodotto = 'MF839T/A' and InizioValidita < NOW() and FineValidita > NOW()
      	group by Fornitore
      ) as PrezzoVendita, Vendita
      where Vendita.Fattura = (select max(Fattura) from Vendita) and Vendita.ProdottoServizio = 'MF839T/A'
  )
  order by Codice DESC limit 1;

-- 10)
insert into Fattura(Codice, Emittente, Destinatario, Importo, Emissione, Scadenza, DataPagamento, Spedizione)
  values(null, 'Rimini Service', '00382520427', 1600, NOW(), adddate(NOW(), 30), null, null);

insert into ContrattoAssistenza(Codice, Importo, Cliente, Inizio, Termine, Fattura)
	values(null, 1600, '00382520427', '2018-01-15', '2018-07-15', (select max(Codice) from Fattura));

insert into ElencazioneAssistenza(Contratto, Servizio)
	values((select max(Codice) from ContrattoAssistenza), '1');

insert into ElencazioneAssistenza(Contratto, Servizio)
	values((select max(Codice) from ContrattoAssistenza), '2');

-- 11)
update Gara set Aggiudicatario = 'Rimini Service', OffertaVincitore = 2784.78
	where RichiestaMEPA = 1776266;

update Gara set Aggiudicatario = 'Zucchetti srl', OffertaVincitore = 1126
	where RichiestaMEPA = 8421935;

update Gara set Aggiudicatario = 'Rimini Service', OffertaVincitore = 1700
	where RichiestaMEPA = 94432633;

-- 12)
update Trattativa set Stipulata = true where RichiestaMEPA = 274635;

update Trattativa set Stipulata = false where RichiestaMEPA = 92148;

-- 13)
update Catalogo
	set Prezzo = 1340.48, InizioValidita = '2017-12-20',	FineValidita = '2018-01-19'
	where Fornitore = '1924512551' and Prodotto = 'MF839T/A';

-- 18)
-- delete from ProdottoServizio
-- 	where Codice = 'MF839T/A';

-- 22)
select * from Cliente where Codice = '00382520427';

-- 24)
select (select Nome from Cliente where Codice=Cliente) as Cliente, ContrattoAssistenza.Importo, Inizio, Termine, DataPagamento
  from ContrattoAssistenza, Fattura
  where ContrattoAssistenza.Codice = 1 and Fattura.Codice = ContrattoAssistenza.Fattura;

-- 25)
select ContrattoAssistenza.Codice as Contratto, (select Nome from Cliente where Codice=Cliente) as Cliente, ContrattoAssistenza.Importo, Inizio , Termine, DataPagamento
	from ContrattoAssistenza, Fattura
	where Inizio >= '2018' and Termine <= '2019' and Fattura.Codice = ContrattoAssistenza.Fattura;

-- 26)
select * from Gara where RichiestaMEPA = 1776266;

-- 27)
select * from Trattativa where RichiestaMEPA = 274635;

-- 28)
/* monitor per codice */
select Prodotto.Codice, Produttore, Modello, Dimensione, Risoluzione
	from Prodotto, Monitor
	where Prodotto.Codice = Monitor.Codice and Monitor.Codice = '24M38A';

/* notebook per codice */
select Prodotto.Codice, Produttore, Modello, Processore, RAM, Storage, Schermo, SistemaOperativo
  from Prodotto, Notebook where Prodotto.Codice = Notebook.Codice and Notebook.Codice = 'MF839T/A';

/* pcdesktop per codice */
select Prodotto.Codice, Produttore, Modello, Processore, RAM, Storage, SistemaOperativo
	from Prodotto, PCDesktop
	where Prodotto.Codice = PCDesktop.Codice and PCDesktop.Codice = 'VC65R-G026Z';

-- 29)
select min(Prezzo) as Prezzo, Fornitore
	from Catalogo
  where Prodotto = 'MF839T/A' and InizioValidita < NOW() and FineValidita > NOW()
  group by Fornitore;

-- 30)
select * from Fattura where Codice = 1;

-- 31)
select Gara.RichiestaMEPA, Aggiudicatario, OffertaVincitore, LimiteSpesa
	from Gara, RichiestaMEPA
	where TermineOfferte >= '2017' and TermineOfferte <= '2019' and Gara.RichiestaMEPA = RichiestaMEPA.Numero
  order by Aggiudicatario = 'Rimini Service' desc;


-- 40)
insert into Fattura(Codice, Emittente, Destinatario, Importo, Emissione, Scadenza, DataPagamento, Spedizione)
  values(null, 'Rimini Service', '19245725', null, NOW(), adddate(NOW(), 30), null, null);
insert into Vendita(Fattura, ProdottoServizio, Quantita)
  values((select max(Codice) from Fattura), '24M38A', 4);

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

select sum(Quantita)
  from Vendita, Fattura
  where Fattura = Codice and Emissione >= '2017-11' and Emissione <= '2018';

-- 41)
insert into CostoSpedizione(Costo, Tempo, PesoMax, SommaMisureMax)
  values(10, 3, 15, 87);

select Costo
  from CostoSpedizione
  where (select Peso
      from Prodotto
      where Codice = 'MF839T/A') <= PesoMax
  and (select 
    (select SUBSTRING_INDEX(Dimensioni, 'x', 1) from Prodotto where Codice = 'MF839T/A') +
    (select SUBSTRING_INDEX(SUBSTRING_INDEX(Dimensioni, 'x', 2), 'x', 1) from Prodotto where Codice = 'MF839T/A') +
    (select SUBSTRING_INDEX(Dimensioni, 'x', -1) from Prodotto where Codice = 'MF839T/A')
    ) <= SommaMisureMax;


select sum(Costo)
  from CostoSpedizione
  where (select Peso
      from Prodotto
      where Codice IN ('MF839T/A', '24M38A')) <= PesoMax
  and (select 
    (select SUBSTRING_INDEX(Dimensioni, 'x', 1) from Prodotto where Codice IN ('MF839T/A', '24M38A')) +
    (select SUBSTRING_INDEX(SUBSTRING_INDEX(Dimensioni, 'x', 2), 'x', 1) from Prodotto where Codice IN ('MF839T/A', '24M38A')) +
    (select SUBSTRING_INDEX(Dimensioni, 'x', -1) from Prodotto where Codice IN ('MF839T/A', '24M38A'))
    ) <= SommaMisureMax;