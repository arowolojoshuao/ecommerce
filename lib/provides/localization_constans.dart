import 'package:ecomers_app/provides/demo_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

String getTranslationText(BuildContext context, String key) {
  return DemoLocalization.of(context).getTranslatedValue(key) ?? 'null';
}

//lang code
const String LANGUEGE_CODE = 'languageCode';

Future<Locale> setLocales(String languageCode) async {
  SharedPreferences _perfs = await SharedPreferences.getInstance();
  await _perfs.setString(LANGUEGE_CODE, languageCode);
  return _locale(languageCode);
}

Future<Locale> getLocales() async {
  SharedPreferences _perfs = await SharedPreferences.getInstance();
  String codeLanguege = _perfs.getString(LANGUEGE_CODE) ?? 'en';
  return _locale(codeLanguege);
}

Locale _locale(String languageCode) {
  Locale _temp;
  switch (languageCode) {
    case 'en':
      _temp = Locale(languageCode, 'US');
      break;
    case 'es':
      _temp = Locale(languageCode, 'ES');
      break;
    case 'fr':
      _temp = Locale(languageCode, 'FR');
      break;
    case 'ja':
      _temp = Locale(languageCode, 'JP');
      break;
    case 'zh':
      _temp = Locale(languageCode, 'HK');
      break;
    default:
      _temp = Locale('en', 'US');
  }
  return _temp;
}
