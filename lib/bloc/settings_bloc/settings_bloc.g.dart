// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'settings_bloc.dart';

// **************************************************************************
// BlocGenerator
// **************************************************************************

class InitialSettingsState extends SettingsState {}

class ChangeThemeEvent extends SettingsEvent {
  final bool isDark;
  ChangeThemeEvent({required this.isDark});
}

class ChangeThemeInProgressState extends SettingsState {}

class ChangeThemeCompletedState extends SettingsState {
  final ThemeData theme;
  ChangeThemeCompletedState({required this.theme});
}

class ChangeThemeFailedState extends SettingsState {}
