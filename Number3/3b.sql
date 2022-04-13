
CREATE TABLE notown.Address (
                AddressID INTEGER NOT NULL,
                Number INTEGER NOT NULL,
                Street1 VARCHAR NOT NULL,
                Street2 VARCHAR NOT NULL,
                City VARCHAR NOT NULL,
                State VARCHAR NOT NULL,
                ZipCode INTEGER NOT NULL,
                Telephone VARCHAR NOT NULL,
                CONSTRAINT address_pk PRIMARY KEY (AddressID)
);


CREATE TABLE notown.Musicians (
                SSN INTEGER NOT NULL,
                Name VARCHAR NOT NULL,
                AddressID INTEGER NOT NULL,
                CONSTRAINT musicians_pk PRIMARY KEY (SSN)
);


CREATE SEQUENCE notown.album_age_seq;

CREATE TABLE notown.Album (
                AlbumID INTEGER NOT NULL,
                Title VARCHAR NOT NULL,
                Release_Date DATE NOT NULL,
                Format VARCHAR NOT NULL,
                Age INTEGER NOT NULL DEFAULT nextval('notown.album_age_seq'),
                Producer INTEGER NOT NULL,
                CONSTRAINT album_pk PRIMARY KEY (AlbumID)
);


ALTER SEQUENCE notown.album_age_seq OWNED BY notown.Album.Age;

CREATE TABLE notown.Instrument (
                Name VARCHAR NOT NULL,
                Pitch VARCHAR NOT NULL,
                Player INTEGER NOT NULL,
                CONSTRAINT instrument_pk PRIMARY KEY (Name)
);


CREATE TABLE notown.Song (
                Title VARCHAR NOT NULL,
                Length INTEGER NOT NULL,
                Instrument VARCHAR NOT NULL,
                Author INTEGER NOT NULL,
                Performer INTEGER NOT NULL,
                AlbumID INTEGER NOT NULL,
                CONSTRAINT song_pk PRIMARY KEY (Title)
);


ALTER TABLE notown.Musicians ADD CONSTRAINT lives
FOREIGN KEY (AddressID)
REFERENCES notown.Address (AddressID)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE notown.Song ADD CONSTRAINT authors
FOREIGN KEY (Author)
REFERENCES notown.Musicians (SSN)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE notown.Song ADD CONSTRAINT performs
FOREIGN KEY (Performer)
REFERENCES notown.Musicians (SSN)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE notown.Instrument ADD CONSTRAINT plays
FOREIGN KEY (Player)
REFERENCES notown.Musicians (SSN)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE notown.Album ADD CONSTRAINT musicians_album_fk
FOREIGN KEY (Producer)
REFERENCES notown.Musicians (SSN)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE notown.Song ADD CONSTRAINT belongs
FOREIGN KEY (AlbumID)
REFERENCES notown.Album (AlbumID)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE notown.Song ADD CONSTRAINT used
FOREIGN KEY (Instrument)
REFERENCES notown.Instrument (Name)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;
