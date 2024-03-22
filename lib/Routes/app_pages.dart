// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:testapp/Module/OnBoarding/View/onBoarding.dart';
import 'package:testapp/Routes/app_routes.dart';
import 'package:testapp/Module/Bottom_Bar/bottom_bar.dart';
import 'package:testapp/Module/splash.dart';

class AppRoutes {
  static Route<dynamic> genrateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case MyRoutes.splashView:
        return MaterialPageRoute(builder: ((context) {
          return const SplashView();
        }));

      case MyRoutes.onBoardingPage:
        return MaterialPageRoute(builder: ((context) {
          return OnBoardingPage();
        }));
      case MyRoutes.rootView:
        return MaterialPageRoute(builder: ((context) {
          return RootView();
        }));
      default:
        {
          return MaterialPageRoute(
              builder: ((context) => Scaffold(
                    body: Container(
                      child: const Center(
                        child: Text("No Route"),
                      ),
                    ),
                  )));
        }
    }
  }
}
