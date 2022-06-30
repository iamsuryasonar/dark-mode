import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
    return Scaffold(
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
          ],
        ),
      ),
    );
  }
}
