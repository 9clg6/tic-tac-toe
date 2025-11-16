import 'package:auto_route/auto_route.dart';
import 'package:tictactoe/presentation/screens/home/home.screen.dart';
import 'package:tictactoe/presentation/screens/lobby/lobby.screen.dart';

part 'app_router.gr.dart';

/// App router
@AutoRouterConfig(replaceInRouteName: 'Screen|Page,Route')
class AppRouter extends RootStackRouter {
  @override
  RouteType get defaultRouteType => const RouteType.adaptive();

  @override
  List<AutoRoute> get routes => <AutoRoute>[
    AutoRoute(page: LobbyRoute.page, initial: true),
    AutoRoute(page: HomeRoute.page),
  ];
}
