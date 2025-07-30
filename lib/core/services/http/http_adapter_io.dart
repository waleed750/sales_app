import 'dart:io';
import 'package:dio/io.dart';
import 'package:dio/dio.dart';

HttpClientAdapter createHttpClientAdapter() {
  return IOHttpClientAdapter(
    createHttpClient: () {
      final client = HttpClient();
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
      return client;
    },
  );
}
