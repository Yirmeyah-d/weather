import 'package:weather/src/features/settings/domain/use_cases/load_theme_mode.dart';

import '../repositories/settings_repository.dart';

class UpdateThemeMode {
  final SettingsRepository repository;

  UpdateThemeMode(this.repository);

  Future<void> call(Params params) async {
    return await repository.updateThemeMode(params.themeMode);
  }
}
