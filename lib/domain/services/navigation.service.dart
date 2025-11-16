import 'package:tictactoe/foundation/routing/app_router.dart';

/// Navigation service
class NavigationService {
  /// Constructor
  NavigationService({required AppRouter appRouter}) : _appRouter = appRouter;

  /// App router
  final AppRouter _appRouter;

  /// Navigate to home
  void navigateToHome() {
    _appRouter.push(const HomeRoute());
  }

  /// Navigate back
  void navigateBack() {
    _appRouter.maybePop();
  }

  /// Replace to home
  void replaceToHome() {
    _appRouter.replace(const HomeRoute());
  }

  /// Pop
  void pop() {
    _appRouter.maybePop();
  }
}
