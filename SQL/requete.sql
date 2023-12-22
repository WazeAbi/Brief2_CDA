--Les titres et dates de sortie des films du plus récent au plus ancien
select title,date_s  from movie order by date_s 
--Les noms, prénoms et âges des acteurs/actrices de plus de 30 ans dans l'ordre alphabétique
select firstname ,lastname ,birthdate  from actor where  birthdate < '1993-12-31' order by firstname
--La liste des acteurs/actrices principaux pour un film donné
SELECT actor.firstname
FROM actor
INNER JOIN play ON actor.id_actor = play.id_actor
INNER JOIN movie ON movie.id_movie = play.id_movie
WHERE movie.title = 'Forrest Gump'
--La liste des films pour un acteur/actrice donné
SELECT movie.title 
FROM movie 
INNER JOIN play on movie.id_movie = play.id_movie
INNER JOIN actor ON actor.id_actor = play.id_actor
WHERE actor.firstname = 'Tom' and actor.lastname ='Hanks'
--Ajouter un film
insert into Movie(title, duration, date_s) VALUES
('Ready Player One','140','2018-04-11');
--Ajouter un acteur 
insert into Actor(firstname,lastname,birthdate)
('Willard','Smith','1968-09-25')
--Modifier un film
select * From movie where id =(SELECT MAX(id) FROM movie)
Update Movie SET title = '?' , '?','????-??-??'
WHERE id = (SELECT MAX(id) FROM movie);
--Supprimer un acteur/actrice
select * From actor where id =(SELECT MAX(id) FROM actor)
DELETE  From actor where id = (SELECT MAX(id) FROM movie);
--Afficher les 3 derniers acteurs 
Select * from actor order by id_actor DESC LIMIT 3;
-- Appel de la fonction Movie_Director pour afficher la liste des films en fonction du réalisateur
Select * from Movie_director("??? ???");
------
update userh
set firstname ='kebab',lastname ='burgir'
where id_user =2;

