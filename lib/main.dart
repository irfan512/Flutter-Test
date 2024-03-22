// ignore_for_file: unused_element, unused_local_variable, avoid_print, await_only_futures

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:testapp/Routes/app_pages.dart';
import 'package:testapp/Routes/app_routes.dart';
import 'package:testapp/providers.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ],
  );

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: myProviders(
          context: context,
          child: Builder(builder: (BuildContext context) {
            return MaterialApp(
              theme: ThemeData.light(),
              darkTheme: ThemeData.dark(),
              debugShowCheckedModeBanner: false,
              title: 'Test App',
              onGenerateRoute: AppRoutes.genrateRoutes,
              initialRoute: MyRoutes.splashView,
            );
          }),
        ));
  }
}
