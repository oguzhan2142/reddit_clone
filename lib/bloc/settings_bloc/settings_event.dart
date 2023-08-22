part of 'settings_bloc.dart';

class SettingsEvent extends Equatable {
  const SettingsEvent();

  @override
  List<Object> get props => [];
}

class ChangeThemeEvent extends SettingsEvent {
  final bool isDark;
  const ChangeThemeEvent({required this.isDark});
}
