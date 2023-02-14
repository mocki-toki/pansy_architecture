class RouteData {
  RouteData({
    required this.path,
    this.parameters = const {},
    this.queryParameters = const {},
    this.extra = const {},
  });

  final String path;
  final Map<String, dynamic> parameters;
  final Map<String, dynamic> queryParameters;
  final Map<String, dynamic> extra;
}
