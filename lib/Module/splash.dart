// ignore_for_file: use_build_context_synchronously, avoid_print
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:testapp/Routes/app_routes.dart';
import 'package:testapp/Utils/AppText/size_conifg.dart';
import 'package:testapp/Utils/Theme/colors.dart';
import 'package:testapp/Utils/constant/app_images.dart';


class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    setState(() {});
    Timer(const Duration(seconds: 3), () {
      Navigator.pushNamed(
        context,
        MyRoutes.onBoardingPage,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColor.screenBG,
        body: Column(
          children: [
            Container(
              height: AppConfig(context).height,
              width: AppConfig(context).width,
              decoration: BoxDecoration(
                  color: AppColor.screenBG,
                  image: DecorationImage(
                      image: AssetImage(AppImages.splash), fit: BoxFit.cover)),
            ),
          ],
        ));
  }
}
