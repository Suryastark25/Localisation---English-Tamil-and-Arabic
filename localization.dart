import 'package:flutter/material.dart';
import 'app_localizations_en.dart';
import 'app_localizations_ta.dart';
import 'app_localizations_ar.dart';

class AppLocalizations {
  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  static Map<String, Map<String, String>> _localizedValues = {
    'en': appLocalizationsEn,
    'ta': appLocalizationsTa,
    'ar': appLocalizationsAr,
  };

  final String locale;

  AppLocalizations(this.locale);

  String get(String key) {
    return _localizedValues[locale]?[key] ?? key;
  }

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => ['en', 'ta', 'ar'].contains(locale.languageCode);

  @override
  Future<AppLocalizations> load(Locale locale) async {
    return AppLocalizations(locale.languageCode);
  }

  @override
  bool shouldReload(LocalizationsDelegate old) => false;
}
