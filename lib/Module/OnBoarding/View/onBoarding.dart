// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testapp/Module/OnBoarding/View/components/bottom_button.dart';
import 'package:testapp/Module/OnBoarding/View/onBoard_Screens.dart';
import 'package:testapp/Module/OnBoarding/ViewModel/onBoarding_view_model.dart';

import 'package:testapp/Utils/Theme/colors.dart';

class OnBoardingPage extends StatefulWidget {
  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<AppColor>(builder: (context, value, child) {
      return Scaffold(
          backgroundColor: AppColor.screenBG,
          body: Stack(
            children: [
              Consumer<OnBoardingProvider>(
                builder: (context, value, child) {
                  return Container(
                    padding: const EdgeInsets.only(bottom: 0),
                    child: PageView(
                      physics: const NeverScrollableScrollPhysics(),
                      controller: value.controller,
                      onPageChanged: value.setPage,
                      children: const [
                        Screen(index: 0),
                        Screen(index: 1),
                        Screen(index: 2),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
          bottomNavigationBar: const BottomButton());
    });
  }
}
