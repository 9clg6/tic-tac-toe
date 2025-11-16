import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tictactoe/domain/entities/cell_coordinates.entity.dart';
import 'package:tictactoe/domain/entities/online_game_sync.entity.dart';
import 'package:tictactoe/domain/entities/player_action.entity.dart';
import 'package:tictactoe/domain/params/append_online_game_action.param.dart';
import 'package:tictactoe/domain/params/clear_online_game_actions.param.dart';
import 'package:tictactoe/domain/params/watch_online_game_sync.param.dart';
import 'package:tictactoe/domain/services/online_game.service.dart';
import 'package:tictactoe/domain/usecases/append_online_game_action.use_case.dart';
import 'package:tictactoe/domain/usecases/clear_online_game_actions.use_case.dart';
import 'package:tictactoe/domain/usecases/watch_online_game_sync.use_case.dart';
import 'package:tictactoe/foundation/enum/form.enum.dart';

class _MockAppendUseCase extends Mock
    implements AppendOnlineGameActionUseCase {}

class _MockClearUseCase extends Mock implements ClearOnlineGameActionsUseCase {}

class _MockWatchUseCase extends Mock implements WatchOnlineGameSyncUseCase {}

class _FakeAppendParam extends Fake implements AppendOnlineGameActionParam {
  @override
  String get gameId => 'fake';

  @override
  Map<String, dynamic> get action => const <String, dynamic>{};
}

class _FakeClearParam extends Fake implements ClearOnlineGameActionsParam {
  @override
  String get gameId => 'fake';
}

class _FakeWatchParam extends Fake implements WatchOnlineGameSyncParam {
  @override
  String get gameId => 'fake';
}

void main() {
  setUpAll(() {
    registerFallbackValue(_FakeAppendParam());
    registerFallbackValue(_FakeClearParam());
    registerFallbackValue(_FakeWatchParam());
  });

  late _MockAppendUseCase appendUseCase;
  late _MockClearUseCase clearUseCase;
  late _MockWatchUseCase watchUseCase;

  OnlineGameService buildService(Stream<OnlineGameSyncEntity>? stream) {
    appendUseCase = _MockAppendUseCase();
    clearUseCase = _MockClearUseCase();
    watchUseCase = _MockWatchUseCase();

    when(() => appendUseCase.invoke(any())).thenAnswer((_) async {});
    when(() => clearUseCase.invoke(any())).thenAnswer((_) async {});
    when(
      () => watchUseCase.invoke(any()),
    ).thenAnswer((_) => stream ?? const Stream<OnlineGameSyncEntity>.empty());

    return OnlineGameService(
      appendActionUseCase: appendUseCase,
      clearOnlineGameActionsUseCase: clearUseCase,
      watchOnlineGameSyncUseCase: watchUseCase,
    );
  }

  test('plays invoke append use case when online', () async {
    buildService(null)
      ..initialize(isOnlineGame: true, onlineGameId: 'game-id')
      ..play(0, const CellCoordinates(rowNumber: 0, columnNumber: 0));

    await Future<void>.delayed(Duration.zero);

    final AppendOnlineGameActionParam captured =
        verify(() => appendUseCase.invoke(captureAny())).captured.single
            as AppendOnlineGameActionParam;

    expect(captured.gameId, 'game-id');
    expect(captured.action['playerNumber'], 0);
    expect(captured.action['row'], 0);
    expect(captured.action['column'], 0);

    verify(() => watchUseCase.invoke(any())).called(1);
  });

  test('resetOnlineGameState clears remote history', () async {
    final OnlineGameService service = buildService(null)
      ..initialize(isOnlineGame: true, onlineGameId: 'sync-id');

    await service.resetOnlineGameState();

    final ClearOnlineGameActionsParam captured =
        verify(() => clearUseCase.invoke(captureAny())).captured.single
            as ClearOnlineGameActionsParam;
            
    expect(captured.gameId, 'sync-id');
  });

  test('remote actions received through stream update the grid', () async {
    final StreamController<OnlineGameSyncEntity> controller =
        StreamController<OnlineGameSyncEntity>();
    addTearDown(controller.close);

    final OnlineGameService service = buildService(controller.stream)
      ..initialize(isOnlineGame: true, onlineGameId: 'remote-game');

    final PlayerAction remoteAction = PlayerAction(
      playerNumber: 0,
      coordinates: const CellCoordinates(rowNumber: 0, columnNumber: 0),
      form: Form.cross,
    );

    controller.add(OnlineGameSyncEntity(actions: <PlayerAction>[remoteAction]));

    await Future<void>.delayed(const Duration(milliseconds: 10));

    expect(service.grid, isNotNull);
    expect(service.grid!.grid[0]!.columns[0]!.form, equals(Form.cross));

    verify(() => watchUseCase.invoke(any())).called(1);
    verifyNever(() => appendUseCase.invoke(any()));
  });
}
