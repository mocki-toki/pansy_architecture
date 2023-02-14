import 'package:shelf/shelf.dart';

typedef ShelfRouteHandler = Response Function(Request request);

class ShelfRoute {
  const ShelfRoute(this.verb, this.path, this.handler);

  const ShelfRoute.all(this.path, this.handler) : verb = r'$all';
  const ShelfRoute.get(this.path, this.handler) : verb = 'GET';
  const ShelfRoute.head(this.path, this.handler) : verb = 'HEAD';
  const ShelfRoute.post(this.path, this.handler) : verb = 'POST';
  const ShelfRoute.put(this.path, this.handler) : verb = 'PUT';
  const ShelfRoute.delete(this.path, this.handler) : verb = 'DELETE';
  const ShelfRoute.connect(this.path, this.handler) : verb = 'CONNECT';
  const ShelfRoute.options(this.path, this.handler) : verb = 'OPTIONS';
  const ShelfRoute.trace(this.path, this.handler) : verb = 'TRACE';
  const ShelfRoute.mount(String prefix, this.handler)
      : verb = r'$mount',
        path = prefix;

  final String verb;
  final String path;
  final ShelfRouteHandler handler;
}
