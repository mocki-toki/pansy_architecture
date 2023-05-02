part of 'application.dart';

class ApplicationLifetime {
  final _applicationStarted = Completer<void>();
  final _applicationStopping = Completer<void>();
  final _applicationStopped = Completer<void>();

  Future<void> get applicationStarted => _applicationStarted.future;
  Future<void> get applicationStopping => _applicationStopping.future;
  Future<void> get applicationStopped => _applicationStopped.future;

  /// Stops the application managed by the lifetime.
  void stop() {
    _applicationStopping.complete();
  }
}
