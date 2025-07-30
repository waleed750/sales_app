import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

import '../../core_export.dart';

class NetworkServiceImpl implements NetworkService {
  final InternetConnection connectionChecker;

  NetworkServiceImpl(this.connectionChecker);

  @override
  Future<bool> get hasConnection async {
    // Check the internet connection using InternetConnectionCheckerPlus
    final isConnected = await connectionChecker.hasInternetAccess;
    return isConnected;
  }
}
