import 'package:flutter/material.dart';
import 'package:pansy_arch/pansy_arch.dart';

part 'scaffold_messenger_provider.g.dart';

@Service(ServiceLifetime.singleton)
class ScaffoldMessengerProvider {
  final GlobalKey<ScaffoldMessengerState> key = GlobalKey<ScaffoldMessengerState>();
  ScaffoldMessengerState get state => key.currentState!;
}
