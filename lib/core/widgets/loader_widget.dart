// ignore_for_file: use_build_context_synchronously

import 'dart:developer';

import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../core_export.dart';
import 'widgets_eport.dart';


class LoaderWidget {
  static show(BuildContext context, Future Function() waitingFor) async {
    try {
      context.loaderOverlay.show(
        widgetBuilder: (progress) => const Center(
          child: SpinKitChasingDots(
            color: AppColors.primary,
            size: 50.0,
          ),
        ),
      );
      await Future.delayed(Duration.zero);
      await waitingFor();
      context.loaderOverlay.hide();
    } catch (e) {
      log('LoaderWidget.show error is $e');
      ShowToastMessage.show(message: e.toString(), toastType: ToastType.ERROR);

      context.loaderOverlay.hide();
    }
  }

  static circleProgressIndicator() {
    return const Center(
      child: SpinKitCircle(
        color: AppColors.primary,
        size: 50.0,
      ),
    );
  }
}
