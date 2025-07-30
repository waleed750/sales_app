import 'package:dartz/dartz.dart';
import '../../../../core/core_export.dart';
import '../../splash_export.dart';

class SplashUsecase {
  final SplashRepo _repo = serviceLocator<SplashRepo>();
  Future<Either<Failure, String>> getGeolocation() async {
    return await _repo.getGeolocation();
  }
}
