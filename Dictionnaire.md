|# Grille d'Evalutation : 

### Table "Actor"
| Champ          | Type de Données    | Description                             |
|----------------|---------------------|-----------------------------------------|
| id_Actor       | Numérique           | Identifiant unique de l'acteur.         |
| firstname      | Alphabétique        | Prénom de l'acteur.                     |
| lastname       | Alphabétique        | Nom de l'acteur.                        |
| birthdate      | Numérique           | Date de naissance de l'acteur.          |
| role           | Alphanumérique      | Rôle de l'acteur dans le film.         |
### Table "User"
| Champ          | Type de Données    | Description                                       |
|----------------|---------------------|---------------------------------------------------|
| id_User        | Numérique           | Identifiant unique de l'utilisateur.              |
| firstname      | Alphabétique        | Prénom de l'utilisateur.                          |
| lastname       | Alphabétique        | Nom de l'utilisateur.                             |
| email          | Alphanumérique      | Adresse e-mail de l'utilisateur.                  |
| password       | Alphanumérique      | Mot de passe de l'utilisateur (sécurisé).         |
| user_role      | Booléen             | Rôle de l'utilisateur (administrateur, etc.).     |
| fav_movie      | Booléen             | Film préféré de l'utilisateur (oui/non).           |

### Table "Movie"
| Champ          | Type de Données    | Description                             |
|----------------|---------------------|-----------------------------------------|
| id_Movie       | Numérique           | Identifiant unique du film.             |
| title          | Alphanumérique      | Titre du film.                          |
| duration       | Numérique           | Durée du film en minutes.              |
| date           | Numérique           | Date de sortie du film.                |

### Table "Director"
| Champ          | Type de Données    | Description                             |
|----------------|---------------------|-----------------------------------------|
| id_Director    | Numérique           | Identifiant unique du réalisateur.     |
| firstname      | Alphabétique        | Prénom du réalisateur.                  |
| lastname       | Alphabétique        | Nom du réalisateur.                     |
