import 'package:dartz/dartz.dart';

import '../../../../core/core_export.dart';
import '../../splash_export.dart';

class SplashRepoImpl implements SplashRepo {
  final SplashRemoteDatasource _remoteDatasourse =
      serviceLocator<SplashRemoteDatasource>();

  final _failureHandler = serviceLocator<FailureHandler>();

  @override
  Future<Either<Failure, String>> getGeolocation() async {
    try {
      final failureOrDone = await _remoteDatasourse.getGeolocation();
      return Right(failureOrDone);
    } on DioException catch (e) {
      return Left(_failureHandler.getFailureType(e));
    }
  }
}
