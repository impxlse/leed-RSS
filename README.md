# Deploiement Leed


## Comment utiliser ce projet
Ce projet vous permet de déployer l'application Leed rapidement et facilement à l'aide de Docker. Suivez les instructions ci-dessous pour configurer et lancer votre propre instance Leed. Ce projet est basé sur le code source de [Leed](https://github.com/LeedRSS/Leed), une application de flux RSS.

## Configuration minimale

Assurez-vous d'avoir les éléments suivants installés sur votre machine avant de commencer :

- Docker

Si vous n'avez pas déjà téléchargé l'image MySQL, vous pouvez le faire en utilisant la commande suivante :

```bash
docker pull mysql:latest
```

## Espace de stockage

Voici l'espace de stockage utilisé par le projet :

- **Leed App Image**: Environ 540 MB
- **MySQL Database Image**: Environ 619 MB

**Espace de stockage total utilisé**: Environ 1159 MB

**Notez** : Ces valeurs varient en fonction des versions des images Docker utilisées et des données spécifiques à votre application Leed.


## Instructions de deploiement rapide
Suivez ces étapes simples pour déployer Leed sur votre machine.

### Prérequis
* Docker doit être installé sur votre machine

1. Clonez le repository
```bash
git clone https://gricad-gitlab.univ-grenoble-alpes.fr/iut2-info-stud/2023-s5/r5-adv-virt/grp-b1/varcinv/varcinv-projet-lead.git
```
2. Modifier les variables d'environnement selon vos besoins (voir section "Variable environnement")
* Fichier .env à modifier situé dans le dossier "my-leed-docker"

3. Déployer l'application
* Exécutez la commande suivante dans le dossier my-leed-docker :
```
docker-compose up
```
**Note**: Cette commande doit être exécuté dans le dossier "my-leed-docker", endroit où se situe le fichier docker-compose.yml

4. Accédez à Leed
* Ouvrez votre navigateur et accédez à http://localhost:8080 (ou le port spécifié dans votre fichier .env).

## Variable environnement
Dans le dossier my-leed-docker se trouve le fichier .env qui contient toute les variables d'environnement utiliser par docker-compose. Pour Effectuer des modifications au lancement des conteneur, il faut modifier les valeurs des variables dans le fichier .env

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


## Modes d'Exécution

L'application Leed peux être lancer en choisissant deux modes d'application : `dev` et `prod`.

- **dev**: Ce mode est destinée au développement. Elle inclut des outils supplémentaires tels que xdebug pour faciliter le débogage et l'inspection du code.

- **prod**: `Prod` est optimisée pour le déploiement en production. Elle exclut les outils de développement supplémentaires.

### Xdebug

[Xdebug](https://xdebug.org/) est un outil de débogage et de profilage pour PHP. Il fournit des fonctionnalités telles que le suivi des erreurs, le profilage du code, et l'inspection des variables pour aider les développeurs à identifier et résoudre les problèmes plus efficacement.

### Lancement en Mode Développement

Pour lancer l'application en mode développement, utilisez la commande suivante :

```bash
docker-compose build --build-arg DEV=1
```
La commande docker-compose va créer une nouvelle image contenant le package Xdebug sur laquelle se baser.

Pour lancer l'application en mode Production

``` bash
docker-compose up -d
```
il suffit de lancer les conteneurs avec docker-compose, ce qui va créer l'image sans le package Xdebug

