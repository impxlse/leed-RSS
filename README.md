# Varcinv-Projet-Lead

## Compte Rendu

Dans ce compte Rendu, j'explique la démarche que j'ai adopté pour déployer l'application leed sur un server web accessible localement depuuis ma machine hôte

## Dépendance de l'application Leed
Avant de commencer à déployer l'application celle-ci necessite quelques dépendance à satisfaire.

- Un server Apache
- PHP avec une version 7.2 minimum
- Une base de donnée MySQL

## Structure de l'architecture
Concernant l'infrastructure du projet nous allons obtenir :
- Un server web
- Un server de base de donnée

les deux serveurs doivent pouvoir communiquer entre eux et donc se situer sur le meme réseau.

## Build image
J'utilise un Dockerfile pour build une image que je souhaite utiliser comme base pour mon server web.

Tout d'abord, comme base d'image j'utilise php:apache
qui pourra sastifaire facilement la version php requise ainsi que le service apache. 

la version php sur l'image est la version PHP 8.3.0
Pour que l'image contienne le code source de l'application Leed

J'utilise ARG pour stocker le numero de version du code source pour qu'il soit modifier facilement quand de nouvel release sorte

```
ARG ver=1.14.0 
```

J'utilise curl pour récupérer l'archive la plus récente du projet puis je décompresse le projet dans le conteneu (Voir code ci-dessous).
```
RUN curl -L -o v1.14.0.tar.gz https://github.com/LeedRSS/Leed/archive/refs/tags/v1.14.0.tar.gz && \
    tar -xf v1.14.0.tar.gz -C /var/www/html --strip-components=1 && \
    rm v1.14.0.tar.gz 
```
Pour que le server soit correctement configuré nous avons besoin de donnée des autorisation adéquat à celui-ci 

```
RUN chown -R www-data:www-data /var/www/html
```

Ensuite j'expose le port 80 du conteneur

```
EXPOSE 80
```
Je lance ensuite apache en fond pour qu'il soit déja executé au lancement du conteneur

```
CMD ["apache2-foreground"]
```

enfin pour resoudre les erreur d'extension de MySQLi et GD pour PHP

il faut les activer ce qui est fait à la fin de mon Dockerfile

```
RUN docker-php-ext-configure mysqli && docker-php-ext-install -j$(nproc) mysqli
RUN docker-php-ext-configure gd && docker-php-ext-install -j$(nproc) gd
```

## Lancement des conteneurs
Concernant le lancement des conteneurs, cela se passe au niveau du fichier "docker-compose.yml" contrairement au Dockerfile qui va construire une 

## Variable d'environnement
dans le fichier .env 
on peut retrouver les variables d'environnement utilisé :
```
# WEB
PORT_WEB=8080

# SQL
PORT_DB=3306
MYSQL_DATABASE=leeddb
MYSQL_USER=leeduser
MYSQL_PASSWORD=leedpwd
MYSQL_ROOT_PASSWORD=rootpwd
```

## Source
Je remercie Timothé Taboada pour m'avoir aidé à comprendre comment réussir à effectuer une requete http pour remplir le formulaire demandée par l'application leed.
En guise de remerciement nous avons tous les deux effectués une transaction d'un montant de 300 000 euros ce qui me semble convenable vu les tarifs habituels de timothé. ;) 

## Getting started

To make it easy for you to get started with GitLab, here's a list of recommended next steps.

Already a pro? Just edit this README.md and make it your own. Want to make it easy? [Use the template at the bottom](#editing-this-readme)!

## Add your files

- [ ] [Create](https://docs.gitlab.com/ee/user/project/repository/web_editor.html#create-a-file) or [upload](https://docs.gitlab.com/ee/user/project/repository/web_editor.html#upload-a-file) files
- [ ] [Add files using the command line](https://docs.gitlab.com/ee/gitlab-basics/add-file.html#add-a-file-using-the-command-line) or push an existing Git repository with the following command:

```
cd existing_repo
git remote add origin https://gricad-gitlab.univ-grenoble-alpes.fr/iut2-info-stud/2023-s5/r5-adv-virt/grp-b1/varcinv/varcinv-projet-lead.git
git branch -M main
git push -uf origin main
```

## Integrate with your tools

- [ ] [Set up project integrations](https://gricad-gitlab.univ-grenoble-alpes.fr/iut2-info-stud/2023-s5/r5-adv-virt/grp-b1/varcinv/varcinv-projet-lead/-/settings/integrations)

## Collaborate with your team

- [ ] [Invite team members and collaborators](https://docs.gitlab.com/ee/user/project/members/)
- [ ] [Create a new merge request](https://docs.gitlab.com/ee/user/project/merge_requests/creating_merge_requests.html)
- [ ] [Automatically close issues from merge requests](https://docs.gitlab.com/ee/user/project/issues/managing_issues.html#closing-issues-automatically)
- [ ] [Enable merge request approvals](https://docs.gitlab.com/ee/user/project/merge_requests/approvals/)
- [ ] [Set auto-merge](https://docs.gitlab.com/ee/user/project/merge_requests/merge_when_pipeline_succeeds.html)

## Test and Deploy

Use the built-in continuous integration in GitLab.

- [ ] [Get started with GitLab CI/CD](https://docs.gitlab.com/ee/ci/quick_start/index.html)
- [ ] [Analyze your code for known vulnerabilities with Static Application Security Testing (SAST)](https://docs.gitlab.com/ee/user/application_security/sast/)
- [ ] [Deploy to Kubernetes, Amazon EC2, or Amazon ECS using Auto Deploy](https://docs.gitlab.com/ee/topics/autodevops/requirements.html)
- [ ] [Use pull-based deployments for improved Kubernetes management](https://docs.gitlab.com/ee/user/clusters/agent/)
- [ ] [Set up protected environments](https://docs.gitlab.com/ee/ci/environments/protected_environments.html)

***

# Editing this README

When you're ready to make this README your own, just edit this file and use the handy template below (or feel free to structure it however you want - this is just a starting point!). Thanks to [makeareadme.com](https://www.makeareadme.com/) for this template.

## Suggestions for a good README

Every project is different, so consider which of these sections apply to yours. The sections used in the template are suggestions for most open source projects. Also keep in mind that while a README can be too long and detailed, too long is better than too short. If you think your README is too long, consider utilizing another form of documentation rather than cutting out information.

## Name
Choose a self-explaining name for your project.

## Description
Let people know what your project can do specifically. Provide context and add a link to any reference visitors might be unfamiliar with. A list of Features or a Background subsection can also be added here. If there are alternatives to your project, this is a good place to list differentiating factors.

## Badges
On some READMEs, you may see small images that convey metadata, such as whether or not all the tests are passing for the project. You can use Shields to add some to your README. Many services also have instructions for adding a badge.

## Visuals
Depending on what you are making, it can be a good idea to include screenshots or even a video (you'll frequently see GIFs rather than actual videos). Tools like ttygif can help, but check out Asciinema for a more sophisticated method.

## Installation
Within a particular ecosystem, there may be a common way of installing things, such as using Yarn, NuGet, or Homebrew. However, consider the possibility that whoever is reading your README is a novice and would like more guidance. Listing specific steps helps remove ambiguity and gets people to using your project as quickly as possible. If it only runs in a specific context like a particular programming language version or operating system or has dependencies that have to be installed manually, also add a Requirements subsection.

## Usage
Use examples liberally, and show the expected output if you can. It's helpful to have inline the smallest example of usage that you can demonstrate, while providing links to more sophisticated examples if they are too long to reasonably include in the README.

## Support
Tell people where they can go to for help. It can be any combination of an issue tracker, a chat room, an email address, etc.

## Roadmap
If you have ideas for releases in the future, it is a good idea to list them in the README.

## Contributing
State if you are open to contributions and what your requirements are for accepting them.

For people who want to make changes to your project, it's helpful to have some documentation on how to get started. Perhaps there is a script that they should run or some environment variables that they need to set. Make these steps explicit. These instructions could also be useful to your future self.

You can also document commands to lint the code or run tests. These steps help to ensure high code quality and reduce the likelihood that the changes inadvertently break something. Having instructions for running tests is especially helpful if it requires external setup, such as starting a Selenium server for testing in a browser.

## Authors and acknowledgment
Show your appreciation to those who have contributed to the project.

## License
For open source projects, say how it is licensed.

## Project status
If you have run out of energy or time for your project, put a note at the top of the README saying that development has slowed down or stopped completely. Someone may choose to fork your project or volunteer to step in as a maintainer or owner, allowing your project to keep going. You can also make an explicit request for maintainers.
