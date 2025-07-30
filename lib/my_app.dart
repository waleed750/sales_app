import 'core/core_export.dart';
import 'core/l10n/app_localizations.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();

  static void restartApp(BuildContext context, Locale locale) {
    _MyAppState? state = context.findAncestorStateOfType<_MyAppState>();
    state?.setLocale(locale);
    state?.restartApp();
  }
}

class _MyAppState extends State<MyApp> {
  Locale? _locale;
  Key key = UniqueKey();

  void setLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  void restartApp() {
    setState(() {
      key = UniqueKey();
    });
  }

  @override
  Widget build(BuildContext context) {
    return KeyedSubtree(
      key: key,
      child: ScreenUtilInit(
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return ToastificationWrapper(
            child: GlobalLoaderOverlay(
              overlayColor: AppColors.black.withValues(alpha: 0.5),
              child: BlocProvider(
                create: (context) => serviceLocator<SettingCubit>(),
                child: BlocBuilder<SettingCubit, SettingState>(
                  buildWhen:
                      (previous, current) =>
                          current is LanguageLoadedState ||
                          current is ChangeLanguageState,
                  builder: (context, state) {
                    final settingCubit = SettingCubit.get(context);
                    return MaterialApp.router(
                      scrollBehavior: AppScrollBehavior(),
                      debugShowCheckedModeBanner: false,
                      localizationsDelegates:
                          AppLocalizations.localizationsDelegates,
                      supportedLocales: AppLocalizations.supportedLocales,
                      locale: _locale ?? Locale(settingCubit.language),
                      theme: AppThemes.lightTheme,
                      routerConfig: appRouter,
                    );
                  },
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
