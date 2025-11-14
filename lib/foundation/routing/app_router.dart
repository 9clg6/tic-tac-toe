import 'package:auto_route/auto_route.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tictactoe/core/providers/services/user.service.provider.dart';
import 'package:tictactoe/presentation/screens/authentication/authentication.screen.dart';
import 'package:tictactoe/presentation/screens/home/home.screen.dart';

part 'app_router.gr.dart';

/// App router
@AutoRouterConfig(replaceInRouteName: 'Screen|Page,Route')
class AppRouter extends RootStackRouter {
  @override
  RouteType get defaultRouteType => const RouteType.adaptive();

  @override
  List<AutoRoute> get routes => <AutoRoute>[
    AutoRoute(page: AuthenticationRoute.page),
    AutoRoute(
      page: HomeRoute.page,
      initial: true,
      guards: <AutoRouteGuard>[AuthGuard()],
    ),
  ];
}

/// Auth guard
class AuthGuard extends AutoRouteGuard {
  @override
  Future<void> onNavigation(
    NavigationResolver resolver,
    StackRouter router,
  ) async {
    final ProviderContainer container = ProviderScope.containerOf(
      resolver.context,
      listen: false,
    );
    await container.read(
      userServiceProvider.future,
    );

    resolver.next();

    // if (userService.isAuthenticated) {
    //   debugPrint('guard - isAuthenticated');
    //   resolver.next();
    // } else {
    //   debugPrint('guard - notAuthenticated');
    //   await resolver.redirectUntil(const AuthenticationRoute());
    // }
  }
}
