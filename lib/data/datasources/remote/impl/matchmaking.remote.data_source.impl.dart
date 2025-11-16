import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tictactoe/data/datasources/remote/matchmaking.remote.data_source.dart';
import 'package:tictactoe/data/model/remote/matchmaking_request.remote.model.dart';
import 'package:tictactoe/data/services/firestore.client.dart';

/// Implementation backed by [FirestoreClient].
/// Default implementation of [MatchmakingRemoteDataSource].
final class MatchmakingRemoteDataSourceImpl
    implements MatchmakingRemoteDataSource {
  /// Builds the data source using [FirestoreClient].
  MatchmakingRemoteDataSourceImpl({required FirestoreClient firestoreClient})
    : _firestoreClient = firestoreClient;

  final FirestoreClient _firestoreClient;

  @override
  /// Fetches the earliest matchmaking request.
  Future<MatchmakingRequestRemoteModel?> fetchOldestRequest() async {
    final QueryDocumentSnapshot<Map<String, dynamic>>? snapshot =
        await _firestoreClient.fetchFirstDocument(
          FirestoreCollections.matchmaking,
        );

    if (snapshot == null || snapshot.data().isEmpty) return null;

    return MatchmakingRequestRemoteModel.fromFirestore(
      snapshot.id,
      snapshot.data(),
    );
  }

  @override
  /// Enqueues a new matchmaking request tied to [gameId].
  Future<MatchmakingRequestRemoteModel> createRequest(String gameId) async {
    final String requestId = await _firestoreClient.addDocument(
      FirestoreCollections.matchmaking,
      MatchmakingRequestRemoteModel.creationPayload(gameId),
    );

    return MatchmakingRequestRemoteModel(id: requestId, gameId: gameId);
  }

  @override
  /// Deletes the request with the provided [requestId].
  Future<void> deleteRequest(String requestId) async {
    await _firestoreClient.deleteDocument(
      FirestoreCollections.matchmaking,
      requestId,
    );
  }

  @override
  Stream<bool> watchRequestConsumed(String requestId) {
    return _firestoreClient
        .watchDocumentExists(FirestoreCollections.matchmaking, requestId)
        .map((bool exists) => !exists);
  }
}
