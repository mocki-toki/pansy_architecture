import 'package:pansy_arch_go_router/pansy_arch_go_router.dart';

extension RouterExtensions on GoRouter {
  Future<T?> pushRoute<T>(ActivityRoute route) {
    return push<T>(
      _getRouteLocation(route.data),
      extra: route.data.extra,
    );
  }

  void replaceRoute(ActivityRoute route) {
    return replace(
      _getRouteLocation(route.data),
      extra: route.data.extra,
    );
  }

  void pushReplacementRoute(ActivityRoute route) {
    return pushReplacement(
      _getRouteLocation(route.data),
      extra: route.data.extra,
    );
  }

  void goRoute(ActivityRoute route) {
    return go(
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
