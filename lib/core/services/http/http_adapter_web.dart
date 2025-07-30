import 'package:dio/browser.dart';
import 'package:dio/dio.dart';

HttpClientAdapter createHttpClientAdapter() {
  return BrowserHttpClientAdapter();
}
