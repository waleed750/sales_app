import '../../../core_export.dart';

part 'setting_state.dart';

class SettingCubit extends Cubit<SettingState> {
  SettingCubit() : super(SettingInitial());
  static SettingCubit get(BuildContext context) => BlocProvider.of(context);
  bool isDark = false;
  String language = ENGLISH;
  Locale? localeLanguage;

  Future<void> getLanguage() async {
    language = (await  serviceLocator<AppPreferences>().getAppLanguage())??ENGLISH;
    localeLanguage = await serviceLocator<AppPreferences>().getLocal();
    emit(LanguageLoadedState());
  }

  Future<void> changeLanguage(LanguageType language) async {
    await serviceLocator<AppPreferences>().setLanguageChanged(language);
    emit(ChangeLanguageState());
    await getLanguage();
  }

  bool isEnglish() => language == 'en';
}
