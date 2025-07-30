import '/core/core_export.dart';
import '/core/widgets/show_toast_message/show_toast_message_widget.dart';

import '../../splash_export.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    AppStrings.get(context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => serviceLocator<SplashCubit>()
        ..getGeolocation()
        ..checkIsUserLoggedIn(context),
      child: Scaffold(
        body: BlocListener<SplashCubit, SplashState>(
          listener: (context, state) {
            if (state is SplashSuccessState) {
              // Handle success
            } else if (state is SplashErrorState) {
              ShowToastMessage.show(
                  message: state.message ?? '', toastType: ToastType.ERROR);
            }
          },
          child: Center(
            child: Column(
              mainAxisSize:MainAxisSize.min ,
                children: [
                  // Image.asset(height: 0.1.sh, AppImages.png.logo),
                  // Text(AppStrings.tr.isOurPurpose,style: AppTextStyles.font20BlackRegular,)
                ],
              ),
          ),
        ),
      ),
    );
  }
}
