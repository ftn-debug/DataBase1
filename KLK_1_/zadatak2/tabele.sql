create table ZANR 
(
   IDZ                  INTEGER              not null,
   NAZIVZ               VARCHAR2(128)        not null,
   constraint PK_ZANR primary key (IDZ)
);

create table FILM 
(
   IDF                  INTEGER              not null,
   ZANRF                INTEGER              not null,
   NAZIVF               VARCHAR2(128)        not null,
   TRAJANJEF            INTEGER,
   GODF                 INTEGER,
   constraint PK_FILM primary key (IDF),
   constraint FK_FILM_ZANR foreign key (ZANRF) references ZANR (IDZ)
);

create table KORISNIK 
(
   KORIMEK              VARCHAR2(32)         not null,
   IMEK                 VARCHAR2(128)        not null,
   PRZK                 VARCHAR2(128)        not null,
   POLK                 CHAR(1)              not null,
   constraint PK_KORISNIK primary key (KORIMEK),
   constraint CH_POLK check (POLK in ('M','Z','N'))
);

create table OCENA
(
   KORIMEO             VARCHAR2(32)         not null,
   FILMO             INTEGER              not null,   
   OCENAO             DECIMAL(10,2)        not null,
   constraint PK_IZNAJMLJIVANJE primary key (KORIMEO, FILMO),
   constraint FK_IZNAJMLJIVANJE_KORISNIK foreign key (KORIMEO) references KORISNIK (KORIMEK),
   constraint FK_IZNAJMLJIVANJE_FILM foreign key (FILMO) references FILM (IDF)
);

