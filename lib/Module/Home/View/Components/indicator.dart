// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testapp/Module/OnBoarding/ViewModel/onBoarding_view_model.dart';
import 'package:testapp/Utils/AppText/size_conifg.dart';
import 'package:testapp/Utils/Theme/colors.dart';


class Indicator extends StatelessWidget {
  const Indicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Center(
          child: Container(
            height: 7,
            width: AppConfig(context).width,
            child: Consumer<OnBoardingProvider>(
              builder: (context, value, child) {
                return ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return Row(
                      children: [
                        index > 0 ? Gap.w(8) : Gap.w(0),
                        AnimatedContainer(
                          curve: Curves.easeInOut,
                          duration: Duration(milliseconds: 500),
                          width: index == value.currentIndex ? 20 : 6,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: index == value.currentIndex
                                ? AppColor.lightPrimary
                                : AppColor.lightgrey,
                          ),
                        ),
                      ],
                    );
                  },
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
