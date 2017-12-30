/*** CREAZIONE TABELLE ***/

create table Cliente (
	Codice VARCHAR(16) primary key,
	Tipo VARCHAR(7) not null,
	IndirizzoPEC VARCHAR(45),
	Nome VARCHAR(45) not null,
	Email VARCHAR(45),
	Via VARCHAR(45),
	NumCivico VARCHAR(11),
	Citta VARCHAR(45),
	CAP INT(11),
	check(Tipo='privato' or Tipo='pa')
)ENGINE=InnoDB;

create table RichiestaMEPA (
	Numero INT(11) primary key,
	CodicePA VARCHAR(11) not null,
	OffertaProposta FLOAT(8,2) not null,
	LimiteSpesa FLOAT(8,2) not null,
	InizioOfferte DATE not null,
	TermineOfferte DATE not null,
	foreign key (CodicePA) references Cliente(Codice) on update cascade on delete no action,
	check(TermineOfferte > InizioOfferte)
)ENGINE=InnoDB;

create table Gara (
	RichiestaMEPA INT(11) primary key,
	Aggiudicatario VARCHAR(45),
	OffertaVincitore FLOAT(8,2),
	foreign key (RichiestaMEPA) references RichiestaMEPA(Numero) on update cascade on delete cascade
)ENGINE=InnoDB;

create table Trattativa (
	RichiestaMEPA INT(11) primary key,
	Stipulata BOOLEAN,
	foreign key (RichiestaMEPA) references RichiestaMEPA(Numero) on update cascade on delete cascade
)ENGINE=InnoDB;

create table Fornitore (
	Codice VARCHAR(16) primary key,
	IndirizzoPEC VARCHAR(45),
	Nome VARCHAR(45) not null,
	Email VARCHAR(45),
	Via VARCHAR(45),
	NumCivico VARCHAR(11),
	Citta VARCHAR(45),
	CAP INT(11)
)ENGINE=InnoDB;

create table TelefonoCliente (
	Numero VARCHAR(11) primary key,
	Cliente VARCHAR(16) not null,
	foreign key (Cliente) references Cliente(Codice) on update cascade on delete cascade
)ENGINE=InnoDB;

create table TelefonoFornitore (
	Numero VARCHAR(11) primary key,
	Fornitore VARCHAR(16) not null,
	foreign key (Fornitore) references Fornitore(Codice) on update cascade on delete cascade
)ENGINE=InnoDB;

create table CostoSpedizione (
	Codice INT(11) primary key auto_increment,
	Costo FLOAT(8,2) not null,
	Tempo INT(11) not null,
	PesoMax INT(11) not null,
	SommaMisureMax INT(11) not null
)ENGINE=InnoDB;

create table Fattura (
	Codice INT(11) primary key auto_increment,
	Emittente VARCHAR(45) not null,
	Destinatario VARCHAR(45) not null,
	Importo FLOAT(8,2),
	Emissione DATE not null,
	Scadenza DATE not null,
	DataPagamento DATE,
	Spedizione INT(11),
	foreign key (Spedizione) references CostoSpedizione(Codice) on update cascade on delete no action,
	check (Scadenza > Emissione)
)ENGINE=InnoDB;

create table ContrattoAssistenza (
	Codice INT(11) primary key auto_increment,
	Importo FLOAT(8,2) not null,
	Cliente VARCHAR(16) not null,
	Inizio DATE not null,
	Termine DATE not null,
	Fattura INT(11) not null,
	foreign key (Cliente) references Cliente(Codice) on update cascade on delete no action,
	foreign key (Fattura) references Fattura(Codice) on update cascade on delete no action
)ENGINE=InnoDB;

create table ProdottoServizio (
	Codice VARCHAR(20) primary key
)ENGINE=InnoDB;

create table Prodotto (
	Codice VARCHAR(20) primary key,
	Produttore VARCHAR(45) not null,
	Modello VARCHAR(45) not null,
	Peso FLOAT(4,1) not null,
	Dimensioni VARCHAR(20) not null,
	foreign key (Codice) references ProdottoServizio(Codice) on update cascade on delete cascade
)ENGINE=InnoDB;

create table Notebook (
	Codice VARCHAR(20) primary key,
	Processore VARCHAR(15) not null,
	RAM INT(11) not null,
	Storage INT(11) not null,
	Schermo FLOAT(3,1) not null,
	SistemaOperativo VARCHAR(45) not null,
	foreign key (Codice) references Prodotto(Codice) on update cascade on delete cascade,
	check(SistemaOperativo='Windows 10'
		or SistemaOperativo='Windows 7'
		or SistemaOperativo='Mac OS X'
		or SistemaOperativo='Linux'
		or SistemaOperativo='Free Dos')
)ENGINE=InnoDB;

create table PCDesktop (
	Codice VARCHAR(20) primary key,
	Processore VARCHAR(15) not null,
	RAM INT(11) not null,
	Storage INT(11) not null,
	SistemaOperativo VARCHAR(45) not null,
	foreign key (Codice) references Prodotto(Codice) on update cascade on delete cascade,
	check(SistemaOperativo='Windows 10'
		or SistemaOperativo='Windows 7'
		or SistemaOperativo='Mac OS X'
		or SistemaOperativo='Linux'
		or SistemaOperativo='Free Dos')
)ENGINE=InnoDB;

create table Monitor (
	Codice VARCHAR(20) primary key,
	Dimensione FLOAT(3,1) not null,
	Risoluzione VARCHAR(11) not null,
	foreign key (Codice) references Prodotto(Codice) on update cascade on delete cascade,
	check(Risoluzione='800x600'
		or Risoluzione='1024x768'
		or Risoluzione='1280x720'
		or Risoluzione='1280x800'
		or Risoluzione='1440x900'
		or Risoluzione='1650x1080'
		or Risoluzione='1920x1080'
		or Risoluzione='1920x1200'
		or Risoluzione='2560x1600')
)ENGINE=InnoDB;

create table Stampante (
	Codice VARCHAR(20) primary key,
	Tecnologia VARCHAR(6) not null,
	FormatoMax CHAR(2) not null,
	Velocita INT(11) not null,
	Connettivita VARCHAR(9) not null,
	foreign key (Codice) references Prodotto(Codice) on update cascade on delete cascade,
	check(Tecnologia='Inkjet' or Tecnologia='Laser'),
	check(FormatoMax='A3' or FormatoMax='A4' or FormatoMax='A5'),
	check(Connettivita='USB' or Connettivita='WiFi' or Connettivita='USB, WiFi')
)ENGINE=InnoDB;

create table Servizio (
	Codice VARCHAR(20) primary key,
	Tipologia VARCHAR(24) not null,
	Costo INT(11) not null,
	foreign key(Codice) references ProdottoServizio(Codice) on update cascade on delete cascade,
	check(Tipologia='Riparazione software' or Tipologia='Sostituzione componente'
		or Tipologia='Configurazione programma' or Tipologia='Formattazione pc'
		or Tipologia='Installazione rete WiFi')
)ENGINE=InnoDB;

create table Catalogo (
	Fornitore VARCHAR(16) not null,
	Prodotto VARCHAR(20) not null,
	primary key (Fornitore, Prodotto),
	Prezzo FLOAT(8,2) not null,
	InizioValidita DATE not null,
	FineValidita DATE not null,
	foreign key (Fornitore) references Fornitore(Codice) on update cascade on delete no action,
	foreign key (Prodotto) references Prodotto(Codice) on update cascade on delete no action,
	check (InizioValidita < FineValidita)
)ENGINE=InnoDB;

create table ElencazioneCostiSpedizione (
	Fornitore VARCHAR(16),
	Costo INT(11),
	primary key (Fornitore, Costo),
	foreign key (Fornitore) references Fornitore(Codice) on update cascade on delete no action,
	foreign key (Costo) references CostoSpedizione(Codice) on update cascade on delete no action
)ENGINE=InnoDB;

create table ElencazioneAssistenza (
	Contratto INT(11),
	Servizio VARCHAR(20),
	primary key (Contratto, Servizio),
	foreign key (Contratto) references ContrattoAssistenza(Codice) on update cascade on delete no action,
	foreign key (Servizio) references Servizio(Codice) on update cascade on delete no action
)ENGINE=InnoDB;

create table DescrizioneRichiesta (
	RichiestaMEPA INT(11),
	ProdottoServizio VARCHAR(20),
	Quantita INT(11) not null default 1,
	primary key (RichiestaMEPA, ProdottoServizio),
	foreign key (RichiestaMEPA) references RichiestaMEPA(Numero) on update cascade on delete no action,
	foreign key (ProdottoServizio) references ProdottoServizio(Codice) on update cascade on delete no action
)ENGINE=InnoDB;

create table Acquisto (
	Fattura INT(11),
	Prodotto VARCHAR(20),
	primary key (Fattura, Prodotto),
	Quantita INT(11) not null default 1,
	foreign key (Fattura) references Fattura(Codice) on update cascade on delete no action,
	foreign key (Prodotto) references Prodotto(Codice) on update cascade on delete no action
)ENGINE=InnoDB;

create table Vendita (
	Fattura INT(11),
	ProdottoServizio VARCHAR(20),
	primary key (Fattura, ProdottoServizio),
	Quantita INT(11) not null default 1,
	foreign key (Fattura) references Fattura(Codice) on update cascade on delete no action,
	foreign key (ProdottoServizio) references ProdottoServizio(Codice) on update cascade on delete no action
)ENGINE=InnoDB;



/*** OPERAZIONI ***/

-- 1)
insert into Cliente(Codice, Tipo, IndirizzoPEC, Nome, Email, Via, NumCivico, Citta, CAP)
	values(...);
insert into TelefonoCliente(Numero, Cliente)
	values(...);

-- 2)
insert into Cliente(Codice, Tipo, IndirizzoPEC, Nome, Email, Via, NumCivico, Citta, CAP)
	values(...);
insert into TelefonoCliente(Numero, Cliente)
	values(...);

insert into RichiestaMEPA(Numero, CodicePA, OffertaProposta, LimiteSpesa, InizioOfferte, TermineOfferte)
	values(...);

insert into Gara(RichiestaMEPA, Aggiudicatario, OffertaVincitore)
	values(...);

-- 3)
insert into Cliente(Codice, Tipo, IndirizzoPEC, Nome, Email, Via, NumCivico, Citta, CAP)
	values(...);
insert into TelefonoCliente(Numero, Cliente)
	values(...);

insert into RichiestaMEPA(Numero, CodicePA, OffertaProposta, LimiteSpesa, InizioOfferte, TermineOfferte)
	values(...);

insert into Trattativa(RichiestaMEPA, Stipulata)
	values(...);

-- 4)
/* notebook */
insert into ProdottoServizio(Codice) values (...);
insert into Prodotto(Codice, Produttore, Modello)
  values(...);
insert into Notebook(Codice, Processore, RAM, Storage, Schermo, SistemaOperativo)
  values(...);


-- 6)
insert into Fattura(Codice, Emittente, Destinatario, Importo, Emissione, Scadenza, DataPagamento, Spedizione)
	values(null, ...);

/* acquisto prodotto */
insert into Fattura(Codice, Emittente, Destinatario, Importo, Emissione, Scadenza, DataPagamento, Spedizione)
	values(null, <codice_fornitore>, 'Rimini Service', ...);
insert into Acquisto(Fattura, Prodotto, Quantita)
  values((select max(Codice) from Fattura), ...);

update Fattura
  set Importo = (
    select sum(Quantita*Prezzo)
      from (select min(Prezzo) as Prezzo, Fornitore
      	from Catalogo
      	where Prodotto = <codice_prodotto> and InizioValidita < NOW() and FineValidita > NOW()
      	group by Fornitore
      ) as PrezzoVendita, Acquisto
      where Acquisto.Fattura = (select max(Fattura) from Acquisto) and Acquisto.Prodotto = <codice_prodotto>
  ),
  Spedizione = (
    select Codice
      from CostoSpedizione, ElencazioneCostiSpedizione
      where (select Peso
          from Prodotto
          where Codice = <codice_prodotto>) <= PesoMax
      and (select
        (select SUBSTRING_INDEX(Dimensioni, 'x', 1) from Prodotto where Codice = <codice_prodotto>) +
        (select SUBSTRING_INDEX(SUBSTRING_INDEX(Dimensioni, 'x', 2), 'x', 1) from Prodotto where Codice = <codice_prodotto>) +
        (select SUBSTRING_INDEX(Dimensioni, 'x', -1) from Prodotto where Codice = <codice_prodotto>)
        ) <= SommaMisureMax
      and ElencazioneCostiSpedizione.Fornitore = Fattura.Emittente
    	order by CostoSpedizione.Costo limit 1
  )
  order by Codice DESC limit 1;

/* vendita prodotto */
insert into Fattura(Codice, Emittente, Destinatario, Importo, Emissione, Scadenza, DataPagamento, Spedizione)
	values(null, ...);

insert into Vendita(Fattura, ProdottoServizio, Quantita)
	values((select max(Codice) from Fattura), ...)

update Fattura
  set Importo = (
    select sum(Quantita*Prezzo*1.1)
      from (select min(Prezzo) as Prezzo, Fornitore
      	from Catalogo
      	where Prodotto = <codice_prodotto> and InizioValidita < NOW() and FineValidita > NOW()
      	group by Fornitore
      ) as PrezzoVendita, Vendita
      where Vendita.Fattura = (select max(Fattura) from Vendita) and Vendita.ProdottoServizio = <codice_prodotto>
  )
  order by Codice DESC limit 1;

-- 10) l'importo non va calcolato con i costi dei servizi
insert into Fattura(Codice, Emittente, Destinatario, Importo, Emissione, Scadenza, DataPagamento, Spedizione)
	values(null, 'Rimini Service', <codice_cliente>, <importo_contratto>, NOW(), adddate(NOW(), 30), null, null);

insert into ContrattoAssistenza(Codice, Importo, Cliente, Inizio, Termine, Fattura)
	values(null, ..., (select max(Codice) from Fattura));

insert into ElencazioneAssistenza(Contratto, Servizio)
	values ((select max(Codice) from ContrattoAssistenza), <codice_servizio>);

-- 11)
update Gara set Aggiudicatario = <vincitore>, OffertaVincitore = <offerta>
	where RichiestaMEPA = <codice_gara>;

-- 13)
update Catalogo
	set Prezzo = <nuovo_prezzo>, InizioValidita = <nuovo_inizio>,	FineValidita = <nuovo_termine>
	where Fornitore = <fornitore> and Prodotto = <prodotto>;

-- 18)
delete from ProdottoServizio
	where Codice = <codice_prodotto_servizio>;

-- 20)
delete from Fornitore
	where Codice = <codice_fornitore>;

-- 22)
select * from Cliente where Codice = <codice_cliente>;

-- 24)
select (select Nome from Cliente where Codice=Cliente) as Cliente, ContrattoAssistenza.Importo, Inizio, Termine, DataPagamento
	from ContrattoAssistenza, Fattura
	where ContrattoAssistenza.Codice = <codice_contratto> and Fattura.Codice = ContrattoAssistenza.Fattura;

-- 25)
select ContrattoAssistenza.Codice as Contratto, (select Nome from Cliente where Codice=Cliente) as Cliente, ContrattoAssistenza.Importo, Inizio , Termine, DataPagamento
	from ContrattoAssistenza, Fattura
	where Inizio >= <data_inizio> and Termine <= <data_termine> and Fattura.Codice = ContrattoAssistenza.Fattura;

-- 26)
select * from Gara where RichiestaMEPA = <numero_richiestamepa>;

-- 27)
select * from Trattativa where RichiestaMEPA = <numero_richiestamepa>;

-- 28)
/* monitor per codice */
select Prodotto.Codice, Produttore, Modello, Dimensione, Risoluzione
	from Prodotto, Monitor
	where Prodotto.Codice = Monitor.Codice and Monitor.Codice = <codice_monitor>;

/* notebook per codice */
select Prodotto.Codice, Produttore, Modello, Processore, RAM, Storage, Schermo, SistemaOperativo
	from Prodotto, Notebook
	where Prodotto.Codice = Notebook.Codice and Notebook.Codice = <codice_notebook>;

/* pcdesktop per codice */
select Prodotto.Codice, Produttore, Modello, Processore, RAM, Storage, SistemaOperativo
	from Prodotto, PCDesktop
	where Prodotto.Codice = PCDesktop.Codice and PCDesktop.Codice = <codice_pcdesktop>;

-- 29)
select min(Prezzo) as Prezzo, Fornitore
	from Catalogo
	where Prodotto = <codice_prodotto> and InizioValidita < NOW() and FineValidita > NOW()
	group by Fornitore;

-- 30)
select * from Fattura where Codice = <codice_fattura>;

-- 31)
select Gara.RichiestaMEPA, Aggiudicatario, OffertaVincitore, LimiteSpesa
	from Gara, RichiestaMEPA
	where TermineOfferte >= <inizio_periodo> and TermineOfferte <= <fine_periodo> and Gara.RichiestaMEPA = RichiestaMEPA.Numero
  order by Aggiudicatario = 'Rimini Service' desc;

-- 32)
select * from Trattativa order by Stipulata = true desc;

-- 33)
select Codice, Quantita, Produttore, Modello
	from Vendita, Prodotto
	where Vendita.ProdottoServizio = Codice
	order by Quantita desc;

-- 34)
select Codice, Quantita, Tipologia
	from Vendita, Servizio
	where Vendita.ProdottoServizio = Codice
	order by Quantita desc;

-- 35)
select Codice, (select Nome from Cliente where Codice=Destinatario) as Nome, Emissione, Scadenza
	from Fattura
	where Emittente='Rimini Service' and NOW() >= Emissione and DataPagamento IS NULL
	order by Emissione;

-- 36)
select Codice, (select Nome from Cliente where Codice=Destinatario) as Nome, Emissione, Scadenza
	from Fattura
	where Emittente='Rimini Service' and NOW() >= Emissione and DataPagamento IS NULL and DATEDIFF(Scadenza, NOW()) < 3
	order by Emissione;

-- 37)
select Codice, Emissione, Scadenza
	from Fattura
	where Emittente!='Rimini Service' and NOW() >= Emissione and DataPagamento IS NULL
	order by Emissione;

-- 38)
select Codice, Emissione, Scadenza
	from Fattura
	where Emittente!='Rimini Service' and NOW() >= Emissione and DataPagamento IS NULL and DATEDIFF(Scadenza, NOW()) < 3
	order by Emissione;

-- 39)
select ((select sum(Importo) from Fattura where Emittente = 'Rimini Service')
		- (select sum(Importo) from Fattura where Emittente != 'Rimini Service')) as Guadagno;

-- 40)
select sum(Importo)
	from Fattura
	where Emittente = 'Rimini Service' and Emissione >= <inizio_periodo> and Emissione <= <fine_periodo>;

-- 41)
select Costo
  from CostoSpedizione
  where (select Peso
      from Prodotto
      where Codice = <codice_prodotto>) <= PesoMax
  and (select
    (select SUBSTRING_INDEX(Dimensioni, 'x', 1) from Prodotto where Codice = <codice_prodotto>) +
    (select SUBSTRING_INDEX(SUBSTRING_INDEX(Dimensioni, 'x', 2), 'x', 1) from Prodotto where Codice = <codice_prodotto>) +
    (select SUBSTRING_INDEX(Dimensioni, 'x', -1) from Prodotto where Codice = <codice_prodotto>)
    ) <= SommaMisureMax
	order by Costo limit 1;

-- 42)
select min(Prezzo), Fornitore
	from Catalogo
	where Prodotto = `codice` IN <codici_prodotti> and InizioValidita < NOW() and FineValidita > NOW()
	group by Fornitore;

-- 43)
select
