/*** CREAZIONE TABELLE ***/

create table RichiestaMEPA (
	Numero INT(11) primary key,
	CodicePA VARCHAR(11) not null,
	OffertaProposta INT(11) not null,
	LimiteSpesa INT(11) not null,
	InizioOfferte DATE not null,
	TermineOfferte DATE not null,
	check(TermineOfferte > InizioOfferte)
)ENGINE=InnoDB;

create table Gara (
	RichiestaMEPA INT(11) primary key references RichiestaMEPA(Numero) on update cascade on delete no action,
	Aggiudicatario VARCHAR(45),
	OffertaVincitore INT(11)
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
	Città VARCHAR(45),
	CAP INT(11)
)ENGINE=InnoDB;

create table TelefonoCliente (
	Numero INT(11) primary key,
	Cliente INT(11) not null references Cliente(Codice)
)ENGINE=InnoDB;

create table TelefonoFornitore (
	Numero INT(11) primary key,
	Fornitore INT(11) not null references Fornitore(Codice)
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
	Importo INT(11) not null,
	Cliente INT(11) not null references Cliente(Codice),
	Inizio DATE not null,
	Termine DATE not null,
	Fattura INT(11) not null references Fattura(Codice)
)ENGINE=InnoDB;

create table Fattura (
	Codice INT(11) primary key auto_increment,
	Emittente VARCHAR(45) not null,
	Destinatario VARCHAR(45) not null,
	Importo INT(11) not null,
	Emissione DATE not null,
	Scadenza DATE not null,
	DataPagamento DATE,
	Spedizione INT(11) references Spedizione(Codice),
	check (Scadenza > Emissione)
)ENGINE=InnoDB;

create table ProdottoServizio (
	Codice VARCHAR(20) primary key
)ENGINE=InnoDB;

create table Prodotto (
	Codice VARCHAR(20) primary key references ProdottoServizio(Codice),
	Produttore VARCHAR(45) not null,
	Modello VARCHAR(45) not null
)ENGINE=InnoDB;

create table Notebook (
	Codice VARCHAR(20) primary key references Prodotto(Codice),
	Processore VARCHAR(11) not null,
	RAM INT(11) not null,
	Storage INT(11) not null,
	Schermo FLOAT(2,1) not null,
	SistemaOperativo VARCHAR(45) not null
)ENGINE=InnoDB;

create table PCDesktop (
	Codice VARCHAR(20) primary key references Prodotto(Codice),
	Processore VARCHAR(11) not null,
	RAM INT(11) not null,
	Storage INT(11) not null,
	SistemaOperativo VARCHAR(45) not null
)ENGINE=InnoDB;

create table Monitor (
	Codice VARCHAR(20) primary key references Prodotto(Codice),
	Dimensione FLOAT(3,1) not null,
	Risoluzione VARCHAR(11) not null
)ENGINE=InnoDB;

create table Stampante (
	Codice VARCHAR(20) primary key references Prodotto(Codice),
	Tecnologia VARCHAR(6) not null,
	FormatoMax CHAR(2) not null,
	Velocità INT(11) not null,
	Connettività VARCHAR(9) not null,
	check(Tecnologia='Inkjet' or Tecnologia='Laser'),
	check(FormatoMax='A3' or FormatoMax='A4' or FormatoMax='A5'),
	check(Connettività='USB' or Connettività='WiFi' or Connettività='USB, WiFi')
)ENGINE=InnoDB;

create table Servizio (
	Codice VARCHAR(20) primary key references ProdottoServizio(Codice),
	Tipologia VARCHAR(24) not null,
	Costo INT(11) not null,
	check(Tipologia='Riparazione software' or Tipologia='Sostituzione componente'
		or Tipologia='Configurazione programma' or Tipologia='Formattazione pc'
		or Tipologia='Installazione rete WiFi')
)ENGINE=InnoDB;

create table Catalogo (
	Fornitore VARCHAR(16) references Fornitore(Codice),
	Prodotto VARCHAR(20) references Prodotto(Codice),
	primary key (Fornitore, Prodotto),
	Prezzo INT(11) not null,
	InizioValidità DATE not null,
	FineValidità DATE not null
)ENGINE=InnoDB;

create table ElencazioneCostiSpedizione (
	Fornitore VARCHAR(16) references Fornitore(Codice),
	Costo INT(11) references CostoSpedizione(Codice),
	primary key (Fornitore, Costo)
)ENGINE=InnoDB;

create table ElencazioneAssistenza (
	Contratto INT(11) references ContrattoAssistenza(Codice),
	Servizio VARCHAR(20) references Servizio(Codice),
	primary key (Contratto, Servizio)
)ENGINE=InnoDB;

create table DescrizioneRichiesta (
	RichiestaMEPA INT(11) references RichiestaMEPA(Numero),
	ProdottoServizio VARCHAR(20) references ProdottoServizio(Codice),
	primary key (RichiestaMEPA, ProdottoServizio)
)ENGINE=InnoDB;

create table Acquisto (
	Fattura INT(11) references Fattura(Codice),
	Prodotto VARCHAR(20) references Prodotto(Codice),
	primary key (Fattura, Prodotto),
	Quantità INT(11) not null default 1
)ENGINE=InnoDB;

create table Vendita (
	Fattura INT(11) references Fattura(Codice),
	ProdottoServizio VARCHAR(20) references ProdottoServizio(Codice),
	primary key (Fattura, ProdottoServizio),
	Quantità INT(11) not null default 1
)ENGINE=InnoDB;



/*** OPERAZIONI ***/

-- 1)
insert into Cliente(Codice, Tipo, Indirizzo PEC, Nome, Email, Via, NumCivico, Città, CAP)
	values(...);

insert into TelefonoCliente(Numero, Cliente)
	values(...);

-- 2)
insert into RichiestaMEPA(Numero, CodicePA, OffertaProposta, LimiteSpesa, InizioOfferte, TermineOfferte)
	values(...);

insert into Gara(RichiestaMEPA, Aggiudicatario, OffertaVincitore)
	values(...);

insert into Trattativa(RichiestaMEPA, Stipulata)
	values(...);


-- 6)
insert into Fattura(Codice, Emittente, Destinatario, Importo, Emissione, Scadenza, DataPagamento, Spedizione)
	values(null, ...);
