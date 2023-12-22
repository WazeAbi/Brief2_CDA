# Brief2_CDA : Plateforme de Streaming de Films 

Welcome ,to the project for designing and developing a database for our future streaming platform. 
The goal of this project is to create foundation for storing information about movies (Title, Actor, Director ...).

## Project Objectives 

* ### Data Gathering :
-Identify and document all necessary data for our platform, including information about movies, actors/actresses, directors, genres, studios, reviews, and more.
* ### Merise Design : 
-We use Merise method to disgn our database.
Merise method helped us to create the Conceptual Data Model (CDM) , Logical Data Model (LDM) and Physical Data Model (PDM).
* ### SQL Query Writing :
-Develop SQl queries to interact with the database
 to efficiently extract, insert , update and delete data. 
* ### Triggers and Stored Procedures :
-Create Triggers and procedures to automate common task , to enhancing the efficiency and consistency of our database.

## What do you need ?

### Docker and Database management system : 

To test my project you need to install ⏳ :

* Docker 

* DBMS (like DBBEAVER or Pgadmin 4 because we use postgreSQL syntax ) 

* Git

### Steps to follow

1. Git clone the project ⚙️ : <br>

    * Open your terminal
    * Navigate to the directory where you want to store the project with cd 
    * Clone the project using 'git clone' command : 
```bash
git clone https://github.com/WazeAbi/Brief2_CDA.git
```
2. Launch the docker-compose 🚀 : <br>
    * Go on your new directory previously created with the terminal.
```bash
cd path/to/your/folder/docker
```

Now Launch it 
```bash
    Docker compose up 
```

3. Connect to database 🛜 :
    *  POSTGRES_USER : user
    *  POSTGRES_PASSWORD : pwd 

4. Now Enjoy my DATABASE 😄

## Try my DataBase relation with my SQL Query 

### List of SQL Query

1. Retrieve Movie Titles and Release Dates (Most Recent to Oldest)
```sql
SELECT title, date_s FROM movie ORDER BY date_s DESC;
```

2. List Names, First Names, and Ages of Actors/Actresses Older than 30 (Alphabetical Order)
```sql
SELECT firstname, lastname, DATE_PART('year', AGE(birthdate)) AS age
FROM actor
WHERE birthdate < '1993-12-31'
ORDER BY firstname;
```
3. List the Lead Actors/Actresses for a Given Movie
```sql
SELECT actor.firstname
FROM actor
INNER JOIN play ON actor.id_actor = play.id_actor
INNER JOIN movie ON movie.id_movie = play.id_movie
WHERE movie.title = 'Forrest Gump';
```
4. List Movies for a Given Actor/Actress
```sql
SELECT movie.title 
FROM movie 
INNER JOIN play ON movie.id_movie = play.id_movie
INNER JOIN actor ON actor.id_actor = play.id_actor
WHERE actor.firstname = 'Tom' AND actor.lastname = 'Hanks';
```

5. Add a New Movie
```sql
INSERT INTO Movie(title, duration, date_s) VALUES
('Ready Player One', '140', '2018-04-11');
```

6. Add a New Actor/Actress
```sql
INSERT INTO Actor(firstname, lastname, birthdate)
VALUES ('Willard', 'Smith', '1968-09-25');
```

7. Modify a Movie
```sql
UPDATE Movie
SET title = '?', duration = '?', date_s = '????-??-??'
WHERE id = (SELECT MAX(id) FROM movie);
```

8. Delete an Actor/Actress
```sql
DELETE FROM actor WHERE id = (SELECT MAX(id) FROM actor);
```

9. Display the Last 3 Actors/Actresses
```sql
SELECT * FROM actor ORDER BY id_actor DESC LIMIT 3;
```

10. Call the Movie_Director Function to List Movies by Director
```sql
SELECT * FROM Movie_Director('??? ???');
```

11. Update UserH and get historical
```sql 
update userh
set firstname ='kebab',lastname ='burgir'
where id_user =2;
```





    






