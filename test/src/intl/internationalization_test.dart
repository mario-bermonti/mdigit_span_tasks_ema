import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mdigit_span_tasks_ema/src/intl/internationalization.dart';

void main() {
  group('resolveLocale', () {
    test(
      "Given valid locale and supported locales, returns the locale.",
      () {
        const Locale expectedLocale = Locale('en');
        final Iterable<Locale> supportedLocales = <Locale>[
          const Locale('en'),
          const Locale('es'),
        ];

        final Locale? actualLocale = resolveLocale(
          expectedLocale,
          supportedLocales,
        );

        expect(actualLocale, expectedLocale);
      },
    );
  });
  test(
    """Given an unsupported locale and valid supported locales, 
    returns Locale('es').""",
    () {
      const Locale locale = Locale('fr');
      final Iterable<Locale> supportedLocales = <Locale>[
        const Locale('en'),
        const Locale('es'),
      ];

      final Locale? actualLocale = resolveLocale(
        locale,
        supportedLocales,
      );

      expect(actualLocale, supportedLocales.last);
    },
  );
  test(
    "Given a null locale and valid supported locales, returns null.",
    () {
      final Iterable<Locale> supportedLocales = <Locale>[
        const Locale('en'),
        const Locale('es'),
      ];

      final Locale? actualLocale = resolveLocale(
        null,
        supportedLocales,
      );

      expect(actualLocale, isNull);
    },
  );
}
