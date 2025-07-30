import 'flavor_export.dart';

class TestingFlavor extends Flavor {
  TestingFlavor()
      : super(
          baseUrl: "",
          flavorType:
              FlavorType.testing, // Production staging testing development
        );
}
