import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pansy_arch_go_router/pansy_arch_go_router.dart';

typedef RouteFactory<T> = T Function(RouteData);
typedef RouteWidgetBuilder<T> = Widget Function(BuildContext context, GoRouterState state, T route);
typedef RoutePageBuilder<T> = Page Function(BuildContext context, GoRouterState state, T route);
typedef RouteRedirectBuilder<T> = FutureOr<String?> Function(
  BuildContext context,
  GoRouterState state,
  T route,
);
typedef NavigatorKey = GlobalKey<NavigatorState>;

extension PansyArchGoRouterExtension on ServiceCollection {
  void addRoutes(GoRouteFactory routes) {
    addInstance<GoRouteFactory>(routes);
  }
}

GoRoute route<T>({
  required String path,
  required RouteFactory<T> routeFactory,
  RouteWidgetBuilder<T>? builder,
  RoutePageBuilder<T>? pageBuilder,
  RouteRedirectBuilder<T>? redirectBuilder,
  NavigatorKey? parentNavigatorKey,
}) {
  return GoRoute(
    path: path,
    parentNavigatorKey: parentNavigatorKey,
    builder: builder != null
        ? (context, state) {
            return builder(
              context,
              state,
              routeFactory(state.toRouteData()),
            );
          }
        : null,
    pageBuilder: pageBuilder != null
        ? (context, state) {
            return pageBuilder(
              context,
              state,
              routeFactory(state.toRouteData()),
            );
          }
        : null,
    redirect: redirectBuilder != null
        ? (context, state) {
            return redirectBuilder(
              context,
              state,
              routeFactory(state.toRouteData()),
            );
          }
        : null,
  );
}

extension _FromStateToRouteData on GoRouterState {
  RouteData toRouteData() {
    return RouteData(
      path: location,
      parameters: pathParameters,
      queryParameters: queryParameters,
      extra: extra as Map<String, dynamic>? ?? {},
    );
  }
}
