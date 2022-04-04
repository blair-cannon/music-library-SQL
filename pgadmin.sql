-- CRUD!!!!!

-- CREATE 

-- create users table 
create table users (
user_id serial primary key,
user_name varchar (20) unique not null,
full_name varchar not null,
password varchar not null,
created_at timestamp not null,
membership_type varchar not null);

-- create playlists table 
create table playlists (
playlist_id serial primary key,
user_id int, foreign key(user_id)
	references users(user_id),
title varchar,
number_of_songs int,
length int
);

-- create song table 
create table songs (
playlist_id int, foreign key (playlist_id)
	references playlists(playlist_id),
title varchar,
length int, 
artist varchar,
album varchar,
genre varchar
);

-- create realtionship table 
create table relationships (
user_id_follower int,
user_id_followed int,
created_at timestamp
)

--  READ 

-- added two users
insert into users (user_name, full_name, password, created_at, membership_type)
values 
('blair.preston', 'Blair Preston', 'helllllo', '04/02/2022', 'free trial' ),
('rubber.ducky', 'Rubber Ducky', 'sup', '04/02/2022', 'paid member' )

-- added playlists from both users 
insert into playlists (user_id, title, number_of_songs, length)
values 
('1', 'summer dazeee', '27', '81'),
('1', 'Christmas Songs', '35', '105'),
('2', 'throwbacks', '127', '381'),
('2', 'partayy', '20', '60')

-- added songs to both of user 1's playlists 
insert into songs (playlist_id, title, length, artist, album, genre)
values 
('2', 'Joy to the World', '3', 'Nat King Cole', 'Christmas with Nat', 'holiday'),
('2', 'All I want for Christmas is You', '3', 'Mariah Carey', 'Merry Christmas', 'holiday'),
('2', 'Silent Night', '3', 'Frank Sinatra', 'A Jolly Christmas From Frank Sinatra', 'holiday'),
('1', 'Brown Eyed Girl', '3', 'Jimmy Buffett', 'One Particular Harbor', 'country'),
('1', 'American Pie', '3', 'Don McLean', 'American Pie', 'folk rock')

-- added the relationship between the two users 
insert into relationships (user_id_follower, user_id_followed, created_at)
values 
('1', '2', '04/04/22')

-- UPDATE

-- add song pk 
alter table songs
add column song_id serial primary key

-- DELETE 

-- delete a song by id
delete from songs
where song_id = 2;

