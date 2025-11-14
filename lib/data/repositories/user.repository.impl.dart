import 'package:tictactoe/data/datasources/remote/user.remote.data_source.dart';
import 'package:tictactoe/data/model/remote/user.remote.model.dart';
import 'package:tictactoe/domain/entities/user.entity.dart';
import 'package:tictactoe/domain/repositories/user.repository.dart';

/// User Repository
final class UserRepositoryImpl extends UserRepository {
  /// User Repository constructor
  UserRepositoryImpl({required UserRemoteDataSource userRemoteDataSource})
    : _userRemoteDataSource = userRemoteDataSource;

  /// data source
  final UserRemoteDataSource _userRemoteDataSource;

  @override
  Future<UserEntity> getUser() async {
    final List<UserRemoteModel> userRemoteModels = await _userRemoteDataSource
        .getUser();

    return UserEntity.fromRemote(userRemoteModels.first);
  }
}
