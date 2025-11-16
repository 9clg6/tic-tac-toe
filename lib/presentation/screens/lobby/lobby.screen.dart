import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:tictactoe/core/localization/generated/locale_keys.g.dart';
import 'package:tictactoe/domain/entities/player.entity.dart';
import 'package:tictactoe/presentation/screens/lobby/lobby.state.dart';
import 'package:tictactoe/presentation/screens/lobby/lobby.view_model.dart';
import 'package:tictactoe/presentation/widgets/custom_button.dart';
import 'package:tictactoe/presentation/widgets/text_variant.dart';

/// Lobby screen displayed before launching a match.
@RoutePage()
class LobbyScreen extends ConsumerWidget {
  /// Constructor
  const LobbyScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    final LobbyState state = ref.watch(lobbyViewModelProvider);

    return Scaffold(
      backgroundColor: colorScheme.surface,
      extendBodyBehindAppBar: true,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            PlayerSide(player: state.players.first, rotation: 2),
            const _LoaderDivider(),
            PlayerSide(player: state.players.last),
          ],
        ),
      ),
    );
  }
}

class _LoaderDivider extends ConsumerWidget {
  const _LoaderDivider();

  static const double indent = 8;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    final LobbyState state = ref.watch(lobbyViewModelProvider);

    final Expanded divider = Expanded(
      child: Divider(
        color: colorScheme.onSurface,
        indent: indent,
        endIndent: indent,
      ),
    );

    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          divider,
          if (state.areAllPlayersReady) ...<Widget>[
            TextVariant(
              LocaleKeys.lobby_gameStartingSoon.tr(),
              variantType: TextVariantType.displaySmall,
              fontSize: 24,
            ),
            divider,
          ],
        ],
      ),
    );
  }
}

/// Player side
class PlayerSide extends ConsumerWidget {
  /// Creates a PlayerSide widget to display a player's information
  /// and action button.
  ///
  /// The [player] argument must not be null.
  const PlayerSide({required this.player, super.key, this.rotation = 0});

  /// Player
  final Player player;

  /// Side rotation
  final int rotation;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    final LobbyViewModel viewModel = ref.watch(lobbyViewModelProvider.notifier);
    final LobbyState state = ref.watch(lobbyViewModelProvider);

    final bool isPlayerReady = state.playersReady[player.id] ?? false;

    return RotatedBox(
      quarterTurns: rotation,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 22),
        alignment: Alignment.bottomCenter,
        color: colorScheme.surface,
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 48),
          child: Column(
            children: <Widget>[
              TextVariant(
                LocaleKeys.lobby_playerLabel
                    .tr(args: <String>[player.id.toString()]),
                variantType: TextVariantType.titleLarge,
                color: colorScheme.onSurface,
              ),
              const Gap(22),
              if (isPlayerReady)
                TextVariant(LocaleKeys.lobby_waitingOthers.tr()),
              const Gap(22),
              CustomButton(
                title: LocaleKeys.lobby_readyButton.tr(),
                isLoading: isPlayerReady,
                onTap: () => viewModel.setPlayerReady(player.id),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
