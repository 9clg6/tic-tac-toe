import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tictactoe/core/providers/data/repositories/online.repository.provider.dart';
import 'package:tictactoe/domain/repositories/online.repository.dart';
import 'package:tictactoe/domain/usecases/claim_next_player_slot.use_case.dart';

part 'claim_next_player_slot.use_case.provider.g.dart';

/// Provides [ClaimNextPlayerSlotUseCase].
@riverpod
Future<ClaimNextPlayerSlotUseCase> claimNextPlayerSlotUseCase(Ref ref) async {
  final OnlineRepository repository = await ref.watch(
    onlineRepositoryProvider.future,
  );
  return ClaimNextPlayerSlotUseCase(repository: repository);
}
