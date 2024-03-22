// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:testapp/Module/OnBoarding/Model/onBoarding_model.dart';
import 'package:testapp/Module/OnBoarding/View/components/dot_indicator.dart';
import 'package:testapp/Utils/AppText/FontType.dart';
import 'package:testapp/Utils/AppText/size_conifg.dart';
import 'package:testapp/Utils/Theme/colors.dart';
import 'package:testapp/Utils/constant/AppTextView.dart';
import 'package:testapp/Utils/constant/app_images.dart';

class Screen extends StatefulWidget {
  final int index;
  const Screen({super.key, required this.index});

  @override
  State<Screen> createState() => _ScreenState();
}

class _ScreenState extends State<Screen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<AppColor>(builder: (context, value, child) {
      return Column(children: [
        Container(
          height: AppConfig(context).height * .65,
          color: AppColor.onBoard,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 50, left: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: () {
                        if (value.getTheme == ThemeMode.dark) {
                          value.setTheme(ThemeMode.light);
                        } else {
                          value.setTheme(ThemeMode.dark);
                        }
                      },
                      child: Image.asset(
                        AppImages.theme,
                        color: AppColor.white,
                        scale: 15,
                      ),
                    ),
                    Gap.w(15),
                    CustomText(
                      title: 'Theme Mode',
                      size: 15,
                      color: AppColor.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ],
                ),
              ),
              Container(
                height: AppConfig(context).height * .42,
                width: AppConfig(context).width,
                child: Image.asset(
                  onBoardingScreenModel[widget.index].image,
                  scale: 4,
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Container(
            width: AppConfig(context).width,
            color: AppColor.screenBG,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CustomText(
                    txtOverFlow: TextOverflow.visible,
                    softWrap: true,
                    alignment: TextAlign.center,
                    title: onBoardingScreenModel[widget.index].title,
                    size: 25,
                    fontWeight: FontWeight.w700,
                    fontType: FontType.Urbanist,
                    color: AppColor.white,
                  ),
                  Gap.h(10),
                  CustomText(
                    maxLines: 3,
                    txtOverFlow: TextOverflow.visible,
                    softWrap: true,
                    alignment: TextAlign.center,
                    title: onBoardingScreenModel[widget.index].detail,
                    size: 13,
                    fontWeight: FontWeight.w400,
                    fontType: FontType.Urbanist,
                    color: AppColor.lightText,
                  ),
                  Gap.h(10),
                  const DotIndicator(),
                ],
              ),
            ),
          ),
        ),
      ]);
    });
  }
}
