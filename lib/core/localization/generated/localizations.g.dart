// DO NOT EDIT. This is code generated via package:easy_localization/generate.dart

// ignore_for_file: prefer_single_quotes, avoid_renaming_method_parameters, constant_identifier_names

import 'dart:ui';

import 'package:easy_localization/easy_localization.dart' show AssetLoader;

class CodegenLoader extends AssetLoader{
  const CodegenLoader();

  @override
  Future<Map<String, dynamic>?> load(String path, Locale locale) {
    return Future.value(mapLocales[locale.toString()]);
  }

  static const Map<String,dynamic> _fr = {
  "game": {
    "playerXwon": "Le joueur {} a gagné",
    "restart": "Restart",
    "leave": "Quitter",
    "yourTurn": "C'est ton tour !"
  },
  "home": {
    "startButton": "Démarrer"
  },
  "gameLobby": {
    "title": "Lobby",
    "readyPlayers": "Joueurs prêts :",
    "addPlayer": "Ajouter un joueur",
    "startGame": "Lancer la partie",
    "playerLabel": "Joueur {}",
    "gameStartingSoon": "La partie va bientôt démarrer",
    "waitingOthers": "En attente des autres joueurs",
    "readyButton": "Prêt ?"
  },
  "lobby": {
    "title": "Lobby",
    "modeQuestion": "Choisis ton mode de jeu",
    "localLabel": "Local",
    "onlineLabel": "En ligne",
    "localDescription": "Jouez à deux sur le même téléphone.",
    "onlineDescription": "Affronte un joueur en ligne via matchmaking ou ID.",
    "playLocal": "Jouer en local",
    "joinWithId": "Rejoindre via un identifiant",
    "enterGameId": "ID de la partie",
    "joinButton": "Rejoindre",
    "matchmakingButton": "Trouver un joueur",
    "createGameButton": "Créer une partie",
    "statusMatchFound": "Match trouvé : #{}",
    "statusEnqueued": "Ajouté à la file d'attente (#{}).",
    "statusGameCreated": "Partie créée : #{}",
    "errorJoinIdRequired": "Merci de renseigner un identifiant avant de rejoindre.",
    "errorGameNotFound": "Aucune partie trouvée avec cet identifiant.",
    "errorNoRequest": "Aucun joueur n'attend pour l'instant. Crée une partie ou réessaie plus tard."
  }
};
static const Map<String, Map<String,dynamic>> mapLocales = {"fr": _fr};
}
