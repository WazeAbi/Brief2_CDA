## Merise MLD
actor (id_Actor, firstname, lastname, birthdate )<br>
user (id_User, firstname, lastname, email, password, user_role, fav_movie )<br>
movie (id_Movie, title, duration, date )<br>
director (id_Director, firstname, lastname )<br>
play (#id_Movie, #id_Actor, role )<br>
make (#id_Movie, #id_Director )<br>