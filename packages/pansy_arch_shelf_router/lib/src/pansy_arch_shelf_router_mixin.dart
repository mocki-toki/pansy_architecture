import 'package:pansy_arch_shelf_router/pansy_arch_shelf_router.dart';
import 'package:pansy_arch_shelf_router/src/infrastructure/router_provider.dart';

mixin PansyArchShelfRouterMixin on Module {
  @override
  void onServiceConfiguration(ServiceCollection services) {
    super.onServiceConfiguration(services);

    services.addInstance<RouteFactory>(buildRoutes);
  }

  // mixin
  // ignore: avoid-unused-parameters
  List<ShelfRoute> buildRoutes(ServiceProvider provider) {
    return const [];
  }
}
