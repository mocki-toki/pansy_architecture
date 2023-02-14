import 'dart:async';

import 'package:pansy_arch_shelf_router/pansy_arch_shelf_router.dart';

typedef RouteFactory = List<ShelfRoute> Function(ServiceProvider provider);

class RouterProvider implements Initializable {
  RouterProvider(this._serviceProvider);

  final ServiceProvider _serviceProvider;
  Router? _router;

  Router get router {
    if (_router != null) return _router!;
    throw UninitializedError();
  }

  @override
  Future<void> initialize() async {
    final ShelfRouteNotFound? routeNotFound = _serviceProvider.get<ShelfRouteNotFound>();
    _router = Router(notFoundHandler: routeNotFound?.handler ?? (_) => Router.routeNotFound);

    final routes = _serviceProvider
        .getMany<RouteFactory>()
        .expand((element) => element(_serviceProvider))
        .toList();

    return Future.forEach(
      routes,
      (element) => router.add(element.verb, element.path, element.handler),
    );
  }
}
