import 'package:pansy_arch_go_router/pansy_arch_go_router.dart';
import 'package:flutter/widgets.dart';

part 'router_provider.g.dart';

typedef GoRouteFactory = List<RouteBase> Function(ServiceProvider provider);

@Service(ServiceLifetime.singleton)
class RouterProvider implements Initializable {
  RouterProvider(this._serviceProvider);

  final GlobalKey<NavigatorState> key = GlobalKey<NavigatorState>();
  final ServiceProvider _serviceProvider;
  GoRouter? _router;

  GoRouter get router {
    if (_router != null) return _router!;
    throw UninitializedError();
  }

  @override
  Future<void> initialize() async {
    _router = GoRouter(
      navigatorKey: key,
      initialLocation: '/',
      routes: _serviceProvider
          .getMany<GoRouteFactory>()
          .expand((element) => element(_serviceProvider))
          .toList(),
    );
  }
}
