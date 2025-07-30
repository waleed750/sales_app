import 'package:dartz/dartz.dart';

import '/core/core_export.dart';

abstract class SplashRepo {
  
  Future<Either<Failure, String>> getGeolocation();
}




