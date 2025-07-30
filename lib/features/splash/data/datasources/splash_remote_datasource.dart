
import '../../../../core/core_export.dart';

abstract class SplashRemoteDatasource {
  Future<String> getGeolocation();
}

class SplashRemoteDatasourceImpl implements SplashRemoteDatasource {
  final _httpHelper = serviceLocator<HttpService>();

  @override
  Future<String> getGeolocation() async {
    final Response response = await _httpHelper.get(EndPoints.geolocation);
    return Future.value(response.data['countryCode']);
  }
}
