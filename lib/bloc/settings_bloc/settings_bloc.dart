import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import 'package:reddit_clone/manager/theme_manager.dart';

part 'settings_event.dart';
part 'settings_state.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  SettingsBloc() : super(SettingsInitial()) {
    on<ChangeThemeEvent>(_changeTheme);
  }

  FutureOr<void> _changeTheme(
      ChangeThemeEvent event, Emitter<SettingsState> emit) async {
    emit(ChangeThemeInProgressState());

    await ThemeManager.instance.saveThemeSetting(isDark: event.isDark);

    emit(ChangeThemeCompletedState(
      theme: ThemeManager.instance.getTheme(isDark: event.isDark),
    ));
  }
}
