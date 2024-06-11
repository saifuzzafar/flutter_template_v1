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

class SCommon {
  SCommon();

  static SCommon? _current;

  static SCommon get current {
    assert(_current != null,
        'No instance of SCommon was loaded. Try to initialize the SCommon delegate before accessing SCommon.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<SCommon> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = SCommon();
      SCommon._current = instance;

      return instance;
    });
  }

  static SCommon of(BuildContext context) {
    final instance = SCommon.maybeOf(context);
    assert(instance != null,
        'No instance of SCommon present in the widget tree. Did you add SCommon.delegate in localizationsDelegates?');
    return instance!;
  }

  static SCommon? maybeOf(BuildContext context) {
    return Localizations.of<SCommon>(context, SCommon);
  }

  /// `Movie app`
  String get appName {
    return Intl.message(
      'Movie app',
      name: 'appName',
      desc: '',
      args: [],
    );
  }

  /// `OTT app`
  String get ottApp {
    return Intl.message(
      'OTT app',
      name: 'ottApp',
      desc: '',
      args: [],
    );
  }

  /// `Top Rated`
  String get topRated {
    return Intl.message(
      'Top Rated',
      name: 'topRated',
      desc: '',
      args: [],
    );
  }

  /// `Up Coming`
  String get upComing {
    return Intl.message(
      'Up Coming',
      name: 'upComing',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<SCommon> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<SCommon> load(Locale locale) => SCommon.load(locale);
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
