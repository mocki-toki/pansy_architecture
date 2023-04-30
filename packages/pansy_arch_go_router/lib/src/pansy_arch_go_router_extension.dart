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
              routeFactory(_fromStateToRouteData(state)),
            );
          }
        : null,
    pageBuilder: pageBuilder != null
        ? (context, state) {
            return pageBuilder(
              context,
              state,
              routeFactory(_fromStateToRouteData(state)),
            );
          }
        : null,
    redirect: redirectBuilder != null
        ? (context, state) {
            return redirectBuilder(
              context,
              state,
              routeFactory(_fromStateToRouteData(state)),
            );
          }
        : null,
  );
}

RouteData _fromStateToRouteData(GoRouterState state) {
  return RouteData(
    path: state.location,
    parameters: state.pathParameters,
    queryParameters: state.queryParameters,
    extra: state.extra as Map<String, dynamic>? ?? {},
  );
}
