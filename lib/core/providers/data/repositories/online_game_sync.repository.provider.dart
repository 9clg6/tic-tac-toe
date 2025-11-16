import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tictactoe/core/providers/services/firestore.service.provider.dart';
import 'package:tictactoe/data/repositories/online_game_sync.repository.impl.dart';
import 'package:tictactoe/data/services/firestore.client.dart';
import 'package:tictactoe/domain/repositories/online_game_sync.repository.dart';

part 'online_game_sync.repository.provider.g.dart';

/// Provides the Firestore-backed online game sync repository.
@riverpod
OnlineGameSyncRepository onlineGameSyncRepository(Ref ref) {
  final FirestoreClient client = ref.watch(firestoreClientProvider);
  return OnlineGameSyncRepositoryImpl(firestoreClient: client);
}
