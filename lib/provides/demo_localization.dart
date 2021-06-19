import 'dart:convert';

import 'package:ecomers_app/helpers/language.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

class DemoLocalization {
  final Locale locale;
  DemoLocalization({this.locale});

  static DemoLocalization of(BuildContext context) {
    return Localizations.of<DemoLocalization>(context, DemoLocalization);
  }

  Map<String, String> _localizedValues;

  Future load() async {
    //get files json
    String jsonStringValues = await rootBundle
        .loadString('assets/language/${locale.languageCode}.json');

    //convert json
    Map<String, dynamic> mappedJson = json.decode(jsonStringValues);

    //convert json dynamic value to => String and pass it to _localizedValues
    _localizedValues =
        mappedJson.map((key, value) => MapEntry(key, value.toString()));
  }

  String getTranslatedValue(String key) {
    return _localizedValues[key];
  }

  //state

  static const LocalizationsDelegate<DemoLocalization> delegate =
      _DemoLocalizationDeleget();
}

class _DemoLocalizationDeleget extends LocalizationsDelegate<DemoLocalization> {
  const _DemoLocalizationDeleget();

  @override
  bool isSupported(Locale locale) {
    return Language.isSupported.contains(locale.languageCode);
  }

  @override
  Future<DemoLocalization> load(Locale locale) async {
    DemoLocalization demoLocalization = DemoLocalization(locale: locale);
    await demoLocalization.load();
    return demoLocalization;
  }

  @override
  bool shouldReload(LocalizationsDelegate<DemoLocalization> old) => false;
}
