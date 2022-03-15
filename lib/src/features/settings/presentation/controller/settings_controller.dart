import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../../../core/styles/themes.dart';
import '../../../../core/use_cases/use_cases.dart';
import '../../domain/use_cases/load_theme_mode.dart';
import '../../domain/use_cases/update_theme_mode.dart';

class SettingsController extends GetxController {
  final UpdateThemeMode updateThemeMode;
  final LoadThemeMode loadThemeMode;
  SettingsController({
    required this.updateThemeMode,
    required this.loadThemeMode,
  });

  @override
  void onInit() async {
    super.onInit();
  }

  final Rx<ThemeMode> _themeMode = themesModeMap["dark"]!.obs;

  ThemeMode get themeMode => _themeMode.value;

  Future<void> loadSettings() async {
    _themeMode.value = await loadThemeMode(NoParams());
  }

  Future<void> updateTheme(ThemeMode? newThemeMode) async {
    if (newThemeMode == null) return;

    if (newThemeMode == _themeMode.value) return;
    _themeMode.value = newThemeMode;

    await updateThemeMode(Params(themeMode: newThemeMode));
  }
}
