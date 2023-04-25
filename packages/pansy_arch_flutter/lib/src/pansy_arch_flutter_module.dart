import 'package:pansy_arch_flutter/pansy_arch_flutter.dart';

extension PansyArchFlutterModule on ServiceCollection {
  void addPansyArchFlutterModule() {
    addScaffoldMessengerProvider();
    addSingletonFactory(
      (provider) => provider.getRequired<ScaffoldMessengerProvider>().state,
    );
  }
}
