import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../../../core/use_cases/use_cases.dart';
import '../repositories/settings_repository.dart';

class LoadThemeMode {
  final SettingsRepository repository;

  LoadThemeMode(this.repository);

  Future<ThemeMode> call(NoParams params) async {
    return await repository.loadThemeMode();
  }
}

class Params extends Equatable {
  final ThemeMode themeMode;

  const Params({required this.themeMode});

  @override
  List<Object> get props => [themeMode];
}
