CREATE TABLE Kupac(
	IDKUP varchar(2) NOT NULL,
	NAZKUP varchar(20) NOT NULL,
	MESTKUP varchar(20) NOT NULL,
	CONSTRAINT kupac_PK PRIMARY KEY (IDKUP)
);

CREATE TABLE Artikal(
	IDART varchar(2) NOT NULL,
	NAZART varchar(20) NOT NULL,
	JCENA integer NOT NULL,
	CONSTRAINT artikal_PK PRIMARY KEY (IDART)
);

CREATE TABLE Faktura(
	BRFAK varchar(2) NOT NULL,
	DATUM date NOT NULL,
	IDKUP varchar(2) NOT NULL,
	CONSTRAINT faktura_PK PRIMARY KEY (BRFAK),
	CONSTRAINT faktura_FK FOREIGN KEY (IDKUP) REFERENCES Kupac (IDKUP)
);

CREATE TABLE Stavka(
	BRFAK varchar(2) NOT NULL,
	RBRST varchar(2) NOT NULL,
	IDART varchar(2) NOT NULL,
	KOL integer NOT NULL,
	CENA integer NOT NULL,
	CONSTRAINT stavka_PK PRIMARY KEY (BRFAK,RBRST),
	CONSTRAINT stavka_ART_FK FOREIGN KEY (IDART) REFERENCES Artikal (IDART),
	CONSTRAINT stavka_FAK_FK FOREIGN KEY (BRFAK) REFERENCES Faktura (BRFAK)
);

insert into Kupac values ('K1', 'NS Gradnja', 'Novi Sad');
insert into Kupac values ('K2', 'BG-Stan', 'Beograd');
insert into Kupac values ('K3', 'Nis-Invest', 'Nis');
insert into Kupac values ('K4', 'Buducnost', 'Novi Sad');
commit;

insert into Faktura values ('F1', '10-jan-2010', 'K1');
insert into Faktura values ('F2', '4-feb-2010', 'K3');
insert into Faktura values ('F3', '3-may-2009', 'K2');
insert into Faktura values ('F4', '11-jun-2010', 'K1');
insert into Faktura values ('F5', '9-aug-2009', 'K2');
commit;

insert into Artikal values ('A1', 'Cement', 400);
insert into Artikal values ('A2', 'Pesak', 500);
insert into Artikal values ('A3', 'Blok', 20);
insert into Artikal values ('A4', 'Cigla', 10);
insert into Artikal values ('A5', 'Crep', 50);
commit;

insert into Stavka values ('F4', 'S1', 'A3', 500, 10000);
insert into Stavka values ('F1', 'S2', 'A2', 15, 7500);
insert into Stavka values ('F4', 'S3', 'A1', 20, 8000);
insert into Stavka values ('F1', 'S1', 'A3', 125, 2500);
insert into Stavka values ('F5', 'S2', 'A4', 2000, 20000);
insert into Stavka values ('F2', 'S1', 'A1', 40, 16000);
insert into Stavka values ('F5', 'S1', 'A1', 50, 20000);
insert into Stavka values ('F4', 'S2', 'A4', 900, 9000);
insert into Stavka values ('F3', 'S1', 'A2', 6, 3000);
commit;