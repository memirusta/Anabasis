# Anabasis

[![Flutter](https://img.shields.io/badge/Flutter-3.x-02569B?style=for-the-badge&logo=flutter&logoColor=white)](https://flutter.dev)
[![Dart](https://img.shields.io/badge/Dart-2.12+-0175C2?style=for-the-badge&logo=dart&logoColor=white)](https://dart.dev)

**Anabasis** is a cross-platform tourism guide for the historic **Anabasis Road** (*Anabasis Yolu*) in Maçka, Trabzon, Turkey — the route followed by Greek soldiers in the 4th century BCE. The app helps visitors explore the road, discover nearby historical sites, and navigate to key destinations with interactive maps and multilingual content.

> **Download on Google Play:** [com.KAL2024.anabasis](https://play.google.com/store/apps/details?id=com.KAL2024.anabasis)

---

## Screenshots

<!-- Replace with your own screenshots before publishing -->
| Home — Anabasis Route | Historical Places | Settings |
|:---:|:---:|:---:|
| ![Screenshot placeholder](docs/screenshots/home.png) | ![Screenshot placeholder](docs/screenshots/historical.png) | ![Screenshot placeholder](docs/screenshots/settings.png) |

> Add screenshots to `docs/screenshots/` and update the paths above, or embed images directly in this section.

---

## Features

- **Interactive route map** — View the full Anabasis Road on Google Maps with start/end markers and a drawn polyline route
- **Historical places** — Explore Sümela Monastery, Vazelon Monastery, Kuştul Monastery, Aya Yannis Church remains, İskopel Highland, and Anabasis Trenches Hill with descriptions and map pins
- **Turn-by-turn directions** — Open external navigation from your current location or between route points via Google Maps
- **5 languages** — Turkish, English, Russian, German, and Arabic (full i18n via ARB localization files)
- **Theme customization** — Light/dark mode and a custom accent color picker
- **Location-aware** — GPS-based directions with runtime location permission handling
- **Offline awareness** — Internet connectivity check with a dedicated retry screen
- **Share the app** — Built-in share action linking to the Play Store listing
- **About page** — Background on the Anabasis Road with a link to the official Maçka municipality page

---

## Tech Stack

| Category | Technology |
|---|---|
| Framework | [Flutter](https://flutter.dev) / [Dart](https://dart.dev) |
| Maps & Routing | [Google Maps Flutter](https://pub.dev/packages/google_maps_flutter), [flutter_polyline_points](https://pub.dev/packages/flutter_polyline_points) |
| Location | [Geolocator](https://pub.dev/packages/geolocator), [permission_handler](https://pub.dev/packages/permission_handler) |
| State Management | [Provider](https://pub.dev/packages/provider) |
| Localization | Flutter `gen-l10n` (ARB files), [intl](https://pub.dev/packages/intl) |
| Local Storage | [SQLite](https://pub.dev/packages/sqflite) via sqflite |
| Other | [shared_preferences](https://pub.dev/packages/shared_preferences), [url_launcher](https://pub.dev/packages/url_launcher), [share_plus](https://pub.dev/packages/share_plus), [webview_flutter](https://pub.dev/packages/webview_flutter) |
| Platform | Android (published), iOS/macOS project scaffold included |

---

## Getting Started

### Prerequisites

- [Flutter SDK](https://docs.flutter.dev/get-started/install) (3.x recommended)
- Android Studio or VS Code with Flutter/Dart extensions
- A **Google Maps API key** with the following APIs enabled:
  - Maps SDK for Android
  - Directions API (for route polylines)

> **Important:** Google Maps API keys are **not included** in this repository for security reasons. You must supply your own key before the app will display maps or draw routes.

### 1. Clone the repository

```bash
git clone https://github.com/memirusta/Anabasis.git
cd Anabasis
```

### 2. Install dependencies

```bash
flutter pub get
```

### 3. Configure your Google Maps API key

You need to add your key in two places:

#### Android — `AndroidManifest.xml`

Open `android/app/src/main/AndroidManifest.xml` and set your key in the `com.google.android.geo.API_KEY` meta-data entry:

```xml
<meta-data
    android:name="com.google.android.geo.API_KEY"
    android:value="YOUR_GOOGLE_MAPS_API_KEY" />
```

#### Dart — map screen source files

Replace the placeholder API key string in the following files:

- `lib/main.dart`
- `lib/Historical_Places.dart`
- `lib/Restaurant.dart`
- `lib/Oteller.dart`

Look for the `googleAPIKey` variable and set it to your key.

#### Optional — pass the key at build time with `--dart-define`

You can avoid hardcoding keys by reading from the environment:

```dart
const googleAPIKey = String.fromEnvironment('GOOGLE_MAPS_API_KEY');
```

Then run or build with:

```bash
flutter run --dart-define=GOOGLE_MAPS_API_KEY=YOUR_GOOGLE_MAPS_API_KEY
```

```bash
flutter build apk --dart-define=GOOGLE_MAPS_API_KEY=YOUR_GOOGLE_MAPS_API_KEY
```

You can also store the key in a local `.env` file (gitignored) and pass it via your IDE run configuration or a small launch script — just never commit the key to version control.

### 4. Run the app

```bash
flutter run
```

For a release APK:

```bash
flutter build apk --release
```

---

## Project Structure

```
Anabasis/
├── android/                  # Android native project (package: com.KAL2024.anabasis)
├── ios/                      # iOS native project
├── lib/
│   ├── main.dart             # App entry, home map, route polyline
│   ├── Historical_Places.dart# Historical sites map & info panels
│   ├── PlacesPage.dart       # Place detail widgets & direction buttons
│   ├── Restaurant.dart       # Restaurants map view
│   ├── Oteller.dart          # Hotels map view
│   ├── sidebar_navigation.dart # Drawer navigation
│   ├── Settingsmenu.dart     # Language, theme & color settings
│   ├── about_page.dart       # About the Anabasis Road
│   ├── theme_notifier.dart   # Theme & locale state (Provider)
│   ├── Location_Permission.dart
│   ├── internet_connection_page.dart
│   ├── l10n/                 # ARB localization files (tr, en, ru, de, ar)
│   └── generated/            # Auto-generated localization code
├── pubspec.yaml
└── README.md
```

---

## Localization

Supported locales are defined in `lib/l10n/`:

| Language | ARB file | Locale |
|---|---|---|
| Turkish | `app_tr.arb` | `tr` |
| English | `app_en.arb` | `en` |
| Russian | `app_ru.arb` | `ru` |
| German | `app_de.arb` | `de` |
| Arabic | `app_ar.arb` | `ar` |

After editing ARB files, regenerate localizations:

```bash
flutter gen-l10n
```

---

## About the Anabasis Road

The Anabasis Road is a historic route in the Maçka district of Trabzon, associated with the march of Greek soldiers in the 4th century BCE. The app was developed as part of a **TÜBİTAK**-related project to promote cultural tourism along this route and highlight the region's monasteries, highlands, and archaeological sites.

Learn more: [Maçka Municipality — Anabasis Yolu](http://www.macka.gov.tr/anabasis-yolu)

---

## Developer

**Mehmet Emir Usta**

- GitHub: [@memirusta](https://github.com/memirusta)
- LinkedIn: [mehmet-emir-usta](https://www.linkedin.com/in/mehmet-emir-usta-560831256/)

---

## License

This repository does not currently include an open-source license. All rights reserved unless otherwise stated.

---

<p align="center">
  <a href="https://play.google.com/store/apps/details?id=com.KAL2024.anabasis">
    <img alt="Get it on Google Play" src="https://play.google.com/intl/en_us/badges/static/images/badges/en_badge_web_generic.png" height="60">
  </a>
</p>
