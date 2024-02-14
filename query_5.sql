-- Directions: Write a query that lists all the tracks that are not in one of the top 5 genres with longer duration in the database. 

SELECT tracks.*
FROM tracks
WHERE tracks.GenreId IN (
	SELECT genres.GenreId
	FROM tracks
	JOIN genres ON genres.GenreId = tracks.GenreId
	GROUP BY genres.GenreId
	ORDER BY AVG(tracks.Milliseconds)
	LIMIT  (
		SELECT COUNT(DISTINCT tracks.GenreId) FROM tracks
	) - 5
);
