import 'package:pansy_arch_go_router/pansy_arch_go_router.dart';

class PansyArchGoRouterModule extends Module {
  @override
  void configureServices(ServiceCollection services) {
    services.addModule(PansyArchFlutterModule());
    services.addRouterProvider();
    services.addSingletonFactory((provider) => provider.getRequired<RouterProvider>().router);
  }
}
