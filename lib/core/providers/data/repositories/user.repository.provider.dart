import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tictactoe/core/providers/data/datasources/remote/user.remote.data_source.provider.dart';
import 'package:tictactoe/data/datasources/remote/user.remote.data_source.dart';
import 'package:tictactoe/data/repositories/user.repository.impl.dart';
import 'package:tictactoe/domain/repositories/user.repository.dart';

part 'user.repository.provider.g.dart';

/// User repository provider
@riverpod
Future<UserRepository> userRepository(Ref ref) async {
  final UserRemoteDataSource userRemoteDataSource = await ref.watch(
    userRemoteDataSourceProvider.future,
  );

  return UserRepositoryImpl(userRemoteDataSource: userRemoteDataSource);
}
