# tic-tac-toe

Jeu TicTacToe Flutter multiplateformes, pour le test technique Betclic Group

## Informations

Différents fichiers Markdown sont disponibles regroupant les informations liés au développement :
- ROADMAP.md : Roadmap contenant objectifs et priorités pour le développement de ce projet
- CHANGELOG.md : Fichiers regroupant et résumants les ajouts et correctifs contenu dans les nouvelles versions

## Carnet de route

Ici je prendrais quelques notes sur l'avancée du développement 

(v1) 14/11 - 23:43 : J'ai optimisé le calcul de vainqueur de 300 microsecondes environ, passant de 1200 à 995. Pour y arriver, j'ai, au lieu de chercher les combinaisons sur chaque case lors de chaque changement, utilisé seulement la dernière action joueur. Puisque au final la dernière action est la seule qui peut déclencher une victoire. 
Je pense pouvoir encore optimiser mon algorithme, en n'utilisant plus les "voisins des cases" avec liste d'exclusion, mais plutôt en splittant mes données en fonction des symboles : croix ensembles, ronds ensembles... et comparer leurs coordonnées directement en cherchant des match dans toutes les directions. (corrigé)

(v1) 16/11 - 12:13 : Je ne suis pas convaincu de la qualité de mon interface joueur (messages + lobby), car ça ne fonctionnera qu'avec deux joueurs. Mais un TicTacToe est que pour 2 joueurs, donc dans l'immédiat ce n'est pas un soucis, sauf pour le Open-Closed Principle. 

(v1) 16/11 - 18:02 : Faire un Firestore Service ne respecte pas la clean archi puisqu'il manipule des composants de la couche data, donc je dois faire son équivalent pour cette dernière, comme un client. (corrigé)

## IA

Dans un soucis de transparence, je noterais ici les éléments générés par IA et la raison de cette utilisation

### ReplaySubject

- Je connaissais le BehaviorSubject pour garder une dernière valeur en mémoire mais l'IA m'a permis de connaitre le ReplaySubject, ce qui me permet de stocker l'historique des actions des joueurs et donc de trigger le checkWinner seulement au bon moment.
Cela évite de stocker une liste dans un BehaviorSubject, ce qui est moins adapté.

### Traductions
 
- Simple à mettre en place mais les traductions demandent de faire pleins d'allers-retours sur des fichiers et ça prend du temps. Ici l'IA n'a pas besoin de cadrage pour effectuer cette tache

### Firestore Client (anciennement service)

- C'est du boilerplate : répétitifs, simple mais nécessaire. On pourrait utiliser le même dans tous les projets.

### Comment doc

- Je manque souvent d'inspiration pour la documentation de code, car souvent les noms s'expliquent par eux-mêmes, donc l'IA generative permet ici d'expliquer efficacement le code


### Tests

- Certains tests sont générés, car pour moi, um bon test doit être pensé, réflechi et concu pour durer. Mais des fois on manque d'objectivité pour leur rédaction, à défaut de faire des TDD, donc la génération de tests permet de rédiger des tests cohérents qui ne manqueront pas de rater en cas de régression.

### Matchmaking

- J'ai demandé à l'IA d'optimiser mon matchmaking, car je voulais un truc très simple mais fonctionnel, il m'a optimisé cela en mettant en place la FIFO, j'avais mis une LIFO. Il a également ajouté le nettoyage de la collection lorsque qu'une partie est rejoint 

# Guide
## Local
Cliquer sur LOCAL, mettre prêt pour chacun des joueurs et cliquer sur les cases.

## Online
Cliquer sur En ligne, puis l'hote (appareil 1) clique sur Créer une partie, ensuite l'autre jour clique sur Trouver un joueur et la partie sera trouvée automatiquement.

# Documentation

TicTacToe, ou Morpion, est un jeu de stratégie ayant pour objectif d'effectuer une serie de 3x la même forme (standard= O, X) dans n'importe quelle direction (haut,bas,diagonale). Lorsque les parties ne soldent pas d'une victoire elles se terminent en nul car toutes les cases sont remplies sans serie. 

### Choix d'algorithme de vérification de victoire

Le design est simple, grille de 3x3, deux symboles. La vraie difficulté réside dans l'algorithme de détection de victoire, car si mal écrit, il peut être peu performant, lent et consommateur en ressources.

Une première version a été développée, sur la base de la récupération de l'ensemble des voisins des cases lors d'un parcours case par case, même non-remplie.
Très rapidement je n'ai pas été satisfait par cette solution, mais elle avait le mérite d'exister, donc je l'ai terminé, déprécié et entamé la V2 de cet algorithme.

Ayant les arbres binaires en tête, j'ai choisi de construire un algorithme basé sur les actions / formes jouées, car une victoire ne peut être qu'une série de 3x fois la même forme suite à une dernière action après 5 actions jouées (XOXOX).

Je commence par récupérer la forme de la dernière action jouée, je filtre mes actions grace à cette dernière, cela me permet de récupérer une liste très réduite d'éléments sur laquelle je pourrai effectuer mon calcul.

Pour détecter la victoire, j'ai peu de choix, j'ai donc choisi de vérifier l'existence d'une forme identique dans une direction N (droite, bas, diagonal gauche/droite) et d'itérer sur les directions restantes en cas de pattern-matching négatif. 

Une grille n'est rien d'autres qu'une matrice à 3 entrées contenant 9 cases ayant pour coordonnées (x;y), donc pour détecter les directions nous pouvons incrémenter x ou y pour chercher si la forme est présente dans notre liste.

#### Optimisation possible

Afin d'optimiser le parcours il serait possible de retirer des éléments de la recherche afin d'accélerer cette dernière. Admettons qu'une grille a 3x3 cases, donc 3 lignes, 3 colonnes, 3 cases pour chaque. Une victoire ne peut être déclenché qu'à la condition d'avoir une série de 3 fois la même forme, donc certaines cases de la grille ne peuvent pas être gagnantes dans aucune/certaines direction.

Par exemple, la grille suivante : 
(a,b,c)
(d,e,f)
(g,h,i)

Les cases de d à i, ne peuvent pas être gagnantes via une série vers le bas ou en diagonale.
La case b ne peut aussi pas gagner en diagonale. 
Puisque le nombre de case adjacentes dans certaines directions n'est pas suffisant.

La logique est la suivante :
- Pour une grille de taille N, une direction n’est possible que si la case considérée laisse assez de place dans cette direction pour qu’une suite de 3 cases soit envisageable.
- Plus on descend (ou avance) dans la grille, moins certaines directions sont possibles.

Formule générale (avec indices ligne `l` et colonne `c` commençant à 0) :
- Horizontale vers la droite : possible si `c <= N-3`
- Verticale vers le bas : possible si `l <= N-3`
- Diagonale descendante droite (`\`) : possible si `l <= N-3` et `c <= N-3`
- Diagonale montante droite (`/`) : possible si `l >= 2` et `c <= N-3`

À chaque nouvelle ligne, il suffit donc d’appliquer ces règles : on élimine toute direction qui ne satisfait pas la condition associée.
Exemple sur grille 3x3 :
- Ligne 0 : toutes les directions possibles.
- Ligne 1 : plus de diagonale descendante possible.
- Ligne 2 : plus de verticale ou diagonale descendante possible, la diagonale montante devient possible.

Cela permet d’optimiser le parcours en ne testant que les directions pertinentes à la position courante.

## Architecture 

- Clean Architecture avec un découpage par écran
- Riverpod avec injection de dépendance via Ref
- Traductions par Easy Localization
- DB Firestore
- Découpage en Usecase / Repository / Data Source
- Attention portée au respect des dépendances entre les couches (domain/data) notamment via le fonctionnement UseCase / Repository (interface).

### Précisions 
#### GameServiceMixin

Cette mixin a pour vocation de partager des comportements partagé tout en définissant des prototypes définissables dans les classes utilisatrices, par exemple configureAfterInitialize, le comportement pourrait ne pas pas être le même dans le mode en ligne que dans le mode local. Donc dans un soucis de respect des principes SOLID, notamment O pour Open-Closed Principle, cette mixin permet de potentiellement étendre des fonctionnements tout en évitant la duplication de code.

#### GitHub Actions

Une Github Actions a été mise en place pour exécuter les tests lors d'une MR et refuser le merge en cas d'échec du job. Cela permet d'eviter les régressions.





