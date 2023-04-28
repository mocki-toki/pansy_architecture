import 'package:flutter/material.dart';
import 'package:pansy_arch_go_router/pansy_arch_go_router.dart';

extension RouterContextExtensions on BuildContext {
  GoRouter get router {
    return getRequired<GoRouter>();
  }

  Future<T?> open<T>(ActivityRoute route) {
    return router.push<T>(
      _getRouteLocation(route.data),
      extra: route.data.extra,
    );
  }

  void openAndReplace(ActivityRoute route) {
    return router.replace(
      _getRouteLocation(route.data),
      extra: route.data.extra,
    );
  }

  String _getRouteLocation(RouteData routeData) {
    var path = '${Uri.parse(routeData.path)}';
    path = _replacePropertiesInPath('$path', routeData.parameters);

    final queryParameters = Uri(
      queryParameters: routeData.queryParameters.map(
        (key, value) => MapEntry(key, '$value'),
      ),
    );

    return _replacePropertiesInPath(
      '$path$queryParameters',
      routeData.parameters,
    );
  }

  String _replacePropertiesInPath(String path, Map<String, dynamic> parameters) {
    for (var property in parameters.entries) {
      path = path.replaceAll(':${property.key}', '${property.value ?? ''}');
    }

    return path;
  }
}
