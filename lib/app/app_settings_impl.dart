import 'package:shared_preferences/shared_preferences.dart';

import '../core/app_settings.dart';
import 'constants.dart';

class AppSettingsImpl extends AppSettings{
  SharedPreferences sharedPreferences;
  AppSettingsImpl(this.sharedPreferences);

  @override
  get userId => sharedPreferences.get(Constants.userId);

  @override
  setBaseUrl(String baseUrl) {
    sharedPreferences.setString(Constants.baseUrl, baseUrl);
  }

  @override
  String get baseUrl => sharedPreferences.getString(Constants.baseUrl)??"";

  @override
  void saveIntroDone() {
    sharedPreferences.setBool(Constants.intro_done_key, true);
  }

  @override
  bool introDone() {
    return sharedPreferences.getBool(Constants.intro_done_key)??false;
  }

  @override
  void setUserId(String userId) {
    sharedPreferences.setString(Constants.userId, userId);
  }
}