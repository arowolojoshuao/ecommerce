import 'package:flutter/material.dart';

class Language {
  final int id;
  final String name;
  final String flag;
  final String languageCode;

  Language({this.id, this.name, this.flag, this.languageCode});

  static List<Language> listLanguage() {
    return <Language>[
      Language(id: 1, flag: '🇺🇸', name: 'English', languageCode: 'en'),
      Language(id: 2, flag: '🇪🇸', name: 'Espagnol', languageCode: 'es'),
      Language(id: 3, flag: '🇫🇷', name: 'French', languageCode: 'fr'),
      Language(id: 4, flag: '🇮🇳', name: 'Hindi', languageCode: 'ja'),
      Language(id: 5, flag: '🇨🇳', name: '中文', languageCode: 'zh'),
    ];
  }

  static List<Locale> supportedLocales = [
    Locale('en', 'US'),
    Locale('es', 'ES'),
    Locale('fr', 'FR'),
    Locale('ja', 'JP'),
    Locale('zh', 'HK'),
  ];

  static List<String> isSupported = ['en', 'es', 'fr', 'ja', 'zh'];
}
