import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tictactoe/data/datasources/remote/online_game.remote.data_source.dart';
import 'package:tictactoe/data/model/remote/online_game.remote.model.dart';
import 'package:tictactoe/data/services/firestore.client.dart';

/// Implementation backed by [FirestoreClient].
/// Default implementation of [OnlineGameRemoteDataSource].
final class OnlineGameRemoteDataSourceImpl
    implements OnlineGameRemoteDataSource {
  /// Builds the data source using the shared [FirestoreClient].
  OnlineGameRemoteDataSourceImpl({required FirestoreClient firestoreClient})
    : _firestoreClient = firestoreClient;

  final FirestoreClient _firestoreClient;

  @override
  /// Creates a new document and returns its representation.
  Future<OnlineGameRemoteModel> createGame() async {
    final String docId = await _firestoreClient.addDocument(
      FirestoreCollections.game,
      OnlineGameRemoteModel.creationPayload(),
    );

    return OnlineGameRemoteModel(id: docId);
  }

  @override
  /// Retrieves a document by id, returning `null` if it does not exist.
  Future<OnlineGameRemoteModel?> getGame(String id) async {
    final Map<String, dynamic>? data = await _firestoreClient.getDocument(
      FirestoreCollections.game,
      id,
    );

    if (data == null) return null;
    return OnlineGameRemoteModel.fromFirestore(id, data);
  }

  @override
  Future<int> claimNextPlayerSlot(String gameId) async {
    final Map<String, dynamic>? data = await _firestoreClient.getDocument(
      FirestoreCollections.game,
      gameId,
    );
    if (data == null) {
      throw Exception('game_not_found');
    }
    final List<dynamic> players =
        data['players'] as List<dynamic>? ?? <dynamic>[];
    final int nextId = data['nextPlayerId'] as int? ?? players.length;

    await _firestoreClient.setDocument(
      FirestoreCollections.game,
      gameId,
      <String, dynamic>{
        'players': FieldValue.arrayUnion(<int>[nextId]),
        'nextPlayerId': nextId + 1,
      },
    );

    return nextId;
  }
}
