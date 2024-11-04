# Labyrinthe 2D

Ce projet implémente un jeu de labyrinthe 2D développé dans le cadre du cours « Architecture des ordinateurs, langage d’assemblage ». Le programme source est contenu dans le fichier `mainFinalTEXTURE.X68`.

## Objectif du projet

L'objectif de ce projet est de créer un jeu interactif où le joueur doit naviguer à travers un labyrinthe généré aléatoirement et atteindre la case de sortie. Le jeu comporte 5 niveaux, chacun avec un labyrinthe différent.

## Fonctionnalités

- **Génération de labyrinthes** : Un algorithme génère aléatoirement les labyrinthes avec un point de départ et un point d'arrivée fixes.
- **Navigation** : Se déplacer dans le labyrinthe avec les touches **QZSD** si vous êtes en AZERTY ou **AWSD** si vous êtes en QWERTY.
- **Conditions de victoire** : Afin de terminer un niveau, vous devrez atteindre la case rouge en bas à droite de l’écran.
- **Arrêt du jeu** : Appuyer sur la touche **ESC** pour quitter le jeu à tout moment.

## Structure du projet

- **`mainFinalTEXTURE.X68`** : Contient le code source principal du jeu.
- **Algorithme de génération** : Utilise des techniques de programmation en assembleur pour créer des chemins aléatoires dans le labyrinthe.
- **Fonctionnalité d'affichage** : Dessin de l'interface graphique, affichage des murs et des chemins avec des textures.

## Fonctionnement de l'algorithme

L'algorithme de génération du labyrinthe suit un processus structuré :

1. **Initialisation de la MAP** : Création d'une matrice où les cases rouges sont définies comme « 0 » (chemins) et les cases bleues comme « 1 » (murs).
2. **Génération aléatoire des chemins** :
   - Utilisation d'une fonction `RAND` basée sur des manipulations de bits et `GET_TIME` pour générer des valeurs aléatoires.
   - Un point de départ est initialisé à `[1,1]`, et l'algorithme génère des chemins en suivant des règles spécifiques, déterminant les cases à relier entre elles.
3. **Affichage du labyrinthe** :
   - Dessin des cases avec des dimensions de 20x20 pixels.
   - Utilisation de textures pour les murs et couleurs spécifiques pour les différentes cases.

![Schéma de fonctionnement](./Algorithme_Generation.png)

## Utilisation

### Prérequis

Ce projet est écrit en langage Assembleur 68K. Assurez-vous d'avoir un environnement d'exécution approprié pour pouvoir exécuter le programme, 
par exemple le Simulateur [Easy68K](http://www.easy68k.com).

### Compilation et exécution

Compilez le projet avec un assembleur approprié, puis lancez le programme en utilisant le fichier `mainFinalTEXTURE.X68`. Le jeu commencera et affichera l'état initial. Le joueur peut alors interagir avec le labyrinthe jusqu'à atteindre la sortie.

## Contributeurs
- [elyes06](https://github.com/medjani_elyes)
