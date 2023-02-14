import 'package:pansy_arch_go_router/pansy_arch_go_router.dart';

/// This is an internal API that is not intended for use by developers.
///
/// It may be changed or removed without notice.
typedef GoRouteFactory = List<GoRoute> Function(ServiceProvider provider);

/// This is an internal API that is not intended for use by developers.
///
/// It may be changed or removed without notice.
class RouterProvider {
  RouterProvider(ServiceProvider sp)
      : router = GoRouter(
          initialLocation: '/',
          routes: sp.getMany<GoRouteFactory>().expand((element) => element(sp)).toList(),
        );

  final GoRouter router;
}
