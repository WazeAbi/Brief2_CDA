CREATE TABLE UserH (
    id_user SERIAL PRIMARY KEY ,
    firstname VARCHAR(50),
    lastname VARCHAR(50),
    email VARCHAR(255),
    password VARCHAR(50),
    user_role BOOLEAN NOT NULL DEFAULT FALSE
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