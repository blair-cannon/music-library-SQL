-- CRUD!!!!!

-- CREATE 

-- create membership table
CREATE TABLE memberships (
	membership_id serial primary key,
	membership_type varchar not null,
)

-- create users table 
CREATE TABLE users (
    user_id serial primary key,
    user_name varchar (20) unique not null,
    full_name varchar not null,
    password varchar not null,
    created_at timestamp not null,
    membership_id int, 
        foreign key (membership_id)
	    references memberships(membership_id)
);

-- create playlists table 
CREATE TABLE playlists (
	playlist_id serial primary key,
	user_id int, 
		foreign key(user_id)
		references users(user_id),
	title varchar,
	length int
);

-- create song table 
CREATE TABLE songs (
	playlist_id int,
		foreign key (playlist_id)
		references playlists(playlist_id),
	title varchar,
	length int, 
	artist varchar,
	album varchar,
	genre int,
		foreign key (genre_id)
		references genres(genres_id)
);

-- create realtionship table 
CREATE TABLE relationships (
	user_id_follower int,
	user_id_followed int,
	created_at timestamp
)

-- create genre table
CREATE TABLE genres (
	genre_id serial primary key,
	genre_name varchar
)
--  READ 

-- added two membership types
insert into memberships (membership_type)
values 
	('free trial'),
	('paid member')

-- added two users
insert into users (user_name, full_name, password, created_at, membership_type)
values 
	('blair.preston', 'Blair Preston', 'helllllo', '04/02/2022', 1 ),
	('rubber.ducky', 'Rubber Ducky', 'sup', '04/02/2022', 2 )

-- added playlists from both users 
insert into playlists (user_id, title, length)
values 
	('1', 'summer dazeee', '81'),
	('1', 'Christmas Songs', '105'),
	('2', 'throwbacks', '381'),
	('2', 'partayy', '60')

-- add genres 
insert into genres (genre_name)
values
	('holiday'),
	('country'),
	('folk rock')

-- added songs to both of user 1's playlists 
insert into songs (playlist_id, title, length, artist, album, genre_id)
values 
('2', 'Joy to the World', '3', 'Nat King Cole', 'Christmas with Nat', 1),
('2', 'All I want for Christmas is You', '3', 'Mariah Carey', 'Merry Christmas', 1),
('2', 'Silent Night', '3', 'Frank Sinatra', 'A Jolly Christmas From Frank Sinatra', 1),
('1', 'Brown Eyed Girl', '3', 'Jimmy Buffett', 'One Particular Harbor', 2),
('1', 'American Pie', '3', 'Don McLean', 'American Pie', 3)

-- added the relationship between the two users 
insert into relationships (user_id_follower, user_id_followed, created_at)
values 
('1', '2')

-- UPDATE

-- add song pk 
alter table songs
add column song_id serial primary key

-- update existing user
update users
set password = 'whatsup', membership_type = 'paid member'
where user_id = 1

-- update existing playlist
update playlists
set title = 'favorites'
where playlist_id = 1


-- DELETE 

-- delete a song by id
delete from songs
where song_id = 2;

-- delete playlist
delete from playlists
where playlist_id = 2

--delete relationship (unfollow)
delete from relationships
where user_id_follower = 1 and user_id_followed = 2