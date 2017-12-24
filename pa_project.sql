/*** CREAZIONE TABELLE ***/

create table RichiestaMEPA (
	Numero INT(11) primary key,
	CodicePA VARCHAR(11) not null,
	OffertaProposta FLOAT(6,2) not null,
	LimiteSpesa FLOAT(6,2) not null,
	InizioOfferte DATE not null,
	TermineOfferte DATE not null,
	check(TermineOfferte > InizioOfferte)
)ENGINE=InnoDB;

create table Gara (
	RichiestaMEPA INT(11) primary key references RichiestaMEPA(Numero) on update cascade on delete no action,
	Aggiudicatario VARCHAR(45),
	OffertaVincitore FLOAT(6,2)
)ENGINE=InnoDB;

create table Trattativa (
	RichiestaMEPA INT(11) primary key references RichiestaMEPA(Numero) on update cascade on delete no action,
	Stipulata BOOLEAN
)ENGINE=InnoDB;

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
	Cliente VARCHAR(16) not null references Cliente(Codice) on update cascade on delete no action
)ENGINE=InnoDB;

create table TelefonoFornitore (
	Numero VARCHAR(11) primary key,
	Fornitore VARCHAR(16) not null references Fornitore(Codice) on update cascade on delete no action
)ENGINE=InnoDB;

create table CostoSpedizione (
	Codice INT(11) primary key auto_increment,
	Costo INT(11) not null,
	Tempo INT(11) not null,
	PesoMax INT(11) not null,
	SommaMisureMax INT(11) not null
)ENGINE=InnoDB;

create table ContrattoAssistenza (
	Codice INT(11) primary key auto_increment,
	Importo FLOAT(6,2) not null,
	Cliente VARCHAR(16) not null references Cliente(Codice) on update cascade on delete no action,
	Inizio DATE not null,
	Termine DATE not null,
	Fattura INT(11) references Fattura(Codice) on update cascade on delete no action
)ENGINE=InnoDB;

create table Fattura (
	Codice INT(11) primary key auto_increment,
	Emittente VARCHAR(45) not null,
	Destinatario VARCHAR(45) not null,
	Importo FLOAT(6,2) not null,
	Emissione DATE not null,
	Scadenza DATE not null,
	DataPagamento DATE,
	Spedizione INT(11) references Spedizione(Codice) on update cascade on delete no action,
	check (Scadenza > Emissione)
)ENGINE=InnoDB;

create table ProdottoServizio (
	Codice VARCHAR(20) primary key
)ENGINE=InnoDB;

create table Prodotto (
	Codice VARCHAR(20) primary key references ProdottoServizio(Codice) on update cascade on delete no action,
	Produttore VARCHAR(45) not null,
	Modello VARCHAR(45) not null
)ENGINE=InnoDB;

create table Notebook (
	Codice VARCHAR(20) primary key references Prodotto(Codice) on update cascade on delete no action,
	Processore VARCHAR(11) not null,
	RAM INT(11) not null,
	Storage INT(11) not null,
	Schermo FLOAT(2,1) not null,
	SistemaOperativo VARCHAR(45) not null
	check(SistemaOperativo='Windows 10'
		or SistemaOperativo='Windows 7'
		or SistemaOperativo='Mac OS X'
		or SistemaOperativo='Linux'
		or SistemaOperativo='Free Dos')
)ENGINE=InnoDB;

create table PCDesktop (
	Codice VARCHAR(20) primary key references Prodotto(Codice) on update cascade on delete no action,
	Processore VARCHAR(11) not null,
	RAM INT(11) not null,
	Storage INT(11) not null,
	SistemaOperativo VARCHAR(45) not null,
	check(SistemaOperativo='Windows 10'
		or SistemaOperativo='Windows 7'
		or SistemaOperativo='Mac OS X'
		or SistemaOperativo='Linux'
		or SistemaOperativo='Free Dos')
)ENGINE=InnoDB;

create table Monitor (
	Codice VARCHAR(20) primary key references Prodotto(Codice) on update cascade on delete no action,
	Dimensione FLOAT(3,1) not null,
	Risoluzione VARCHAR(11) not null
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
	Codice VARCHAR(20) primary key references Prodotto(Codice) on update cascade on delete no action,
	Tecnologia VARCHAR(6) not null,
	FormatoMax CHAR(2) not null,
	Velocita INT(11) not null,
	Connettivita VARCHAR(9) not null,
	check(Tecnologia='Inkjet' or Tecnologia='Laser'),
	check(FormatoMax='A3' or FormatoMax='A4' or FormatoMax='A5'),
	check(Connettivita='USB' or Connettivita='WiFi' or Connettivita='USB, WiFi')
)ENGINE=InnoDB;

create table Servizio (
	Codice VARCHAR(20) primary key references ProdottoServizio(Codice) on update cascade on delete no action,
	Tipologia VARCHAR(24) not null,
	Costo INT(11) not null,
	check(Tipologia='Riparazione software' or Tipologia='Sostituzione componente'
		or Tipologia='Configurazione programma' or Tipologia='Formattazione pc'
		or Tipologia='Installazione rete WiFi')
)ENGINE=InnoDB;

create table Catalogo (
	Fornitore VARCHAR(16) references Fornitore(Codice) on update cascade on delete no action,
	Prodotto VARCHAR(20) references Prodotto(Codice) on update cascade on delete no action,
	primary key (Fornitore, Prodotto),
	Prezzo FLOAT(6,2) not null,
	InizioValidita DATE not null,
	FineValidita DATE not null
)ENGINE=InnoDB;

create table ElencazioneCostiSpedizione (
	Fornitore VARCHAR(16) references Fornitore(Codice) on update cascade on delete no action,
	Costo INT(11) references CostoSpedizione(Codice) on update cascade on delete no action,
	primary key (Fornitore, Costo)
)ENGINE=InnoDB;

create table ElencazioneAssistenza (
	Contratto INT(11) references ContrattoAssistenza(Codice) on update cascade on delete no action,
	Servizio VARCHAR(20) references Servizio(Codice) on update cascade on delete no action,
	primary key (Contratto, Servizio)
)ENGINE=InnoDB;

create table DescrizioneRichiesta (
	RichiestaMEPA INT(11) references RichiestaMEPA(Numero) on update cascade on delete no action,
	ProdottoServizio VARCHAR(20) references ProdottoServizio(Codice) on update cascade on delete no action,
	primary key (RichiestaMEPA, ProdottoServizio)
)ENGINE=InnoDB;

create table Acquisto (
	Fattura INT(11) references Fattura(Codice) on update cascade on delete no action,
	Prodotto VARCHAR(20) references Prodotto(Codice) on update cascade on delete no action,
	primary key (Fattura, Prodotto),
	Quantita INT(11) not null default 1
)ENGINE=InnoDB;

create table Vendita (
	Fattura INT(11) references Fattura(Codice) on update cascade on delete no action,
	ProdottoServizio VARCHAR(20) references ProdottoServizio(Codice) on update cascade on delete no action,
	primary key (Fattura, ProdottoServizio),
	Quantita INT(11) not null default 1
)ENGINE=InnoDB;



/*** OPERAZIONI ***/

-- 1)
insert into Cliente(Codice, Tipo, IndirizzoPEC, Nome, Email, Via, NumCivico, Citta, CAP)
	values(...);

insert into TelefonoCliente(Numero, Cliente)
	values(...);

-- 2)
insert into RichiestaMEPA(Numero, CodicePA, OffertaProposta, LimiteSpesa, InizioOfferte, TermineOfferte)
	values(...);

insert into Gara(RichiestaMEPA, Aggiudicatario, OffertaVincitore)
	values(...);

-- 3)
insert into RichiestaMEPA(Numero, CodicePA, OffertaProposta, LimiteSpesa, InizioOfferte, TermineOfferte)
	values(...);

insert into Trattativa(RichiestaMEPA, Stipulata)
	values(...);


-- 6)
insert into Fattura(Codice, Emittente, Destinatario, Importo, Emissione, Scadenza, DataPagamento, Spedizione)
	values(null, ...);

-- 10)

-- Qui l'importo non va calcolato con il costo dei servizi
insert into ContrattoAssistenza(Codice, Importo, Cliente, Inizio, Termine, Fattura)
	values(null, ..., null);

insert into ElencazioneAssistenza(Contratto, Servizio)
	values ((select MAX(Codice) from ContrattoAssistenza), <codice_servizio>);

insert into Fattura(Codice, Emittente, Destinatario, Importo, Emissione, Scadenza, DataPagamento, Spedizione)
	values(null, 'Rimini Service', <codice_cliente>, <importo_contratto>, NOW(), adddate(NOW(), 30), null, null);

update ContrattoAssistenza
  set Fattura = (select MAX(Codice) from Fattura)
  order by Codice DESC limit 1;

-- 11)
update Gara set Aggiudicatario = <vincitore>, OffertaVincitore = <offerta>
	where RichiestaMEPA = <codice_gara>;

-- 13)
update Catalogo
	set Prezzo = <nuovo_prezzo>, InizioValidita = <nuovo_inizio>,	FineValidita = <nuovo_termine>
	where Fornitore = <fornitore> and Prodotto = <prodotto>;

-- 18) rischiamo di perdere dei dati nelle fatture, è però vero che i codici prodotto sono universali
delete from Prodotto
	where Codice = <codice_prodotto>;

-- 20) siamo sicuri di volerlo fare? perdiamo dei dati nelle varie stipule
delete from Fornitore
	where Codice = <codice_fornitore>;

-- discorso analogo per la cancellazione di un servizio

-- 22)
select * from Cliente where Codice = <codice_cliente>;

-- 24) DA TESTARE
select Cliente, Importo, Inizio, Termine, DataPagamento
	from ContrattoAssistenza, Fattura
	where ContrattoAssistenza.Codice = <codice_contratto> and Fattura.Codice = ContrattoAssistenza.Fattura;

-- 25)
select Codice, Importo, Cliente, Inizio , Termine, Fattura
	from ContrattoAssistenza
	where ContrattoAssistenza.Inizio >= <anno_mese_inizio> and ContrattoAssistenza.Termine <= <anno_mese_fine>

-- 26)
select * from Gara where RichiestaMEPA = <numero_richiestamepa>

-- 27)
select * from Trattativa where RichiestaMEPA = <numero_richiestamepa>

-- 28)
/* monitor per codice */
select * from Prodotto, Monitor where Prodotto.Codice = Monitor.Codice and Monitor.Codice = <codice_monitor>

/* notebook per codice */
select * from Prodotto, Notebook where Prodotto.Codice = Notebook.Codice and Notebook.Codice = <codice_notebook>

/* pcdesktop per codice */
select * from Prodotto, PCDesktop where Prodotto.Codice = PCDesktop.Codice and PCDesktop.Codice = <codice_pcdesktop>

-- 29)
select min(Prezzo), Fornitore
	from Catalogo
	where Prodotto = <codice_prodotto> and InizioValidita < NOW() and FineValidita > NOW()

-- 30)
select * from Fatture where Codice = <codice_fattura>

-- 31)
