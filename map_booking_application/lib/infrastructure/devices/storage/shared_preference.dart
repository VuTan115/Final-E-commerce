import 'package:map_booking_application/domain/models/app_settings_model.dart';
import 'package:map_booking_application/infrastructure/utils/constance.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreference {
  // APPLICATION
  Future<bool> setAppSettings(AppSettings settings) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    final String json = settings.toJsonString();
    return await sharedPreferences.setString(Constance.appSettingsKey, json);
  }

  Future<AppSettings> getAppSettings() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    final String? json = sharedPreferences.getString(Constance.appSettingsKey);
    return (json == null || json.isEmpty) ? AppSettings.def() : AppSettings.fromJsonString(json);
  }

  Future<void> clear() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.clear();
  }

  // AUTHENTICATION

}
