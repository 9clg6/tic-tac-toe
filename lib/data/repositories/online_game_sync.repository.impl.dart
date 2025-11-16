import 'package:tictactoe/data/model/remote/online_game_sync.remote.model.dart';
import 'package:tictactoe/data/services/firestore.client.dart';
import 'package:tictactoe/domain/entities/online_game_sync.entity.dart';
import 'package:tictactoe/domain/repositories/online_game_sync.repository.dart';

/// Firestore-backed implementation for syncing online games.
class OnlineGameSyncRepositoryImpl implements OnlineGameSyncRepository {
  /// Creates a [OnlineGameSyncRepositoryImpl]
  /// with the provided [FirestoreClient].
  OnlineGameSyncRepositoryImpl({required FirestoreClient firestoreClient})
    : _firestore = firestoreClient;

  final FirestoreClient _firestore;

  @override
  Stream<OnlineGameSyncEntity> watchGame(String gameId) {
    return _firestore
        .watchDocument(FirestoreCollections.game, gameId)
        .map((OnlineGameSyncRemoteModel event) => event.toEntity());
  }

  @override
  Future<void> appendAction(String gameId, Map<String, dynamic> action) {
    return _firestore.appendGameAction(gameId, action);
  }

  @override
  Future<void> clearActions(String gameId) {
    return _firestore.clearGameActions(gameId);
  }
}
