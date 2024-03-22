import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testapp/Module/OnBoarding/ViewModel/onBoarding_view_model.dart';
import 'package:testapp/Module/Home/ViewModel/home_view_model.dart';
import 'package:testapp/Utils/Theme/colors.dart';

MultiProvider myProviders(
    {required BuildContext context, required Builder child}) {
  return MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => AppColor()),
      ChangeNotifierProvider(create: (context) => OnBoardingProvider()),
      ChangeNotifierProvider(create: (context) => HomeProvider()),
    ],
    child: child,
  );
}
