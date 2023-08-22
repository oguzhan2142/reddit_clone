part of 'settings_bloc.dart';

class SettingsState extends Equatable {
  const SettingsState();

  @override
  List<Object> get props => [];
}

class SettingsInitial extends SettingsState {}

class ChangeThemeInProgressState extends SettingsState {}

class ChangeThemeCompletedState extends SettingsState {
  final ThemeData theme;
  ChangeThemeCompletedState({required this.theme});
}

class ChangeThemeFailedState extends SettingsState {}
