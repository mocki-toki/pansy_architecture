import 'package:pansy_arch_shelf_router/pansy_arch_shelf_router.dart';
import 'package:pansy_arch_shelf_router/src/infrastructure/router_provider.dart';

extension PansyArchShelfRouterModule on ServiceCollection {
  void addPansyArchShelfRouterModule() {
    addRouterProvider();
    addSingletonFactory((provider) => provider.getRequired<RouterProvider>().router);
  }
}
