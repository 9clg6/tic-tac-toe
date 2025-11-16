import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tictactoe/core/providers/services/firestore.service.provider.dart';
import 'package:tictactoe/data/datasources/remote/impl/matchmaking.remote.data_source.impl.dart';
import 'package:tictactoe/data/datasources/remote/matchmaking.remote.data_source.dart';
import 'package:tictactoe/data/services/firestore.client.dart';

part 'matchmaking.remote.data_source.provider.g.dart';

/// Provides the matchmaking remote data source.
@riverpod
MatchmakingRemoteDataSource matchmakingRemoteDataSource(Ref ref) {
  final FirestoreClient firestoreService = ref.watch(firestoreClientProvider);
  return MatchmakingRemoteDataSourceImpl(firestoreClient: firestoreService);
}
