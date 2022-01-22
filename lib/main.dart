import 'package:testing_project/app/app.dart';
import 'package:testing_project/bootstrap.dart';
import 'package:testing_project/env/flavor.dart';

void main() {
  bootstrap(() => const App(), FlavorSetting.development());
}
