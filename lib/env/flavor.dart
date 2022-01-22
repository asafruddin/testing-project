import 'package:testing_project/env/config.dart';

class FlavorSetting {
  FlavorSetting.development() {
    Config.getInstance(
      flavorName: 'development',
      apiBaseUrl: 'https://api.github.com/search',
    );
  }

  FlavorSetting.staging() {
    Config.getInstance(
      flavorName: 'staging',
      apiBaseUrl: 'https://api.github.com/search',
    );
  }

  FlavorSetting.production() {
    Config.getInstance(
      flavorName: 'production',
      apiBaseUrl: 'https://api.github.com/search',
    );
  }
}
