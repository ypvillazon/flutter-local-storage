import 'package:localstorage/preference/preferences_utils.dart';

class Storage {

  // Gets
  static Future<bool> get data => PreferencesUtils.getBool("data");

  // Sets
  static void setData(v) => PreferencesUtils.setBool("data", v);

}