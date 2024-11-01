# Hello World Docker Application

Ce projet contient une application Python simple qui affiche "Hello, World!" en couleur dans un terminal. 
Cette application est emballée dans un conteneur Docker pour une utilisation facile.

## Prérequis

Avant de commencer, assurez-vous d'avoir les éléments suivants installés :

### Ubuntu
```
sudo apt install software-properties-common curl apt-transport-https ca-certificates -y
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/trusted.gpg.d/docker-archive-keyring.gpg
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo apt install docker-ce docker-ce-cli containerd.io uidmap -y
sudo systemctl status docker
docker version
wget https://desktop.docker.com/linux/main/amd64/docker-desktop-4.19.0-amd64.deb ; sudo chmod 775 ./*.deb
sudo apt install ./docker-desktop-*-amd64.deb
```
### Windows avec powershell
Ouvrez PowerShell : Lancez PowerShell en tant qu'administrateur (clic droit sur l'icône PowerShell et sélectionnez "Exécuter en tant qu'administrateur").
Exécutez la commande suivante pour permettre l'exécution de scripts :
```Set-ExecutionPolicy Remoteigned ```
Double clic sur `InstallDocker.ps1`

## Structure du projet

```properties
Docker-HelloWorld/
├── Dockerfile
├── Hello.py
└── requirements.txt
```

- `Dockerfile` : Fichier de configuration pour créer l'image Docker.
- `Hello.py` : Script Python qui affiche "Hello, World!".
- `requirements.txt` : Liste des dépendances Python (dans ce cas, `colorama`).

## Installation

1. **Clonez ce dépôt ou téléchargez les fichiers** :

   ```properties
   git clone &lt;URL_DU_DEPOT&gt;
   cd Docker-HelloWorld
   ```

2. **Construisez l'image Docker** :

   ```properties
   sudo docker build -t hello-world-app .
   ```

## Exécution

Pour exécuter l'application :

1. **Exécutez le conteneur avec accès au bureau** :

   ```properties
   sudo docker run -it --rm hello-world-app
   ```

2. **Copiez le fichier lanceur `HelloWorld.desktop` sur votre bureau manuellement à partir du dossier du projet.**

3. **Double-cliquez sur le fichier `HelloWorld.desktop` sur votre bureau pour exécuter l'application.**

## Utilisation

Lorsque vous exécutez l'application, elle affichera "Hello, World!" en vert. Appuyez sur Entrée pour fermer le terminal.

## Remarques

- Si vous n'avez pas d'icône ou si l'icône ne s'affiche pas correctement, vous pouvez modifier le chemin de l'icône dans le fichier `HelloWorld.desktop`.
- Ce projet est un exemple simple pour montrer comment encapsuler une application Python dans un conteneur Docker. N'hésitez pas à l'adapter et à l'étendre selon vos besoins.

## Contribuer

Les contributions sont les bienvenues ! Si vous souhaitez améliorer ce projet, n'hésitez pas à soumettre une pull request.

## License

Ce projet est sous licence CCBY. Voir le fichier `LICENSE` pour plus d'informations.
