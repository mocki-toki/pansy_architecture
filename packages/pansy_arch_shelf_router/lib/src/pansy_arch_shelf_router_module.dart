import 'package:pansy_arch_shelf_router/pansy_arch_shelf_router.dart';
import 'package:pansy_arch_shelf_router/src/infrastructure/router_provider.dart';

class PansyArchShelfRouterModule extends Module {
  @override
  void configureServices(ServiceCollection services) {
    services.addRouterProvider();
    services.addSingletonFactory((provider) => provider.getRequired<RouterProvider>().router);
  }
}
