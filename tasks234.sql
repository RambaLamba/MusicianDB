--Задание №2--

--№1 Название и продолжительность самого длительного трека.
SELECT name, duration
FROM track
WHERE duration = (SELECT MAX(duration) FROM track);

--№2 Название треков, продолжительность которых не менее 3,5 минут.
SELECT name, duration
FROM track
WHERE duration >= '00:03:30';

--№3 Названия сборников, вышедших в период с 2018 по 2020 год включительно.
SELECT name
FROM collection
WHERE "year" BETWEEN 2018 AND 2020;

--№4 Исполнители, чьё имя состоит из одного слова.
SELECT AuthorID, name
FROM Author
WHERE name NOT LIKE '% %'; 

--№5 Название треков, которые содержат слово «мой» или «my».
SELECT TrackID, name
FROM Track
WHERE string_to_array(lower(name), ' ') && ARRAY['my', 'мой'];

--Задание №3--

--№1 Количество исполнителей в каждом жанре.
SELECT g.name, COUNT(ag.authorid)
FROM Genre g
JOIN authorgenre ag ON g.genreid = ag.genreid
GROUP BY g."name";

--№2 Количество треков, вошедших в альбомы 2019–2020 годов.
SELECT COUNT(t.trackid)
FROM track t
LEFT JOIN albom a ON t.albomid = a.albomid
WHERE a."year" BETWEEN 2019 AND 2020;

--№3 Средняя продолжительность треков по каждому альбому.
SELECT a.name, AVG(t.duration)
FROM track t
LEFT JOIN albom a ON a.albomid = t.albomid
GROUP BY a."name";

--№4 Все исполнители, которые не выпустили альбомы в 2020 году.
SELECT a.name
FROM author a
WHERE a.authorid NOT IN (
	SELECT DISTINCT aa.authorid
	FROM albomauthor aa
	JOIN albom al ON aa.albomid = al.albomid
	WHERE al."year" = 2020
);

--№5 Названия сборников, в которых присутствует конкретный исполнитель (выберите его сами).
SELECT DISTINCT c.name
FROM collection c
JOIN collectiontrack ct ON c.collectionid = ct.collectionid
JOIN track t ON ct.trackid = t.trackid
JOIN albom al ON t.albomid = al.albomid
JOIN albomauthor aa ON al.albomid = aa.albomid
JOIN author a ON aa.authorid = a.authorid
WHERE a."name" = 'Кино';

--Задание №4

--№1 Названия альбомов, в которых присутствуют исполнители более чем одного жанра.
SELECT DISTINCT al.name
FROM albom al
JOIN albomauthor aa ON al.albomid = aa.albomid
JOIN author a ON aa.authorid = a.authorid
JOIN authorgenre ag ON a.authorid = ag.authorid
WHERE a.authorid IN (
    SELECT ag.authorid
    FROM authorgenre ag
    GROUP BY ag.authorid
    HAVING COUNT(ag.genreid) > 1
);

--№2 Наименования треков, которые не входят в сборники.
SELECT t.name
FROM track t
WHERE t.trackid NOT IN (
    SELECT ct.trackid 
    FROM collectiontrack ct
);

--№3 Исполнитель или исполнители, написавшие самый короткий по продолжительности трек, — теоретически таких треков может быть несколько.
SELECT DISTINCT a.name
FROM author a
JOIN albomauthor aa ON a.authorid = aa.authorid
JOIN track t ON aa.albomid = t.albomid
WHERE t.duration = (SELECT MIN(duration) FROM track);

--№4 Названия альбомов, содержащих наименьшее количество треков.
WITH album_track_counts AS (
	SELECT al.name, count(t.trackid) AS track_count
	FROM albom al
	LEFT JOIN track t ON al.albomid = t.albomid
	GROUP BY al.name
)
SELECT name
FROM album_track_counts 
WHERE track_count = (SELECT MIN(track_count) FROM album_track_counts);
