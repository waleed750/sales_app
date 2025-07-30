part of 'setting_cubit.dart';

abstract class SettingState extends Equatable {
  const SettingState();

  @override
  List<Object> get props => [identityHashCode(this)];
}

class SettingInitial extends SettingState {}

class LanguageLoadedState extends SettingState {}

class ChangeLanguageState extends SettingState {}

class GetCountryCodeState extends SettingState {}
