import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeNotifier extends ChangeNotifier {
  Locale _currentLocale = const Locale('tr');
  Locale get currentLocale => _currentLocale;

  void setLocale(Locale locale) {
    _currentLocale = locale;
    _saveLocale();
    notifyListeners();
  }

  Color _primaryColor = Colors.lightBlue;
  ThemeMode _themeMode = ThemeMode.light;
  final String _themeKey = 'theme_preference';
  final String _localeKey = 'locale_preference';
  final String _colorKey = 'color_preference';

  ThemeMode get themeMode => _themeMode;

  void _setPrimaryColor(Color color) async {
    _primaryColor = color;
    _saveColor();
    notifyListeners();
  }

  void changePrimaryColor(Color color) {
    _setPrimaryColor(color);
    notifyListeners();
  }

  ThemeNotifier() {
    _loadTheme();
    _loadLocale();
    _loadColor(); // Renkleri yükle
  }

  Color get primaryColor => _primaryColor;

  void toggleTheme() {
    _themeMode = _themeMode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    _saveTheme();
    notifyListeners();
  }

  Future<void> _saveColor() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt(_colorKey, _primaryColor.value);
    print('Color saved: $_primaryColor');
  }

  Future<void> _loadColor() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final int? colorValue = prefs.getInt(_colorKey);

    if (colorValue != null) {
      _primaryColor = Color(colorValue);
      notifyListeners();
      print('Color loaded: $_primaryColor');
    } else {
      _primaryColor = Colors.lightBlue; // Varsayılan renk
      notifyListeners();
      print('Initial color set: $_primaryColor');
    }
  }

  Future<void> _loadTheme() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final int? themeIndex = prefs.getInt(_themeKey);

    if (themeIndex != null) {
      _themeMode = ThemeMode.values[themeIndex];
      notifyListeners();
      print('Theme loaded: $_themeMode');
    } else {
      _themeMode = ThemeMode.system == ThemeMode.dark ? ThemeMode.dark : ThemeMode.light;
      notifyListeners();
      print('Initial theme set to device theme: $_themeMode');
    }
  }

  Future<void> _saveTheme() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt(_themeKey, _themeMode.index);
    print('Theme saved: $_themeMode');
  }

  Future<void> _loadLocale() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? savedLocale = prefs.getString(_localeKey);

    if (savedLocale != null) {
      _currentLocale = Locale(savedLocale);
      notifyListeners();
      print('Locale loaded: $_currentLocale');
    } else {
      Locale deviceLocale = WidgetsBinding.instance.window.locale;
      if (['tr', 'en', 'ar', 'de', 'ru'].contains(deviceLocale.languageCode)) {
        _currentLocale = deviceLocale;
      } else {
        _currentLocale = const Locale('en'); // Varsayılan dil
      }

      notifyListeners();
      print('Initial locale set: $_currentLocale');
    }
  }

  Future<void> _saveLocale() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(_localeKey, _currentLocale.languageCode);
    print('Locale saved: $_currentLocale');
  }
}
