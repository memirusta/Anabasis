import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_de.dart';
import 'app_localizations_en.dart';
import 'app_localizations_ru.dart';
import 'app_localizations_tr.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ar'),
    Locale('de'),
    Locale('en'),
    Locale('ru'),
    Locale('tr')
  ];

  /// No description provided for @baslangic.
  ///
  /// In en, this message translates to:
  /// **'Starting Point'**
  String get baslangic;

  /// No description provided for @bitis.
  ///
  /// In en, this message translates to:
  /// **'Ending Point'**
  String get bitis;

  /// No description provided for @yoltarif.
  ///
  /// In en, this message translates to:
  /// **'Use buttons to get route ↓'**
  String get yoltarif;

  /// No description provided for @anabasisyol.
  ///
  /// In en, this message translates to:
  /// **'Anabasis Road'**
  String get anabasisyol;

  /// No description provided for @anamenu.
  ///
  /// In en, this message translates to:
  /// **'Main Menu'**
  String get anamenu;

  /// No description provided for @yerler.
  ///
  /// In en, this message translates to:
  /// **'Destinations To Visit:'**
  String get yerler;

  /// No description provided for @restaurant.
  ///
  /// In en, this message translates to:
  /// **'Restaurants'**
  String get restaurant;

  /// No description provided for @tmekan.
  ///
  /// In en, this message translates to:
  /// **'Historical Places'**
  String get tmekan;

  /// No description provided for @share.
  ///
  /// In en, this message translates to:
  /// **'Share'**
  String get share;

  /// No description provided for @dil.
  ///
  /// In en, this message translates to:
  /// **'Change Language'**
  String get dil;

  /// No description provided for @ayarlar.
  ///
  /// In en, this message translates to:
  /// **' Settings'**
  String get ayarlar;

  /// No description provided for @tema.
  ///
  /// In en, this message translates to:
  /// **'Application Theme'**
  String get tema;

  /// No description provided for @kmanastir.
  ///
  /// In en, this message translates to:
  /// **'Kuştul Monastery'**
  String get kmanastir;

  /// No description provided for @kilisekalinti.
  ///
  /// In en, this message translates to:
  /// **'Aya Yannis Church Remains'**
  String get kilisekalinti;

  /// No description provided for @vmanastir.
  ///
  /// In en, this message translates to:
  /// **'Vazelon Monastery'**
  String get vmanastir;

  /// No description provided for @smanastir.
  ///
  /// In en, this message translates to:
  /// **'Sümela Monastery'**
  String get smanastir;

  /// No description provided for @yayla.
  ///
  /// In en, this message translates to:
  /// **'İskopel Highland'**
  String get yayla;

  /// No description provided for @int.
  ///
  /// In en, this message translates to:
  /// **'No Internet Connection'**
  String get int;

  /// No description provided for @intcumle.
  ///
  /// In en, this message translates to:
  /// **'Please check your internet connection'**
  String get intcumle;

  /// No description provided for @baslik.
  ///
  /// In en, this message translates to:
  /// **'Title'**
  String get baslik;

  /// No description provided for @dahafazla.
  ///
  /// In en, this message translates to:
  /// **'More Info...'**
  String get dahafazla;

  /// No description provided for @otel.
  ///
  /// In en, this message translates to:
  /// **'Hotels'**
  String get otel;

  /// No description provided for @lan.
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get lan;

  /// No description provided for @flame.
  ///
  /// In en, this message translates to:
  /// **'🇺🇸'**
  String get flame;

  /// No description provided for @gitmek.
  ///
  /// In en, this message translates to:
  /// **'How Do I Go?'**
  String get gitmek;

  /// No description provided for @tepe.
  ///
  /// In en, this message translates to:
  /// **'Anabasis Theches Hill'**
  String get tepe;

  /// No description provided for @yoltarifbuton.
  ///
  /// In en, this message translates to:
  /// **'Get directions'**
  String get yoltarifbuton;

  /// No description provided for @sumela1.
  ///
  /// In en, this message translates to:
  /// **'Sümela Monastery (Greek: Panagia Sumela) is a Greek Orthodox monastery and monastery located on the western slopes of Meryem Ana Creek within the borders of the Altındere Valley National Park in the Maçka district of Trabzon province, on the Kara hill and at an altitude of 1,150 m above sea level. It is a church complex.'**
  String get sumela1;

  /// No description provided for @sumela2.
  ///
  /// In en, this message translates to:
  /// **'The original name of the monastery, which is popularly known as \'Virgin Mary\', is \'Panaghia Tou Melas\', which means \'Virgin of Montenegro\'. The definition of \'Melas\', meaning \'Black\', which turned into the pronunciation \'Sümela\', is based on the name of the monastery. It is rumored that it originates from the \'Montenegro Mountains\', which are always seen with their dark colored mass.'**
  String get sumela2;

  /// No description provided for @hakkindasayfasi.
  ///
  /// In en, this message translates to:
  /// **'About'**
  String get hakkindasayfasi;

  /// No description provided for @anabasis_hakkinda.
  ///
  /// In en, this message translates to:
  /// **'Anabasis Road B.C. It is a historical road used by Greek soldiers in the 400th century. Our application aims to introduce this road and the surrounding tourist attractions and show you how to reach these places.'**
  String get anabasis_hakkinda;

  /// No description provided for @anabasis_hakkinda2.
  ///
  /// In en, this message translates to:
  /// **'You can click to learn more about the road.'**
  String get anabasis_hakkinda2;

  /// No description provided for @yol_app.
  ///
  /// In en, this message translates to:
  /// **'Road & Application'**
  String get yol_app;

  /// No description provided for @yan_menu.
  ///
  /// In en, this message translates to:
  /// **'Side Menu'**
  String get yan_menu;

  /// No description provided for @vazelonmurl.
  ///
  /// In en, this message translates to:
  /// **'https://en.wikipedia.org/wiki/Vazelon_Monastery'**
  String get vazelonmurl;

  /// No description provided for @kustulmurl.
  ///
  /// In en, this message translates to:
  /// **'https://en.wikipedia.org/wiki/Kuştul_Monastery'**
  String get kustulmurl;

  /// No description provided for @yan_menu_anlatim.
  ///
  /// In en, this message translates to:
  /// **'Side menu near the road; Shows hotels, restaurants, historical places and settings menus. When you click on the pins in the menus of hotels, restaurants and historical places, boxes appear that allow you to get information about that place. You can get information and directions from these boxes. The settings menu allows changing the application language and theme.'**
  String get yan_menu_anlatim;

  /// No description provided for @nasil_baslik.
  ///
  /// In en, this message translates to:
  /// **'How to use application?'**
  String get nasil_baslik;

  /// No description provided for @nasil_kullanilir.
  ///
  /// In en, this message translates to:
  /// **'The main menu shows the route of the Anabasis path. The pins at the beginning and end of the path give the start and end points. When these pins are pressed, buttons appear to get directions to that location. The \"Directions\" button at the bottom left of the screen directs you to the map application that explains what route you should follow from the beginning to the end of the road.'**
  String get nasil_kullanilir;

  /// No description provided for @yenidendene.
  ///
  /// In en, this message translates to:
  /// **'Retry'**
  String get yenidendene;

  /// No description provided for @renk.
  ///
  /// In en, this message translates to:
  /// **'Choosen Color:'**
  String get renk;

  /// No description provided for @renksec.
  ///
  /// In en, this message translates to:
  /// **'Select a Color'**
  String get renksec;

  /// No description provided for @tamam.
  ///
  /// In en, this message translates to:
  /// **'ОК'**
  String get tamam;

  /// No description provided for @iptal.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get iptal;

  /// No description provided for @konumIzni.
  ///
  /// In en, this message translates to:
  /// **'Location Permission'**
  String get konumIzni;

  /// No description provided for @konumIzniGerekiyor.
  ///
  /// In en, this message translates to:
  /// **'The app requires location permission'**
  String get konumIzniGerekiyor;

  /// No description provided for @konumIzniTalimat.
  ///
  /// In en, this message translates to:
  /// **'Please click the allow button to grant location permission.'**
  String get konumIzniTalimat;

  /// No description provided for @izinVer.
  ///
  /// In en, this message translates to:
  /// **'Allow'**
  String get izinVer;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['ar', 'de', 'en', 'ru', 'tr'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar': return AppLocalizationsAr();
    case 'de': return AppLocalizationsDe();
    case 'en': return AppLocalizationsEn();
    case 'ru': return AppLocalizationsRu();
    case 'tr': return AppLocalizationsTr();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
