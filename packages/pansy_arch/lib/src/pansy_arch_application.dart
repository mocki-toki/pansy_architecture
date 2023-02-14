import 'package:pansy_arch/pansy_arch.dart';

abstract class PansyArchApplication extends Module {
  PansyArchApplication(this._services) {
    _services.addModule(this);
  }

  final ServiceCollection _services;

  Future<ServiceScope> run() async {
    final rootScope = _services.buildRootScope();
    await rootScope.initialize();
    return rootScope;
  }
}
