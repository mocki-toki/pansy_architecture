import 'package:pansy_arch_flutter/pansy_arch_flutter.dart';

class PansyArchFlutterModule extends Module {
  @override
  void configureServices(ServiceCollection services) {
    services.addScaffoldMessengerProvider();
    services.addSingletonFactory(
      (provider) => provider.getRequired<ScaffoldMessengerProvider>().state,
    );
  }
}
