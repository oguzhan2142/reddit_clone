import 'dart:async';

import 'package:bloc_use_case_generator/bloc_generator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reddit_clone/manager/theme_manager.dart';

part 'settings_bloc.g.dart';

class SettingsEvent {}

class SettingsState {}

@BlocAnnotation(
  baseEventType: SettingsEvent,
  baseStateType: SettingsState,
  blocUseCases: [
    BlocUseCase(
      name: 'ChangeTheme',
      input: {'isDark': bool},
      output: {'theme': ThemeData},
    )
  ],
)
class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  SettingsBloc() : super(InitialSettingsState()) {
    on<ChangeThemeEvent>(_changeTheme);
  }

  FutureOr<void> _changeTheme(ChangeThemeEvent event, Emitter<SettingsState> emit) async {
    emit(ChangeThemeInProgressState());

    await ThemeManager.instance.saveThemeSetting(isDark: event.isDark);

    emit(ChangeThemeCompletedState(
      theme: ThemeManager.instance.getTheme(isDark: event.isDark),
    ));
  }
}
