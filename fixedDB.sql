CREATE TABLE Author (
    AuthorID INT PRIMARY KEY,
    name VARCHAR(255) NOT NULL
);

CREATE TABLE Genre (
    GenreID INT PRIMARY KEY,
    name VARCHAR(255) NOT NULL
);

CREATE TABLE Albom (
    AlbomID INT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    year INTEGER NOT NULL CHECK (year BETWEEN 1900 AND 2100)
);

CREATE TABLE Track (
    TrackID INT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    AlbomID INT NOT NULL,
    duration INTERVAL NOT NULL CHECK (duration > '00:00:00'),
    FOREIGN KEY (AlbomID) REFERENCES Albom(AlbomID)
);

CREATE TABLE Collection (
    CollectionID INT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    year INTEGER NOT NULL CHECK (year BETWEEN 1900 AND 2100)
);

CREATE TABLE AlbomAuthor (
    AlbomAuthorID INT PRIMARY KEY,
    AlbomID INT NOT NULL,
    AuthorID INT NOT NULL,
    FOREIGN KEY (AlbomID) REFERENCES Albom(AlbomID),
    FOREIGN KEY (AuthorID) REFERENCES Author(AuthorID),
    CONSTRAINT UQ_AlbomAuthor UNIQUE (AlbomID, AuthorID)
);

CREATE TABLE AuthorGenre (
    AuthorGenreID INT PRIMARY KEY,
    AuthorID INT NOT NULL,
    GenreID INT NOT NULL,
    FOREIGN KEY (AuthorID) REFERENCES Author(AuthorID),
    FOREIGN KEY (GenreID) REFERENCES Genre(GenreID),
    CONSTRAINT UQ_AuthorGenre UNIQUE (AuthorID, GenreID)
);

CREATE TABLE CollectionTrack (
    CollectionTrackID INT PRIMARY KEY,
    CollectionID INT NOT NULL,
    TrackID INT NOT NULL,
    FOREIGN KEY (CollectionID) REFERENCES Collection(CollectionID),
    FOREIGN KEY (TrackID) REFERENCES Track(TrackID),
    CONSTRAINT UQ_CollectionTrack UNIQUE (CollectionID, TrackID)
);