import 'package:pansy_arch_go_router/pansy_arch_go_router.dart';
import 'package:pansy_arch_go_router/src/infrastructure/router_provider.dart';

extension PansyArchGoRouterModule on ServiceCollection {
  void addPansyArchGoRouterModule() {
    addPansyArchFlutterModule();
    addRouterProvider();
    addSingletonFactory((provider) => provider.getRequired<RouterProvider>().router);
  }
}
