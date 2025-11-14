import 'package:tictactoe/foundation/config/app_config.dart';
import 'package:tictactoe/foundation/enum/environment.enum.dart';

/// App config mock
final class AppConfigMock implements AppConfig {
  @override
  String get baseUrl => '';

  @override
  String get appName => 'Starter Kit - Mock';
  
  @override
  Environment get env => Environment.mock;
  
  @override
  String get authBaseUrl => '';

  @override
  bool get isProd => false;
}
