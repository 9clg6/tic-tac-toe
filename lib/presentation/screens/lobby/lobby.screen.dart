import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:tictactoe/core/localization/generated/locale_keys.g.dart';
import 'package:tictactoe/foundation/enum/lobby.enum.dart';
import 'package:tictactoe/foundation/routing/app_router.dart';
import 'package:tictactoe/presentation/screens/lobby/lobby.state.dart';
import 'package:tictactoe/presentation/screens/lobby/lobby.view_model.dart';
import 'package:tictactoe/presentation/widgets/custom_button.dart';
import 'package:tictactoe/presentation/widgets/text_variant.dart';

/// Lobby screen that lets the player pick between local and online modes.
@RoutePage()
class LobbyScreen extends ConsumerWidget {
  /// Constructor
  const LobbyScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final LobbyViewModel viewModel = ref.watch(lobbyViewModelProvider.notifier);
    final LobbyState state = ref.watch(lobbyViewModelProvider);
    final ColorScheme colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(title: Text(LocaleKeys.lobby_title.tr())),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TextVariant(
              LocaleKeys.lobby_modeQuestion.tr(),
              variantType: TextVariantType.titleLarge,
            ),
            const Gap(12),
            Wrap(
              spacing: 12,
              children: <Widget>[
                ChoiceChip(
                  label: Text(LocaleKeys.lobby_localLabel.tr()),
                  selected: state.mode == LobbyMode.local,
                  onSelected: (_) => viewModel.selectMode(LobbyMode.local),
                ),
                ChoiceChip(
                  label: Text(LocaleKeys.lobby_onlineLabel.tr()),
                  selected: state.mode == LobbyMode.online,
                  onSelected: (_) => viewModel.selectMode(LobbyMode.online),
                ),
              ],
            ),
            const Gap(24),
            if (state.mode == LobbyMode.local)
              _LocalSection(viewModel: viewModel)
            else
              _OnlineSection(viewModel: viewModel, state: state),
            const Gap(16),
            if (state.lastCreatedGameId != null)
              _InfoBanner(
                icon: Icons.videogame_asset,
                text: LocaleKeys.lobby_statusGameCreated.tr(
                  args: <String>[state.lastCreatedGameId!],
                ),
                color: colorScheme.primaryContainer,
              ),
            if (state.matchmakingRequestId != null)
              _InfoBanner(
                icon: Icons.timer,
                text: LocaleKeys.lobby_statusEnqueued.tr(
                  args: <String>[state.matchmakingRequestId!],
                ),
                color: colorScheme.secondaryContainer,
              ),
            if (state.matchedGameId != null)
              _InfoBanner(
                icon: Icons.handshake,
                text: LocaleKeys.lobby_statusMatchFound.tr(
                  args: <String>[state.matchedGameId!],
                ),
                color: colorScheme.tertiaryContainer,
              ),
            if (state.errorMessage != null)
              _InfoBanner(
                icon: Icons.error_outline,
                text: state.errorMessage == 'join_id_required'
                    ? LocaleKeys.lobby_errorJoinIdRequired.tr()
                    : state.errorMessage == 'game_not_found'
                        ? LocaleKeys.lobby_errorGameNotFound.tr()
                        : state.errorMessage == 'no_request_available'
                            ? LocaleKeys.lobby_errorNoRequest.tr()
                        : state.errorMessage!,
                color: colorScheme.errorContainer,
                textColor: colorScheme.onErrorContainer,
              ),
          ],
        ),
      ),
    );
  }
}

class _LocalSection extends StatelessWidget {
  const _LocalSection({required this.viewModel});

  final LobbyViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        TextVariant(
          LocaleKeys.lobby_localDescription.tr(),
          variantType: TextVariantType.bodyLarge,
        ),
        const Gap(16),
        CustomButton(
          title: LocaleKeys.lobby_playLocal.tr(),
          onTap: () => context.router.push(const GameLobbyRoute()),
        ),
      ],
    );
  }
}

class _OnlineSection extends StatelessWidget {
  const _OnlineSection({required this.viewModel, required this.state});

  final LobbyViewModel viewModel;
  final LobbyState state;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        TextVariant(
          LocaleKeys.lobby_onlineDescription.tr(),
          variantType: TextVariantType.bodyLarge,
        ),
        const Gap(16),
        TextField(
          decoration: InputDecoration(
            labelText: LocaleKeys.lobby_joinWithId.tr(),
            hintText: LocaleKeys.lobby_enterGameId.tr(),
          ),
          onChanged: viewModel.updateJoinGameId,
        ),
        const Gap(12),
        CustomButton(
          title: LocaleKeys.lobby_joinButton.tr(),
          onTap: state.isLoading ? null : viewModel.joinGameById,
          enable: state.canJoinGame && !state.isLoading,
          isLoading: state.isLoading,
        ),
        const Gap(12),
        CustomButton(
          title: LocaleKeys.lobby_matchmakingButton.tr(),
          onTap: state.isLoading ? null : viewModel.searchMatchmaking,
          isLoading: state.isLoading,
        ),
        const Gap(12),
        CustomButton(
          title: LocaleKeys.lobby_createGameButton.tr(),
          onTap: state.isLoading ? null : viewModel.createGame,
          isLoading: state.isLoading,
        ),
      ],
    );
  }
}

class _InfoBanner extends StatelessWidget {
  const _InfoBanner({
    required this.icon,
    required this.text,
    required this.color,
    this.textColor,
  });

  final IconData icon;
  final String text;
  final Color color;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: <Widget>[
          Icon(
            icon,
            color: textColor ?? Theme.of(context).colorScheme.onSurface,
          ),
          const Gap(12),
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                color: textColor ?? Theme.of(context).colorScheme.onSurface,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
