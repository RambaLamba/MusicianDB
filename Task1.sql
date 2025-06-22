INSERT INTO Author (AuthorID, name) VALUES 
(1, 'Кино'),
(2, 'Scooter'),
(3, 'Татьяна Буланова'),
(4, 'Наутилус Помпилиус'),
(5, 'Сектор Газа');

INSERT INTO Genre (GenreID, name) VALUES
(1, 'Рок'),
(2, 'Техно-рейв'),
(3, 'Поп'),
(4, 'Панк-рок');

INSERT INTO Albom (AlbomID, name, year) VALUES
(1, 'Легенда', 1988),
(2, 'Jumping All Over The World', 2007),
(3, 'Крылья', 1996),
(4, 'Газовая атака', 1996),
(5, 'Старшая сестра', 1992);

INSERT INTO Track (TrackID, name, AlbomID, duration) VALUES
(1, 'Невесёлая песня', 1, '00:04:22'),
(2, 'Кончится лето', 1, '00:06:03'),
(3, 'The Logical Song', 2, '00:03:54'),
(4, 'Крылья', 3, '00:03:46'),
(5, '30 лет', 4, '00:04:10'),
(6, 'Старшая сестра', 5, '00:03:27'),
(7, 'Туман', 4, '00:03:44');

INSERT INTO Collection (CollectionID, name, year) VALUES
(1, 'Лучшие русские рок-хиты', 2000),
(2, 'Techno Party Mix', 2010),
(3, 'Золотая коллекция поп-музыки', 2005),
(4, 'Легенды 90-х', 2015);

INSERT INTO AlbomAuthor (AlbomAuthorID, AlbomID, AuthorID) VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 4),
(4, 4, 5),
(5, 5, 3);

INSERT INTO AuthorGenre (AuthorGenreID, AuthorID, GenreID) VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 3),
(4, 4, 1),
(5, 5, 4),
(6, 5, 1);

INSERT INTO CollectionTrack (CollectionTrackID, CollectionID, TrackID) VALUES
(1, 1, 2),
(2, 4, 4),
(3, 1, 7),
(4, 2, 3),
(5, 3, 6);

