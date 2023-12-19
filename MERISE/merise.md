## Merise MLD

actor (id_Actor, firstname, lastname, birthdate )
user (id_User, firstname, lastname, email, password, user_role, fav_movie )
movie (id_Movie, title, duration, date )
director (id_Director, firstname, lastname )
play (#id_Movie, #id_Actor, role )
make (#id_Movie, #id_Director )