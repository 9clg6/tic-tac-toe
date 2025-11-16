import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tictactoe/core/providers/data/datasources/remote/matchmaking.remote.data_source.provider.dart';
import 'package:tictactoe/core/providers/data/datasources/remote/online_game.remote.data_source.provider.dart';
import 'package:tictactoe/data/datasources/remote/matchmaking.remote.data_source.dart';
import 'package:tictactoe/data/datasources/remote/online_game.remote.data_source.dart';
import 'package:tictactoe/data/repositories/online.repository.impl.dart';
import 'package:tictactoe/domain/repositories/online.repository.dart';

part 'online.repository.provider.g.dart';

/// Provides [OnlineRepository].
@riverpod
Future<OnlineRepository> onlineRepository(Ref ref) async {
  final OnlineGameRemoteDataSource gameRemote = ref.watch(
    onlineGameRemoteDataSourceProvider,
  );
  final MatchmakingRemoteDataSource matchmakingRemote = ref.watch(
    matchmakingRemoteDataSourceProvider,
  );

  return OnlineRepositoryImpl(
    gameRemoteDataSource: gameRemote,
    matchmakingRemoteDataSource: matchmakingRemote,
  );
}
