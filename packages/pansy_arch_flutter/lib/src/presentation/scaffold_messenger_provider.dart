import 'package:flutter/material.dart';

class ScaffoldMessengerProvider {
  final GlobalKey<ScaffoldMessengerState> key = GlobalKey<ScaffoldMessengerState>();
  ScaffoldMessengerState get state => key.currentState!;
}
