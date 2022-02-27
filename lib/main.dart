import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather/src/features/settings/presentation/controller/settings_controller.dart';
import 'src/app.dart';
import 'injector.dart' as di;

void main() async {
  // Set up the SettingsController, which will glue user settings to multiple
  // Flutter Widgets.
  WidgetsFlutterBinding.ensureInitialized();

  await di.init();

  final SettingsController settingsController = Get.find();

  // Load the user's preferred theme while the splash screen is displayed.
  // This prevents a sudden theme change when the app is first displayed.
  await settingsController.loadSettings();

  // Run the app and pass in the SettingsController. The app listens to the
  // SettingsController for changes, then passes it further down to the
  // SettingsView.
  runApp(MyApp(
    settingsController: settingsController,
  ));
}
