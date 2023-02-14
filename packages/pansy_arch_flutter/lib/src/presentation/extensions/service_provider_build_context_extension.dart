import 'package:dino/dino.dart';
import 'package:flutter/widgets.dart';
import 'package:dino_flutter/dino_flutter.dart';

extension ServiceProviderBuildContextExtension on BuildContext {
  TService getRequired<TService>() => sp.getRequired<TService>();
}
