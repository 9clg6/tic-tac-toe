import 'package:tictactoe/foundation/config/app_config.dart';
import 'package:tictactoe/foundation/enum/environment.enum.dart';

/// App config staging
final class AppConfigStaging implements AppConfig {
  @override
  String get baseUrl => 'http://starterkit.fr';

  @override
  String get appName => 'Starter Kit - Staging';

  @override
  Environment get env => Environment.staging;

  @override
  String get authBaseUrl => 'https://starterkit.fr/prod/api';

  @override
  bool get isProd => false;
}
