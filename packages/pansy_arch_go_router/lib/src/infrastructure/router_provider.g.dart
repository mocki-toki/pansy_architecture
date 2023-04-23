// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'router_provider.dart';

// **************************************************************************
// Dino Generator
// **************************************************************************

extension RouterProviderFactory on ServiceCollection {
  void addRouterProvider([
    ServiceLifetime lifetime = ServiceLifetime.singleton,
    bool registerAliases = true,
  ]) {
    addFactory<RouterProvider>(
      lifetime,
      (provider) => RouterProvider(
        provider.getRequired<ServiceProvider>(),
      ),
      true,
    );
  }
}
