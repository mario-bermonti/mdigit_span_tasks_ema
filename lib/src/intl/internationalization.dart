import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:research_package/research_package.dart';

/// default locale
const Locale locale = Locale('es');

const List<Locale> supportedLocales = <Locale>[
  Locale('es'),
  Locale('en'),
];

final List<LocalizationsDelegate> localizationsDelegates =
    <LocalizationsDelegate>[
  RPLocalizations.delegate,
  GlobalMaterialLocalizations.delegate,
  GlobalWidgetsLocalizations.delegate,
  GlobalCupertinoLocalizations.delegate,
];

/// Resolves the [Locale] to the last one in the list of [supportedLocales]
/// if the [locale] is unsupported.
Locale? resolveLocale(Locale? locale, Iterable<Locale>? supportedLocales) {
  if (locale == null || supportedLocales == null) {
    return null;
  }
  for (Locale supportedLocale in supportedLocales) {
    if (supportedLocale.languageCode == locale.languageCode) {
      return supportedLocale;
    }
  }
  return supportedLocales.last;
}
