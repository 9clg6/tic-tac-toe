import 'package:tictactoe/domain/params/claim_next_player_slot.param.dart';
import 'package:tictactoe/domain/repositories/online.repository.dart';
import 'package:tictactoe/foundation/interfaces/future.usecases.dart';

/// Assigns the next available player id for an online game.
class ClaimNextPlayerSlotUseCase
    extends FutureUseCaseWithParams<int, ClaimNextPlayerSlotParam> {
  /// Creates a [ClaimNextPlayerSlotUseCase] with the given [repository].
  ClaimNextPlayerSlotUseCase({required this.repository});

  /// The repository used to manage online game state and operations.
  final OnlineRepository repository;

  @override
  Future<int> invoke(ClaimNextPlayerSlotParam params) {
    return repository.claimNextPlayerSlot(params.gameId);
  }
}
