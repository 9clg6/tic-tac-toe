import 'dart:math' as math;

import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:tictactoe/core/localization/generated/locale_keys.g.dart';
import 'package:tictactoe/domain/entities/grid.entity.dart';
import 'package:tictactoe/foundation/enum/form.enum.dart' as form_enum;
import 'package:tictactoe/presentation/screens/home/home.state.dart';
import 'package:tictactoe/presentation/screens/home/home.view_model.dart';
import 'package:tictactoe/presentation/widgets/custom_button.dart';
import 'package:tictactoe/presentation/widgets/tappable_componenent.dart';
import 'package:tictactoe/presentation/widgets/text_variant.dart';

/// Home Screem
@RoutePage()
class HomeScreen extends ConsumerStatefulWidget {
  /// Constructor

  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  @override
  Widget build(BuildContext context) {
    final HomeViewModel viewModel = ref.watch(homeViewModelProvider.notifier);

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: OverlayPortal(
            controller: viewModel.portalController,
            overlayChildBuilder: (_) => const _WinnerOverlay(),
            child: _GameGrid(),
          ),
        ),
      ),
    );
  }
}

class _WinnerOverlay extends ConsumerWidget {
  const _WinnerOverlay();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final HomeViewModel viewModel = ref.watch(homeViewModelProvider.notifier);
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    final Size size = MediaQuery.of(context).size;

    return Container(
      width: size.width,
      height: size.height / 15,
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.all(12),
      decoration: BoxDecoration(color: colorScheme.surface),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          TextVariant(
            LocaleKeys.game_playerXwon.tr(
              args: <String>[viewModel.winner!.toString()],
            ),
            variantType: TextVariantType.displaySmall,
            fontSize: 32,
          ),
          const Gap(22),
          CustomButton(
            title: LocaleKeys.game_restart.tr(),
            onTap: viewModel.restartGame,
          ),
          const Gap(22),
          CustomButton(
            title: LocaleKeys.game_leave.tr(),
            onTap: viewModel.leave,
          ),
        ],
      ),
    );
  }
}

class _GameGrid extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final HomeViewModel viewModel = ref.watch(homeViewModelProvider.notifier);
    final HomeState state = ref.watch(homeViewModelProvider);
    final int totalCells = state.grid!.totalCells;
    final int rowColumnLenght = state.grid!.columnsRowsAmount;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 24),
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 24),
              child: Transform.rotate(
                angle: viewModel.shouldRotateBoard ? math.pi : 0,
                child: Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  alignment: WrapAlignment.center,
                  children: List<Widget>.generate(totalCells, (int index) {
                    final int row = index ~/ rowColumnLenght;
                    final int column = index % rowColumnLenght;
                    final form_enum.Form? currentCell =
                        state.grid!.grid[row]?.columns[column]!.form;

                    final Color color = index.isEven
                        ? Colors.white
                        : Colors.grey;

                    final bool canTap = viewModel.canPlay;
                    return TappableComponent(
                      color: color,
                      onTap: canTap
                          ? () => viewModel.tapOnCell(row: row, column: column)
                          : null,
                      child: Container(
                        color: color,
                        width:
                            MediaQuery.of(context).size.width /
                                rowColumnLenght -
                            16,
                        height: 60,
                        alignment: Alignment.center,
                        child: TextVariant(
                          (() {
                            switch (currentCell) {
                              case form_enum.Form.cross:
                                return form_enum.Form.cross.value;
                              case form_enum.Form.circle:
                                return form_enum.Form.circle.value;
                              case form_enum.Form.empty:
                                return form_enum.Form.empty.value;
                              case null:
                                throw UnimplementedError();
                            }
                          })(),
                          variantType: TextVariantType.displaySmall,
                          color: Colors.black,
                        ),
                      ),
                    );
                  }),
                ),
              ),
            ),
          ),
          // Texte du tour en overlay, ne déplace rien sinon
          ...List<Widget>.generate(viewModel.playersLength, (int index) {
            return _PlayerSideMessage(playerNumber: index);
          }),
        ],
      ),
    );
  }
}

class _PlayerSideMessage extends ConsumerWidget {
  const _PlayerSideMessage({this.playerNumber = 0});

  final int playerNumber;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final HomeViewModel viewModel = ref.watch(homeViewModelProvider.notifier);

    if (viewModel.isGameEnded) return const SizedBox.shrink();

    if (viewModel.isOnlineGame && playerNumber != viewModel.localPlayerId) {
      return const SizedBox.shrink();
    }

    final int playersLength = viewModel.playersLength;

    Alignment alignment;
    double? top;
    double? bottom;

    if (playerNumber == 0) {
      alignment = Alignment.topCenter;
      top = 16;
      bottom = null;
    } else if (playerNumber == playersLength - 1) {
      alignment = Alignment.bottomCenter;
      top = null;
      bottom = 16;
    } else {
      alignment = Alignment.center;
      top = null;
      bottom = null;
    }

    Widget message = TextVariant(
      LocaleKeys.game_yourTurn.tr(),
      variantType: TextVariantType.displaySmall,
    );

    if (!viewModel.isOnlineGame && playerNumber == 0) {
      message = RotatedBox(quarterTurns: 2, child: message);
    }

    return Positioned(
      left: 0,
      right: 0,
      top: top,
      bottom: bottom,
      child: AnimatedOpacity(
        opacity: viewModel.playersTurn == playerNumber ? 1.0 : 0.0,
        duration: const Duration(milliseconds: 200),
        child: Align(alignment: alignment, child: message),
      ),
    );
  }
}
