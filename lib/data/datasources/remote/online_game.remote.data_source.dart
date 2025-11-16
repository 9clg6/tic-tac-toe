import 'package:tictactoe/data/model/remote/online_game.remote.model.dart';

/// Remote data source responsible for online game Firestore operations.
abstract class OnlineGameRemoteDataSource {
  /// Creates a new online game document.
  Future<OnlineGameRemoteModel> createGame();

  /// Fetches an online game by its identifier.
  Future<OnlineGameRemoteModel?> getGame(String id);

  /// Claims the next available player slot and returns the assigned id.
  Future<int> claimNextPlayerSlot(String gameId);
}
