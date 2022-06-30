import 'package:flutter/material.dart';
import 'package:flutterdarklightmode/provider/themeprovider.dart';
import 'package:flutterdarklightmode/screens/HomeScreen.dart';
import 'package:flutterdarklightmode/utils/styles.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  DarkThemeProvider themeChangeProvider = DarkThemeProvider();

  @override
  void initState() {
    super.initState();
    getCurrentAppTheme();
  }

  void getCurrentAppTheme() async {
    themeChangeProvider.darkTheme =
        await themeChangeProvider.darkThemePreference.getTheme();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) {
        return themeChangeProvider;
      },
      child: Consumer<DarkThemeProvider>(
        builder: (context, ref, child) {
          return MaterialApp(
            title: 'Dark&light Mode',
            theme: Styles.themeData(themeChangeProvider.darkTheme, context),
            // darkTheme: ThemeData.dark(),
            home: const MyHomePage(),
            debugShowCheckedModeBanner: false,
          );
        },
      ),
    );
  }
}

