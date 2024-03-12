// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class SMovie {
  SMovie();

  static SMovie? _current;

  static SMovie get current {
    assert(_current != null,
        'No instance of SMovie was loaded. Try to initialize the SMovie delegate before accessing SMovie.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<SMovie> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = SMovie();
      SMovie._current = instance;

      return instance;
    });
  }

  static SMovie of(BuildContext context) {
    final instance = SMovie.maybeOf(context);
    assert(instance != null,
        'No instance of SMovie present in the widget tree. Did you add SMovie.delegate in localizationsDelegates?');
    return instance!;
  }

  static SMovie? maybeOf(BuildContext context) {
    return Localizations.of<SMovie>(context, SMovie);
  }

  /// `ott`
  String get appName {
    return Intl.message(
      'ott',
      name: 'appName',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<SMovie> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<SMovie> load(Locale locale) => SMovie.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
