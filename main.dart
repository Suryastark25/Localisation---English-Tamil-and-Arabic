import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'l10n/localization.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Locale _locale = Locale('en', ''); // Default locale

  void _changeLanguage(String languageCode) {
    setState(() {
      _locale = Locale(languageCode, '');
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Localization Example',
      locale: _locale,
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('en', ''), // English
        const Locale('ta', ''), // Tamil
        const Locale('ar', ''), // Arabic
      ],
      home: MyHomePage(onChangeLanguage: _changeLanguage),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final Function(String) onChangeLanguage;

  MyHomePage({required this.onChangeLanguage});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context).get('welcome')),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(AppLocalizations.of(context).get('hello')),
            SizedBox(height: 20),
            DropdownButton<String>(
              hint: Text('Select Language'),
              onChanged: (String? newValue) {
                if (newValue != null) {
                  onChangeLanguage(newValue);
                }
              },
              items: <String>['en', 'ta', 'ar']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value.toUpperCase()),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
