import 'package:pansy_arch_shelf_router/pansy_arch_shelf_router.dart';
import 'package:pansy_arch_shelf_router/src/infrastructure/router_provider.dart';

extension PansyArchShelfRouterExtension on ServiceCollection {
  void addRoutes(RouteFactory routes) {
    addInstance<RouteFactory>(routes);
  }
}
