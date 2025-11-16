import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tictactoe/data/services/firestore.client.dart';

part 'firestore.service.provider.g.dart';

/// Provides the shared [FirestoreClient] instance.
@Riverpod(keepAlive: true)
FirestoreClient firestoreClient(Ref ref) {
  return FirestoreClient();
}
