import 'dart:async';

import 'package:dino/dino.dart';
import 'package:pansy_arch/src/hosting/hosted_service.dart';
import 'package:pansy_arch/src/modularity/module.dart';

part 'application_lifetime.dart';

abstract class Application extends Module {
  Future<void> run(List<String> arguments) async {
    final services = ServiceCollection();
    final lifetime = ApplicationLifetime();

    configureServices(services);
    onServiceConfiguration(services);
    services.addInstance(lifetime);

    final rootScope = services.buildRootScope();

    Future<void> _stop() async {
      for (final service in rootScope.createdServices) {
        if (service is HostedService) {
          await service.stop();
        }
      }

      await rootScope.dispose();
      lifetime._applicationStopped.complete();
    }

    try {
      await rootScope.initialize();

      final hostedServices = rootScope.serviceProvider.getMany<HostedService>();
      for (final hostedService in hostedServices) {
        await hostedService.start();
      }

      lifetime._applicationStarted.complete();
      await main(arguments, rootScope.serviceProvider);
    } finally {
      await _stop();
    }
  }

  FutureOr<void> main(List<String> arguments, ServiceProvider provider) {
    return provider.getRequired<ApplicationLifetime>().applicationStopping;
  }
}
