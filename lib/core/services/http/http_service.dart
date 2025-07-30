import '../../core_export.dart';

abstract class HttpService {
  Future<Response> get(String url,
      {RequestData? requestData, Object? requestBody});
  Future<Response> post(String url, Object? requestBody,
      {RequestData? requestData, Options? options});
  Future<Response> postWithFile(String url, Map<String, dynamic> requestBody,
      {RequestData? requestData});
  Future<Response> delete(String url, {RequestData? requestData});
  Future<Response> put(String url,
      {Map<String, dynamic> requestBody, RequestData? requestData});
  Future<Response> patch(String url, Map<String, dynamic> requestBody,
      {RequestData? requestData});
  Future<Response> retry(RequestOptions requestOptions);
}
