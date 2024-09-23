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

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Payment`
  String get payment {
    return Intl.message(
      'Payment',
      name: 'payment',
      desc: '',
      args: [],
    );
  }

  /// `Bill Details`
  String get bill_details {
    return Intl.message(
      'Bill Details',
      name: 'bill_details',
      desc: '',
      args: [],
    );
  }

  /// `Criminal Law`
  String get criminal_law {
    return Intl.message(
      'Criminal Law',
      name: 'criminal_law',
      desc: '',
      args: [],
    );
  }

  /// `General Consultation Type`
  String get general_consultation_type {
    return Intl.message(
      'General Consultation Type',
      name: 'general_consultation_type',
      desc: '',
      args: [],
    );
  }

  /// `Harassment`
  String get harassment {
    return Intl.message(
      'Harassment',
      name: 'harassment',
      desc: '',
      args: [],
    );
  }

  /// `500 EGP`
  String get consultation_fee {
    return Intl.message(
      '500 EGP',
      name: 'consultation_fee',
      desc: '',
      args: [],
    );
  }

  /// `Wallet Balance`
  String get wallet_balance {
    return Intl.message(
      'Wallet Balance',
      name: 'wallet_balance',
      desc: '',
      args: [],
    );
  }

  /// `1200 EGP`
  String get wallet_balance_value {
    return Intl.message(
      '1200 EGP',
      name: 'wallet_balance_value',
      desc: '',
      args: [],
    );
  }

  /// `Credit Card`
  String get credit_card {
    return Intl.message(
      'Credit Card',
      name: 'credit_card',
      desc: '',
      args: [],
    );
  }

  /// `+ Add New Card`
  String get add_new_card {
    return Intl.message(
      '+ Add New Card',
      name: 'add_new_card',
      desc: '',
      args: [],
    );
  }

  /// `E-Wallet`
  String get e_wallet {
    return Intl.message(
      'E-Wallet',
      name: 'e_wallet',
      desc: '',
      args: [],
    );
  }

  /// `Confirm Payment`
  String get confirm_payment {
    return Intl.message(
      'Confirm Payment',
      name: 'confirm_payment',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
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
