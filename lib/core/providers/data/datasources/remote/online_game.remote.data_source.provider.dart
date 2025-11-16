import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tictactoe/core/providers/services/firestore.service.provider.dart';
import 'package:tictactoe/data/datasources/remote/impl/online_game.remote.data_source.impl.dart';
import 'package:tictactoe/data/datasources/remote/online_game.remote.data_source.dart';
import 'package:tictactoe/data/services/firestore.client.dart';

part 'online_game.remote.data_source.provider.g.dart';

/// Provides the remote data source for online games.
@riverpod
OnlineGameRemoteDataSource onlineGameRemoteDataSource(Ref ref) {
  final FirestoreClient firestoreService = ref.watch(firestoreClientProvider);
  return OnlineGameRemoteDataSourceImpl(firestoreClient: firestoreService);
}
