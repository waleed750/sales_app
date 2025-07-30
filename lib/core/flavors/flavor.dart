import 'flavor_export.dart';

abstract class Flavor {
  final String baseUrl;
  final FlavorType flavorType;

  Flavor({
    required this.baseUrl,
    required this.flavorType,
  });

  static final Flavor development = DevFlavor();
  static final Flavor testing = TestingFlavor();
}

enum FlavorType { development, testing }
