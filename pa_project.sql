create table RichiestaMEPA (
	Numero INT(11) primary key,
	CodicePA VARCHAR(11) not null,
	OffertaProposta INT(11) not null,
	LimiteSpesa INT(11) not null,
	InizioOfferte DATE not null,
	TermineOfferte DATE not null
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
	Codice INT(11) primary key auto_increment,
	Tipo VARCHAR(15) not null,
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
	Codice INT(11) primary key auto_increment,
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
	Cliente INT(11) not null,
	Inizio DATE,
	Termine DATE,
	Fattura INT(11) not null references Fattura(Codice)
)ENGINE=InnoDB;

create table Fattura (
	Codice INT(11) primary key auto_increment,
	Emittente VARCHAR(45) not null,
	Destinatario VARCHAR(45) not null,
	Importo INT(11) not null,
	Emissione DATE not null,
	Scadenza DATE,
	DataPagamento DATE,
	Spedizione INT(11) references Spedizione(Codice)
)ENGINE=InnoDB;

create table ProdottoServizio (
	Codice INT(11) primary key auto_increment
)ENGINE=InnoDB;

create table Prodotto (
	Codice INT(11) primary key references ProdottoServizio(Codice),
	Produttore VARCHAR(45) not null,
	Modello VARCHAR(45) not null
)ENGINE=InnoDB;

create table Notebook (
	Codice INT(11) primary key references Prodotto(Codice),
	Processore VARCHAR(11) not null,
	RAM INT(11) not null,
	Storage INT(11) not null,
	Schermo VARCHAR(11) not null,
	SistemaOperativo VARCHAR(45) not null
)ENGINE=InnoDB;

create table PCDesktop (
	Codice INT(11) primary key references Prodotto(Codice),
	Processore VARCHAR(11) not null,
	RAM INT(11) not null,
	Storage INT(11) not null,
	SistemaOperativo VARCHAR(45) not null
)ENGINE=InnoDB;

create table Monitor (
	Codice INT(11) primary key references Prodotto(Codice),
	Dimensione VARCHAR(11) not null,
	Risoluzione VARCHAR(11) not null
)ENGINE=InnoDB;

create table Stampante (
	Codice INT(11) primary key references Prodotto(Codice),
	Tecnologia VARCHAR(45) not null,
	FormatoMax VARCHAR(11) not null,
	Velocità VARCHAR(11) not null,
	Connettività VARCHAR(45) not null
)ENGINE=InnoDB;

create table Servizio (
	Codice INT(11) primary key references ProdottoServizio(Codice),
	Tipologia VARCHAR(45) not null,
	Costo INT(11) not null,
	check(Tipologia='Manutenzione' or Tipologia='Installazione')
)ENGINE=InnoDB;

create table Catalogo (
	Fornitore INT(11) references Fornitore(Codice),
	Prodotto INT(11) references Prodotto(Codice),
	primary key (Fornitore, Prodotto),
	Prezzo INT(11) not null,
	InizioValidità DATE not null,
	FineValidità DATE not null
)ENGINE=InnoDB;

create table ElencazioneCostiSpedizione (
	Fornitore INT(11) references Fornitore(Codice),
	Costo INT(11) references CostoSpedizione(Codice),	
	primary key (Fornitore, Costo)
)ENGINE=InnoDB;

create table ElencazioneAssistenza (
	Contratto INT(11) references ContrattoAssistenza(Codice),	
	Servizio INT(11) references Servizio(Codice),	
	primary key (Contratto, Servizio)
)ENGINE=InnoDB;

create table DescrizioneRichiesta (
	RichiestaMEPA INT(11) references RichiestaMEPA(Numero),	
	ProdottoServizio INT(11) references ProdottoServizio(Codice),
	primary key (RichiestaMEPA, ProdottoServizio)
)ENGINE=InnoDB;

create table Acquisto (
	Fattura INT(11) references Fattura(Codice),	
	Prodotto INT(11) references Prodotto(Codice),	
	primary key (Fattura, Prodotto),
	Quantità INT(11) not null default 1
)ENGINE=InnoDB;

create table Vendita (
	Fattura INT(11) references Fattura(Codice),	
	ProdottoServizio INT(11) references ProdottoServizio(Codice),	
	primary key (Fattura, ProdottoServizio),
	Quantità INT(11) not null default 1
)ENGINE=InnoDB;

