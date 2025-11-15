# tic-tac-toe

Jeu TicTacToe Flutter multiplateformes, pour le test technique Betclic Group

## Informations

Différents fichiers Markdown sont disponibles regroupant les informations liés au développement :
- ROADMAP.md : Roadmap contenant objectifs et priorités pour le développement de ce projet
- CHANGELOG.md : Fichiers regroupant et résumants les ajouts et correctifs contenu dans les nouvelles versions

## Carnet de route

Ici je prendrais quelques notes sur l'avancée du développement 

(v1) 14/11 - 23:43 : J'ai optimisé le calcul de vainqueur de 300 microsecondes environ, passant de 1200 à 995. Pour y arriver, j'ai, au lieu de chercher les combinaisons sur chaque case lors de chaque changement, utilisé seulement la dernière action joueur. Puisque au final la dernière action est la seule qui peut déclencher une victoire. 
Je pense pouvoir encore optimiser mon algorithme, en n'utilisant plus les "voisins des cases" avec liste d'exclusion, mais plutôt en splittant mes données en fonction des symboles : croix ensembles, ronds ensembles... et comparer leurs coordonnées directement en cherchant des match dans toutes les directions.

## IA

Dans un soucis de transparence, je noterais ici les éléments générés par IA et la raison de cette utilisation

## ReplaySubject

- Je connaissais le BehaviorSubject pour garder une dernière valeur en mémoire mais l'IA m'a permis de connaitre le ReplaySubject, ce qui me permet de stocker l'historique des actions des joueurs et donc de trigger le checkWinner seulement au bon moment.
