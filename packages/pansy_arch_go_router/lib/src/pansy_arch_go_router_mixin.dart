import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pansy_arch_go_router/pansy_arch_go_router.dart';
import 'infrastructure/router_provider.dart';

typedef RouteFactory<T> = T Function(RouteData);
typedef RouteBuilder<T> = Widget Function(BuildContext context, GoRouterState state, T route);
typedef PageBuilder<T> = Page Function(BuildContext context, GoRouterState state, T route);
typedef RedirectBuilder<T> = FutureOr<String?> Function(BuildContext context, GoRouterState state);

mixin PansyArchGoRouterMixin on Module {
  @override
  void onServiceConfiguration(ServiceCollection services) {
    super.onServiceConfiguration(services);

    services.addInstance<GoRouteFactory>(buildRoutes);
  }

  // mixin
  // ignore: avoid-unused-parameters
  List<GoRoute> buildRoutes(ServiceProvider provider) {
    return const [];
  }

  GoRoute route<T>({
    required String path,
    required RouteFactory<T> routeFactory,
    RouteBuilder<T>? builder,
    PageBuilder<T>? pageBuilder,
    GoRouterRedirect? redirect,
  }) {
    return GoRoute(
      path: path,
      builder: builder != null
          ? (context, state) {
              final routeData = RouteData(
                path: path,
                parameters: state.params,
                queryParameters: state.queryParams,
                extra: state.extra as Map<String, dynamic>? ?? {},
              );

              return builder(context, state, routeFactory(routeData));
            }
          : null,
      pageBuilder: pageBuilder != null
          ? (context, state) {
              final routeData = RouteData(
                path: path,
                parameters: state.params,
                queryParameters: state.queryParams,
              );

              return pageBuilder(context, state, routeFactory(routeData));
            }
          : null,
      redirect: redirect,
    );
  }
}
