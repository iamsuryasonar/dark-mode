import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutterdarklightmode/provider/languageprovider.dart';
import 'package:flutterdarklightmode/provider/themeprovider.dart';
import 'package:flutterdarklightmode/screens/HomeScreen.dart';
import 'package:flutterdarklightmode/utils/theme/styles.dart';
import 'package:localization/localization.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
        providers: [
          ChangeNotifierProvider<LanguageProvider>(
            create: (_) => LanguageProvider(),
          ),
          ChangeNotifierProvider<DarkThemeProvider>(
            create: (_) => DarkThemeProvider(),
          ),
        ],
        builder: (context, child) {
          return const MyApp();
        }),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  DarkThemeProvider themeChangeProvider = DarkThemeProvider();

  @override
  void initState() {
    super.initState();
    getCurrentAppTheme();
  }

  void getCurrentAppTheme() async {
    context.read<DarkThemeProvider>().updateTheme(
          await themeChangeProvider.darkThemeSharedPreference.getTheme(),
        );
  }

  @override
  Widget build(BuildContext context) {
    LocalJsonLocalization.delegate.directories = ['lib/i18n'];

    return MaterialApp(
      title: 'Dark&light Mode',
      debugShowCheckedModeBanner: false,
      //localisation
      locale: context.watch<LanguageProvider>().currentLocale,
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        LocalJsonLocalization.delegate,
      ],
      supportedLocales: const [
        Locale('en', ''), // English, no country code
        Locale('pt', ''), // Spanish, no country code
      ],

      //theme
      theme: Styles.themeData(
          context.watch<DarkThemeProvider>().darkTheme, context),
      home: const MyHomePage(),
    );
  }
}
