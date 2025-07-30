// ignore_for_file: use_build_context_synchronously, unused_local_variable

import 'dart:developer';

import '../../../../core/core_export.dart';
import '../../splash_export.dart';

part 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(SplashInitial());
  static SplashCubit get(BuildContext context) => BlocProvider.of(context);
  final _usecase = serviceLocator<SplashUsecase>();

  Future<void> checkIsUserLoggedIn(BuildContext context) async {
    final prefs = serviceLocator<AppPreferences>();
    final rememberMe = await prefs.isOnBoardingScreenViewed();

    Future.delayed(const Duration(seconds: 2), () async {
      // if (rememberMe) {
      //   Navigator.pushNamedAndRemoveUntil(
      //     context,
      //     AppRoutes.homePageRoute,
      //     (route) => false,
      //   );
      // } else {
      //   Navigator.pushReplacementNamed(
      //     context,
      //     AppRoutes.loginPageRoute
      //   );
      // }
    });
  }

  Future<void> getGeolocation() async {
    try {
      final either = await _usecase.getGeolocation();
      final data = AppUtils.mapFailuerOrDone(either: either);
      if (data.data != null) {
        final countryCode = data.data as String;
        emit(SplashSuccessState());
      } else {
        emit(SplashErrorState());
      }
    } catch (e) {
      log('error is $e');
      emit(SplashErrorState(message: e.toString()));
    }
  }
}
