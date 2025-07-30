import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../features/features_export.dart';
import '../core_export.dart';
import '../services/review/in_app_review_service.dart';
import '../services/security/device_info/device_info_manager.dart';
import '../services/security/device_info/rasp_secure_app.dart';

final serviceLocator = GetIt.instance;

Future<void> initServiceLocator({required Flavor flavorType}) async {
  //! ############################### Package ###############################
  await initializeDateFormatting("ar_SA", null);
  final sharedPref = await SharedPreferences.getInstance();
  if (!kIsWeb) {
    await ScreenUtil.ensureScreenSize();
  }
  serviceLocator.registerLazySingleton(() => sharedPref);
  serviceLocator.registerLazySingleton<Dio>(() => Dio());
  //! ############################### Service ###############################
  Bloc.observer = AppBlocObserver();
  serviceLocator.registerLazySingleton<FailureHandler>(() => FailureHandler());
  serviceLocator.registerLazySingleton<HttpService>(() => HttpServiceImpl());
  serviceLocator.registerLazySingleton(
    () => AppPreferences()..init(),
  );
  serviceLocator.registerLazySingleton<NetworkService>(
    () => NetworkServiceImpl(serviceLocator()),
  );
  serviceLocator
      .registerLazySingleton<InAppRatingService>(() => InAppRatingService());
        serviceLocator.registerSingleton<DeviceInfoManager>(DeviceInfoManager());
  serviceLocator.registerSingleton<RaspSecureApp>(RaspSecureApp()..initializeTalsec());

  //! ################################ Datasources #################################
  serviceLocator.registerLazySingleton<SplashRemoteDatasource>(
    () => SplashRemoteDatasourceImpl(),
  );

  //! ################################# Repository #################################

  serviceLocator.registerLazySingleton<SplashRepo>(() => SplashRepoImpl());

  //! ################################# Usecases #################################

  serviceLocator.registerLazySingleton(() => SplashUsecase());

  //! ############################### Bloc Or Cubit ###############################
  serviceLocator.registerFactory(() => SettingCubit());
  serviceLocator.registerFactory(() => SplashCubit());
}
