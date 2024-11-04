# Labyrinthe 2D

Ce projet implémente un jeu de labyrinthe 2D en langage d’assemblage, développé pour explorer les concepts d’architecture d’ordinateurs et de génération procédurale de chemins.

## Objectif du projet

L'objectif de ce projet est de créer un jeu dans lequel le joueur doit naviguer dans un labyrinthe généré aléatoirement pour atteindre une sortie. Le jeu comporte 5 niveaux, chacun étant généré de façon unique à chaque partie.

## Fonctionnalités

- **Génération aléatoire de labyrinthes** : Chaque niveau est un labyrinthe unique généré par un algorithme procédural.
- **Mouvements du joueur** : Se déplacer avec les touches `QZSD` (clavier AZERTY) ou `AWSD` (clavier QWERTY).
- **Gestion de la fin de niveau** : Atteindre la case rouge en bas à droite pour terminer le niveau.
- **Textures et couleurs** : Utilisation de textures pour les murs et de couleurs pour indiquer le chemin, la position de départ et la sortie.

## Algorithme de génération du chemin

L'algorithme de génération du labyrinthe repose sur la création de chemins aléatoires en suivant des étapes spécifiques, avec un point de départ et un point d'arrivée fixes. Voici le détail de l'algorithme :

### Étapes de l'algorithme

1. **Initialisation de la MAP** :
   - La MAP est une matrice où chaque cellule est soit un chemin (`0` pour rouge), soit un mur (`1` pour bleu).
   - La matrice est initialisée avec un point de départ en haut à gauche et un point de sortie en bas à droite.

2. **Génération aléatoire (fonction `RAND`)** :
   - Une fonction `RAND` utilise le temps système pour produire des valeurs aléatoires, assurant que chaque labyrinthe est unique.
   
3. **Positionnement initial** :
   - Le point de départ est fixé à `[1,1]` et marqué comme chemin (`3`). L'algorithme débute en explorant les cellules voisines pour former un chemin.

4. **Expansion du chemin avec la variable Δ** :
   - `Δ` représente la distance autour du point de départ où l'algorithme cherche des cellules disponibles. Si aucune case proche n'est libre, `Δ` augmente de `2` pour élargir la zone de recherche.

5. **Sélection des cases de destination** :
   - Un tableau `TAB_POINT` enregistre deux coordonnées candidates `[x1, y1]` et `[x2, y2]` pour le chemin.
   - L'algorithme identifie les cases rouges les plus proches du départ et les ajoute à `TAB_POINT` pour une exploration continue.

![Schéma de fonctionnement](./SchémaEtapes.png)

6. **Expansion aléatoire des chemins** :
   - Un dé est utilisé pour choisir une case dans `TAB_POINT`.
   - Une seconde case proche avec un chemin (`3`) est choisie et reliée au chemin existant, créant ainsi un parcours sinueux.

7. **Progression du labyrinthe** :
   - Tant que `Δ` ne dépasse pas la taille de la MAP, l'algorithme continue d'expansion en connectant de nouvelles cases de manière aléatoire autour du chemin.
   
8. **Positionnement des points de SPAWN et de WIN** :
   - Le point de départ `[1,1]` est marqué comme SPAWN (`0`), tandis que le point de sortie `[31,23]` est marqué comme WIN (`2`).

### Affichage et Génération finale

Le labyrinthe est affiché avec des textures et des couleurs :
- Les murs sont rendus avec des textures murales personnalisées,
- Les chemins avec une couleur spécifique,
- La sortie est mise en évidence pour guider le joueur.

## Contrôles

1. Lancer le programme via `mainFinalTEXTURE.X68`.
2. Appuyer sur une touche (sauf `ESC`) pour démarrer.
3. Utiliser `QZSD` (AZERTY) ou `AWSD` (QWERTY) pour déplacer le joueur.
4. Atteindre la case rouge en bas à droite pour compléter le niveau.
5. Appuyer sur `ESC` pour quitter en cours de partie.

## Compilation et Exécution

Pour compiler et exécuter le projet, veuillez vous assurer d'avoir l'environnement adéquat, vous pouvez installer [Easy68K](http://www.easy68k.com/).

## Contributeur

- [elyes06](https://github.com/elyes06)
- [yuuji-dev](https://github.com/yuuji-dev)
