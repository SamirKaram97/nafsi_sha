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

  /// `Login to start with nafsy`
  String get loginToStartWithNafsy {
    return Intl.message(
      'Login to start with nafsy',
      name: 'loginToStartWithNafsy',
      desc: '',
      args: [],
    );
  }

  /// `Sign up to start with nafsy`
  String get signUpToStartWithNafsy {
    return Intl.message(
      'Sign up to start with nafsy',
      name: 'signUpToStartWithNafsy',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get email {
    return Intl.message(
      'Email',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get password {
    return Intl.message(
      'Password',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `Forgot password?`
  String get forgotPassword {
    return Intl.message(
      'Forgot password?',
      name: 'forgotPassword',
      desc: '',
      args: [],
    );
  }

  /// `Sign in`
  String get signIn {
    return Intl.message(
      'Sign in',
      name: 'signIn',
      desc: '',
      args: [],
    );
  }

  /// `or`
  String get or {
    return Intl.message(
      'or',
      name: 'or',
      desc: '',
      args: [],
    );
  }

  /// `Don’t have an account?`
  String get dontHaveAnAccount {
    return Intl.message(
      'Don’t have an account?',
      name: 'dontHaveAnAccount',
      desc: '',
      args: [],
    );
  }

  /// `Already have an account?`
  String get alreadyHaveAnAccount {
    return Intl.message(
      'Already have an account?',
      name: 'alreadyHaveAnAccount',
      desc: '',
      args: [],
    );
  }

  /// `Sign up`
  String get signUp {
    return Intl.message(
      'Sign up',
      name: 'signUp',
      desc: '',
      args: [],
    );
  }

  /// `Create my account`
  String get createMyAccount {
    return Intl.message(
      'Create my account',
      name: 'createMyAccount',
      desc: '',
      args: [],
    );
  }

  /// `select your favourits`
  String get selectYourFavourits {
    return Intl.message(
      'select your favourits',
      name: 'selectYourFavourits',
      desc: '',
      args: [],
    );
  }

  /// `save and continue`
  String get saveAndContinue {
    return Intl.message(
      'save and continue',
      name: 'saveAndContinue',
      desc: '',
      args: [],
    );
  }

  /// `Connection timeout please try again later..`
  String get connectionTimeOut {
    return Intl.message(
      'Connection timeout please try again later..',
      name: 'connectionTimeOut',
      desc: '',
      args: [],
    );
  }

  /// `Some thing went wrong please try again..`
  String get someThingWentWrong {
    return Intl.message(
      'Some thing went wrong please try again..',
      name: 'someThingWentWrong',
      desc: '',
      args: [],
    );
  }

  /// `Some thing went wrong we will fix it soon please try again later`
  String get someThingWentWrongWillFix {
    return Intl.message(
      'Some thing went wrong we will fix it soon please try again later',
      name: 'someThingWentWrongWillFix',
      desc: '',
      args: [],
    );
  }

  /// `Account created Successfully. you can login now..`
  String get accountCreatedSuccessfully {
    return Intl.message(
      'Account created Successfully. you can login now..',
      name: 'accountCreatedSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `How do you feel today?`
  String get howDoYouFeelToday {
    return Intl.message(
      'How do you feel today?',
      name: 'howDoYouFeelToday',
      desc: '',
      args: [],
    );
  }

  /// `detect your feeling`
  String get detectYourFeeling {
    return Intl.message(
      'detect your feeling',
      name: 'detectYourFeeling',
      desc: '',
      args: [],
    );
  }

  /// `Mood Tracker`
  String get moodTracker {
    return Intl.message(
      'Mood Tracker',
      name: 'moodTracker',
      desc: '',
      args: [],
    );
  }

  /// `Videos`
  String get videos {
    return Intl.message(
      'Videos',
      name: 'videos',
      desc: '',
      args: [],
    );
  }

  /// `Camping relax`
  String get campingRelax {
    return Intl.message(
      'Camping relax',
      name: 'campingRelax',
      desc: '',
      args: [],
    );
  }

  /// `Load more`
  String get loadMore {
    return Intl.message(
      'Load more',
      name: 'loadMore',
      desc: '',
      args: [],
    );
  }

  /// `Articles`
  String get articles {
    return Intl.message(
      'Articles',
      name: 'articles',
      desc: '',
      args: [],
    );
  }

  /// `Read More`
  String get readMore {
    return Intl.message(
      'Read More',
      name: 'readMore',
      desc: '',
      args: [],
    );
  }

  /// `Start`
  String get start {
    return Intl.message(
      'Start',
      name: 'start',
      desc: '',
      args: [],
    );
  }

  /// `Tests`
  String get tests {
    return Intl.message(
      'Tests',
      name: 'tests',
      desc: '',
      args: [],
    );
  }

  /// `Submit `
  String get submit {
    return Intl.message(
      'Submit ',
      name: 'submit',
      desc: '',
      args: [],
    );
  }

  /// `Done `
  String get done {
    return Intl.message(
      'Done ',
      name: 'done',
      desc: '',
      args: [],
    );
  }

  /// `Your Results Are Ready `
  String get yourResultsAreReady {
    return Intl.message(
      'Your Results Are Ready ',
      name: 'yourResultsAreReady',
      desc: '',
      args: [],
    );
  }

  /// `Email must be not empty`
  String get emailMustBeNotEmpty {
    return Intl.message(
      'Email must be not empty',
      name: 'emailMustBeNotEmpty',
      desc: '',
      args: [],
    );
  }

  /// `Password must be not empty`
  String get passwordMustBeNotEmpty {
    return Intl.message(
      'Password must be not empty',
      name: 'passwordMustBeNotEmpty',
      desc: '',
      args: [],
    );
  }

  /// `Please enter a correct email`
  String get pleaseEnterACorrectEmail {
    return Intl.message(
      'Please enter a correct email',
      name: 'pleaseEnterACorrectEmail',
      desc: '',
      args: [],
    );
  }

  /// `Password must be more than 6 characters`
  String get passwordMustBeMoreThan6 {
    return Intl.message(
      'Password must be more than 6 characters',
      name: 'passwordMustBeMoreThan6',
      desc: '',
      args: [],
    );
  }

  /// `Please check your network connection and try again`
  String get networkError {
    return Intl.message(
      'Please check your network connection and try again',
      name: 'networkError',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get home {
    return Intl.message(
      'Home',
      name: 'home',
      desc: '',
      args: [],
    );
  }

  /// `Sounds`
  String get sounds {
    return Intl.message(
      'Sounds',
      name: 'sounds',
      desc: '',
      args: [],
    );
  }

  /// `Favorites`
  String get favorites {
    return Intl.message(
      'Favorites',
      name: 'favorites',
      desc: '',
      args: [],
    );
  }

  /// `Profile`
  String get profile {
    return Intl.message(
      'Profile',
      name: 'profile',
      desc: '',
      args: [],
    );
  }

  /// `Agree`
  String get agree {
    return Intl.message(
      'Agree',
      name: 'agree',
      desc: '',
      args: [],
    );
  }

  /// `Disagree`
  String get disagree {
    return Intl.message(
      'Disagree',
      name: 'disagree',
      desc: '',
      args: [],
    );
  }

  /// `Sat`
  String get sat {
    return Intl.message(
      'Sat',
      name: 'sat',
      desc: '',
      args: [],
    );
  }

  /// `Sun`
  String get sun {
    return Intl.message(
      'Sun',
      name: 'sun',
      desc: '',
      args: [],
    );
  }

  /// `Mon`
  String get mon {
    return Intl.message(
      'Mon',
      name: 'mon',
      desc: '',
      args: [],
    );
  }

  /// `Tue`
  String get tue {
    return Intl.message(
      'Tue',
      name: 'tue',
      desc: '',
      args: [],
    );
  }

  /// `Wed`
  String get wed {
    return Intl.message(
      'Wed',
      name: 'wed',
      desc: '',
      args: [],
    );
  }

  /// `Thu`
  String get thu {
    return Intl.message(
      'Thu',
      name: 'thu',
      desc: '',
      args: [],
    );
  }

  /// `Fri`
  String get fri {
    return Intl.message(
      'Fri',
      name: 'fri',
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
