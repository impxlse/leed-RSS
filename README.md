# Varcinv-Projet-Lead


## Comment utiliser ce projet
Dans ce fichier vous trouverez les informations sur le déploiement de l'application leed.

## Configuration minimale

## Instructions de deploiement rapide
1. Prérequis
* Docker doit être installé sur votre machine
2. Clonez le repository
```
git clone https://gricad-gitlab.univ-grenoble-alpes.fr/iut2-info-stud/2023-s5/r5-adv-virt/grp-b1/varcinv/varcinv-projet-lead.git
```
3. Modifier les variables d'environnement selon vos besoins (voir section "Variable environnement")
* fichier .env à modifier
4. Déployer l'application
```
docker-compose up
```
5. Accédez à Leed
* Ouvrez votre navigateur et accédez à http://localhost:8080 (ou le port spécifié dans votre fichier .env).

## Variable environnement
Dans le dossier my-leed-docker se trouve le fichier .env qui contient toute les variables d'environnement utiliser par docker-compose. Pour Effectuer des modifications au conteneur lancer par docker-compose il faut modifier les valeurs des variables dans le .env

Description des variables :

    PORT_WEB=8080 :
        Port sur lequel le serveur web Leed sera exposé. Vous pouvez accéder à Leed en utilisant l'adresse http://localhost:8080 si vous exécutez localement.

    PORT_DB=3306 :
        Port sur lequel le serveur MySQL (base de données) sera exposé. Il est utilisé pour établir une connexion entre le serveur web Leed et la base de données.

    MYSQL_DATABASE=leeddb :
        Nom de la base de données MySQL que Leed utilisera pour stocker ses données.

    MYSQL_USER=leeduser :
        Nom de l'utilisateur MySQL qui sera utilisé par Leed pour se connecter à la base de données.

    MYSQL_PASSWORD=leedpwd :
        Mot de passe de l'utilisateur MySQL (leeduser).

    MYSQL_ROOT_PASSWORD=rootpwd :
        Mot de passe de l'utilisateur root MySQL. Cela est utilisé pour les opérations d'administration de la base de données.

    MYSQL_HOST=leed-database :
        Nom du service du conteneur Docker qui héberge la base de données MySQL.

    LEED_ADMIN_USER=root :
        Nom d'utilisateur administrateur pour l'interface d'administration de Leed.

    LEED_ADMIN_PASSWORD=root :
        Mot de passe de l'utilisateur administrateur pour l'interface d'administration de Leed.
