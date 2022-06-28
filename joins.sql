-- create a view for all of the playlists for user 1 that contains the username and playlist name
SELECT user_name, title FROM playlists
LEFT JOIN users
ON playlists.user_id = users.user_id
WHERE playlists.user_id=1

-- create a view for all songs that are country that includes song title and genre name
SELECT title, genre_name FROM songs
FULL JOIN genres
ON songs.genre_id=genres.genre_id
WHERE genre_name='country'