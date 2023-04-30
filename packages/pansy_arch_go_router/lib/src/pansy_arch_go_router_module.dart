import 'package:pansy_arch_go_router/pansy_arch_go_router.dart';

extension PansyArchGoRouterModule on ServiceCollection {
  void addPansyArchGoRouterModule() {
    addPansyArchFlutterModule();
    addRouterProvider();
    addSingletonFactory((provider) => provider.getRequired<RouterProvider>().router);
  }
}
