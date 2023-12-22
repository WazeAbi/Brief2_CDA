CREATE USER admintest WITH PASSWORD 'adminpassword';

GRANT ALL PRIVILEGES ON DATABASE db TO admintest;

REVOKE ALL PRIVILEGES ON DATABASE db FROM PUBLIC;
CREATE TABLE UserH (
    id_user SERIAL PRIMARY KEY ,
    firstname VARCHAR(50),
    lastname VARCHAR(50),
    email VARCHAR(255),
    password VARCHAR(50),
    user_role BOOLEAN NOT NULL DEFAULT FALSE
);
CREATE TABLE UserH_Update (
    id_update SERIAL PRIMARY KEY,
    id_user INT,
    modification_date TIMESTAMP,
    new_firstname VARCHAR(50),
    old_firstname VARCHAR(50),
    new_lastname VARCHAR(50),
    old_lastname VARCHAR(50),
    new_email VARCHAR(255),
    old_email VARCHAR(255),
    new_password VARCHAR(50),
    old_password VARCHAR(50),
    new_user_role BOOLEAN NOT NULL DEFAULT FALSE,
    old_user_role BOOLEAN NOT NULL DEFAULT FALSE,
    FOREIGN KEY (id_user) REFERENCES UserH(id_user)
);


CREATE TABLE Movie (
    id_movie SERIAL PRIMARY KEY,
    Title VARCHAR(255),
    duration FLOAT,
    date_s DATE
);

CREATE TABLE Actor (
    id_actor SERIAL PRIMARY KEY ,
    firstname VARCHAR(50),
    lastname VARCHAR(50),
    birthdate DATE
);

CREATE TABLE Play (
    id_play SERIAL PRIMARY KEY  ,
    id_actor INT,
    id_movie INT,
    role VARCHAR(50),
    FOREIGN KEY (id_actor) REFERENCES Actor(id_actor),
    FOREIGN KEY (id_movie) REFERENCES Movie(id_movie)
);

CREATE TABLE Director (
    id_director SERIAL PRIMARY KEY,
    firstname VARCHAR(50),
    lastname VARCHAR(50)
);

CREATE TABLE Make (
    id_make SERIAL PRIMARY KEY,
    id_director INT,
    id_movie INT,
    FOREIGN KEY (id_director) REFERENCES Director(id_director),
    FOREIGN KEY (id_movie) REFERENCES Movie(id_movie)
);
CREATE TABLE Watch
(
    id_watch SERIAL PRIMARY KEY ,
    id_movie INT,
    id_user  INT,
    fav_movie BOOLEAN NOT NULL DEFAULT FALSE,
    FOREIGN KEY (id_movie) REFERENCES Movie(id_movie),
    FOREIGN KEY (id_user)  REFERENCES UserH(id_user)
);
INSERT INTO Director (firstname, lastname) VALUES
('Steven', 'Spielberg'),
('Christopher', 'Nolan'),
('Martin', 'Scorsese'),
('Quentin', 'Tarantino'),
('Alfred', 'Hitchcock'),
('James', 'Cameron'),
('Tim', 'Burton'),
('Ridley', 'Scott'),
('David', 'Fincher'),
('Stanley', 'Kubrick');
INSERT INTO Actor (firstname, lastname, birthdate) VALUES
('Tom', 'Hanks', '1956-07-09'),          
('Morgan', 'Freeman', '1937-06-01'),      
('Samuel L.', 'Jackson', '1948-12-21'),  
('Heath', 'Ledger', '1979-04-04'),        
('Al', 'Pacino', '1940-04-25'),           
('Leonardo', 'DiCaprio', '1974-11-11'),   
('Ralph', 'Fiennes', '1962-12-22'),       
('Brad', 'Pitt', '1963-12-18'),           
('Keanu', 'Reeves', '1964-09-02'),        
('Mark', 'Hamill', '1951-09-25'); 
INSERT INTO Movie (title, duration, date_s) VALUES
('Forrest Gump', '142', '1994-07-06'),
('The Shawshank Redemption', '142', '1994-09-23'),
('Pulp Fiction', '154', '1994-10-14'),
('The Dark Knight', '152', '2008-07-18'),
('The Godfather', '175', '1972-03-24'),
('Inception', '148', '2010-07-16'),
('Schindler''s List', '195', '1993-12-15'),
('Fight Club', '139', '1999-10-15'),
('The Matrix', '136', '1999-03-31'),
('Star Wars: Episode IV - A New Hope', '121', '1977-05-25');
INSERT INTO Play (id_actor, id_movie, role) VALUES
-- Acteurs et rôles pour "Forrest Gump"
(1, 1, 'Forrest Gump'),
(2, 1, 'Jenny Curran'),
-- Acteurs et rôles pour "The Shawshank Redemption"
(2, 2, 'Ellis Boyd "Red" Redding'),
(4, 2, 'Andy Dufresne'),
-- Acteurs et rôles pour "Pulp Fiction"
(3, 3, 'Jules Winnfield'),
-- Acteurs et rôles pour "The Dark Knight"
(4, 4, 'The Joker'),
-- Acteurs et rôles pour "The Godfather"
(5, 5, 'Michael Corleone'),
-- Acteurs et rôles pour "Inception"
(6, 6, 'Cobb'),
-- Acteurs et rôles pour "Schindler's List"
(7, 7, 'Amon Goeth'),
-- Acteurs et rôles pour "Fight Club"
(8, 8, 'Tyler Durden'),
-- Acteurs et rôles pour "The Matrix"
(9, 9, 'Neo'),
-- Acteurs et rôles pour "Star Wars: Episode IV - A New Hope"
(10, 10, 'Luke Skywalker');
INSERT INTO Make (id_director, id_movie) VALUES
(1, 5),    
(2, 1),    
(3, 3),    
(4, 4),    
(2, 7),    
(4, 6),    
(9, 8),    
(9, 9),    
(8, 10);  
INSERT INTO Userh (firstname, lastname, email, password) VALUES
('John', 'Doe', 'john.doe@example.com', 'MotDePasse1'),
('Jane', 'Smith', 'jane.smith@example.com', 'MotDePasse2'),
('Alice', 'Johnson', 'alice.johnson@example.com', 'MotDePasse3'),
('Bob', 'Brown', 'bob.brown@example.com', 'MotDePasse4'),
('Eva', 'White', 'eva.white@example.com', 'MotDePasse5');

INSERT INTO Watch(id_movie,id_user,fav_movie)VALUES

(1,2,FALSE),
(5,1,TRUE),
(7,4,FALSE),
(1,5,TRUE),
(3,2,FALSE),
(1,4,TRUE),
(9,2,FALSE),
(8,1,TRUE);

CREATE OR REPLACE FUNCTION Movie_director(director_name VARCHAR(255))
returns TABLE(title VARCHAR(255),duration float ,date_s date)
AS $$
BEGIN
    RETURN QUERY --Ajoute les résultats de l'exécution d'une requête à l'ensemble des résultats de la fonction
  
SELECT movie.title,movie.duration,movie.date_s
FROM movie
INNER JOIN make ON movie.id_movie = make.id_movie 
INNER JOIN director ON director.id_director = make.id_director
WHERE (director.firstname || ' ' || director.lastname) = director_name;
END;
$$LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION Update_Userh_Update()
RETURNS TRIGGER AS $$
BEGIN
    INSERT INTO UserH_Update (
        id_user,
        modification_date,
        new_firstname,
        old_firstname,
        new_lastname,
        old_lastname,
        new_email,
        old_email,
        new_password,
        old_password,
        new_user_role,
        old_user_role
    )
    VALUES (
        OLD.id_user,
        NOW(),
        NEW.firstname,
        OLD.firstname,
        NEW.lastname,
        OLD.lastname,
        NEW.email,
        OLD.email,
        NEW.password,
        OLD.password,
        NEW.user_role,
        OLD.user_role
    );
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER Update_Userh
AFTER UPDATE on Userh
FOR EACH ROW
execute FUNCTION Update_Userh_Update();
