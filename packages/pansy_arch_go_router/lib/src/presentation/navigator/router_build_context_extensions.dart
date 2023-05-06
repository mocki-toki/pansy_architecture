import 'package:flutter/material.dart';
import 'package:pansy_arch_go_router/pansy_arch_go_router.dart';

extension RouterBuildContextExtensions on BuildContext {
  GoRouter get router {
    return getRequired<GoRouter>();
  }
}
