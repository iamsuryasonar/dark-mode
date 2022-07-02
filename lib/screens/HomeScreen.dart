import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterdarklightmode/main.dart';
import 'package:flutterdarklightmode/provider/languageprovider.dart';
import 'package:localization/localization.dart';
import 'package:provider/provider.dart';

import '../provider/themeprovider.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<DarkThemeProvider>(context);
    final locale = Localizations.localeOf(context);
    return Scaffold(
      appBar: AppBar(title: Text("home-title".i18n([locale.toString()]))),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            themeChange.darkTheme
                ? const Text(
                    'Teal Accent',
                    style: TextStyle(color: Colors.tealAccent),
                  )
                : const Text(
                    'Red',
                    style: TextStyle(color: Colors.red),
                  ),
            Checkbox(
              value: themeChange.darkTheme,
              shape: const CircleBorder(),
              onChanged: (bool? value) {
                themeChange.darkTheme = value!;
              },
            ),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Elevated'),
            ),
            Text("welcome".i18n(["22/06"])),
            TextField(
                decoration: InputDecoration(labelText: "login-label".i18n())),
            TextField(
                decoration:
                    InputDecoration(labelText: "password-label".i18n())),
            ElevatedButton(
              child: Text(
                "change-value".i18n(),
              ),
              onPressed: () {
                if (context.read<LanguageProvider>().currentLocale ==
                    const Locale('en', '')) {
                  context.read<LanguageProvider>().changeLocale('pt');
                } else if (context.read<LanguageProvider>().currentLocale ==
                    const Locale('pt', '')) {
                  context.read<LanguageProvider>().changeLocale('en');
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
