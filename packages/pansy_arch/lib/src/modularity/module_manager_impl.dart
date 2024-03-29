import 'package:dino/dino.dart';
import 'package:pansy_arch/src/modularity/module.dart';
import 'package:pansy_arch/src/modularity/module_info.dart';
import 'package:pansy_arch/src/modularity/module_manager.dart';

/// This is an internal API that is not intended for use by developers.
///
/// It may be changed or removed without notice.
class ModuleManagerImpl implements ModuleManager {
  List<Module>? _moduleInstances = [];
  List<ModuleInfo>? _moduleInfos;
  @override
  Iterable<ModuleInfo> get modules {
    if (_moduleInfos != null) {
      return _moduleInfos!;
    }

    _moduleInfos = _moduleInstances! //
        .map((module) => module.createInfo())
        .toList();

    _moduleInstances = null;

    return _moduleInfos!;
  }

  void addModule(ServiceCollection services, Module module) {
    assert(
      _moduleInstances != null,
      'addModule called after container was built',
    );

    if (!_moduleInstances!.any((e) => e.runtimeType == module.runtimeType)) {
      module.onServiceConfiguration(services);
      module.configureServices(services);

      _moduleInstances!.add(module);
    }

    module.onInstanceServiceConfiguration(services);
    module.configureInstanceServices(services);
  }
}
