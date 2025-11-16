import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:tictactoe/data/model/remote/online_game_sync.remote.model.dart';
import 'package:tictactoe/firebase_options.dart';

/// Helper around [FirebaseFirestore] exposing a simplified API for CRUD ops.
class FirestoreClient {
  /// Constructor
  FirestoreClient({FirebaseFirestore? firestore})
    : _firestore = firestore ?? FirebaseFirestore.instance;

  final FirebaseFirestore _firestore;
  Future<void>? _initialization;

  /// Ensure Firebase is ready before issuing queries.
  Future<void> _ensureInitialized() {
    return _initialization ??= () async {
      if (Firebase.apps.isEmpty) {
        await Firebase.initializeApp(
          options: DefaultFirebaseOptions.currentPlatform,
        );
      }
    }();
  }

  CollectionReference<Map<String, dynamic>> _collection(String path) =>
      _firestore.collection(path);

  /// Adds a document and returns its id.
  Future<String> addDocument(
    String collectionPath,
    Map<String, dynamic> data,
  ) async {
    await _ensureInitialized();
    final DocumentReference<Map<String, dynamic>> document = await _collection(
      collectionPath,
    ).add(data);
    return document.id;
  }

  /// Sets a document by id.
  Future<void> setDocument(
    String collectionPath,
    String documentId,
    Map<String, dynamic> data, {
    bool merge = true,
  }) async {
    await _ensureInitialized();
    await _collection(
      collectionPath,
    ).doc(documentId).set(data, SetOptions(merge: merge));
  }

  /// Retrieves a document by id.
  Future<Map<String, dynamic>?> getDocument(
    String collectionPath,
    String documentId,
  ) async {
    await _ensureInitialized();
    final DocumentSnapshot<Map<String, dynamic>> snapshot = await _collection(
      collectionPath,
    ).doc(documentId).get();
    return snapshot.data();
  }

  /// Deletes a document by id.
  Future<void> deleteDocument(String collectionPath, String documentId) async {
    await _ensureInitialized();
    await _collection(collectionPath).doc(documentId).delete();
  }

  /// Streams a collection mapped to a strongly typed model.
  Stream<List<T>> collectionStream<T>(
    String collectionPath,
    T Function(Map<String, dynamic> data, String id) mapper,
  ) {
    return _collection(collectionPath).snapshots().map(
      (QuerySnapshot<Map<String, dynamic>> snapshot) => snapshot.docs
          .map(
            (QueryDocumentSnapshot<Map<String, dynamic>> doc) =>
                mapper(doc.data(), doc.id),
          )
          .toList(growable: false),
    );
  }

  /// Returns the first document ordered by [orderByField].
  Future<QueryDocumentSnapshot<Map<String, dynamic>>?> fetchFirstDocument(
    String collectionPath, {
    String orderByField = 'createdAt',
    bool descending = false,
  }) async {
    await _ensureInitialized();
    final QuerySnapshot<Map<String, dynamic>> snapshot = await _collection(
      collectionPath,
    ).orderBy(orderByField, descending: descending).limit(1).get();

    if (snapshot.docs.isEmpty) return null;
    return snapshot.docs.first;
  }

  /// Watches whether a document exists in the given collection.
  Stream<bool> watchDocumentExists(String collectionPath, String documentId) {
    return _collection(collectionPath)
        .doc(documentId)
        .snapshots()
        .map(
          (DocumentSnapshot<Map<String, dynamic>> snapshot) => snapshot.exists,
        );
  }

  /// Watches a document and emits its current data map.
  Stream<OnlineGameSyncRemoteModel> watchDocument(
    String collectionPath,
    String documentId,
  ) {
    return _collection(collectionPath)
        .doc(documentId)
        .snapshots()
        .map(
          (DocumentSnapshot<Map<String, dynamic>> snapshot) =>
              snapshot.data() ?? <String, dynamic>{},
        )
        .map(OnlineGameSyncRemoteModel.fromFirestore);
  }

  /// Appends an action entry to a game's action list.
  Future<void> appendGameAction(
    String gameId,
    Map<String, dynamic> action,
  ) async {
    await _ensureInitialized();
    await _collection(FirestoreCollections.game).doc(gameId).update(
      <String, dynamic>{
        'actions': FieldValue.arrayUnion(<Map<String, dynamic>>[action]),
      },
    );
  }

  /// Clears all recorded actions for an online game.
  Future<void> clearGameActions(String gameId) async {
    await _ensureInitialized();
    await _collection(FirestoreCollections.game).doc(gameId).update(
      <String, dynamic>{'actions': <Map<String, dynamic>>[]},
    );
  }
}

/// Known Firestore collection names for the app.
abstract class FirestoreCollections {
  /// Stores online games and their actions.
  static const String game = 'game';

  /// Stores matchmaking requests.
  static const String matchmaking = 'matchmaking';
}
