import 'package:pansy_arch_go_router/pansy_arch_go_router.dart';

part 'router_provider.g.dart';

typedef GoRouteFactory = List<GoRoute> Function(ServiceProvider provider);

@Service(ServiceLifetime.singleton)
class RouterProvider {
  RouterProvider(ServiceProvider sp)
      : router = GoRouter(
          initialLocation: '/',
          routes: sp.getMany<GoRouteFactory>().expand((element) => element(sp)).toList(),
        );

  final GoRouter router;
}
