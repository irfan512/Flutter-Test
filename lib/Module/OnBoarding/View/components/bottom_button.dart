import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testapp/Module/OnBoarding/ViewModel/onBoarding_view_model.dart';
import 'package:testapp/Routes/app_routes.dart';
import 'package:testapp/Utils/AppText/FontType.dart';
import 'package:testapp/Utils/AppText/size_conifg.dart';
import 'package:testapp/Utils/Theme/colors.dart';
import 'package:testapp/Utils/app_button.dart';
import 'package:testapp/Utils/constant/AppTextView.dart';

class BottomButton extends StatefulWidget {
  const BottomButton({super.key});

  @override
  State<BottomButton> createState() => _BottomButtonState();
}

class _BottomButtonState extends State<BottomButton> {
  @override
  Widget build(BuildContext context) {
    return Consumer2<OnBoardingProvider, AppColor>(
      builder: (context, value, appColor, child) {
        return value.isLastPage
            ? Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, bottom: 30),
                child: Row(
                  children: [
                    Container(
                      height: 40,
                      width: AppConfig(context).width * .42,
                      decoration: BoxDecoration(
                          color: AppColor.offwhite,
                          borderRadius: BorderRadius.circular(100)),
                      child: Center(
                        child: CustomText(
                          title: 'Skip',
                          size: 16,
                          fontWeight: FontWeights.bold,
                          color: AppColor.textColor,
                        ),
                      ),
                    ),
                    const Spacer(),
                    PrimaryBTN(
                        height: 40,
                        callback: () {
                          onNavigateFromOnBoarding(
                            context,
                            onBoardingProvider: value,
                          );
                        },
                        color: AppColor.primaryColor,
                        title: "Explore",
                        width: AppConfig(context).width * .42),
                  ],
                ),
              )
            : Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, bottom: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 40,
                      width: AppConfig(context).width * .42,
                      decoration: BoxDecoration(
                          color: AppColor.offwhite,
                          borderRadius: BorderRadius.circular(100)),
                      child: Center(
                        child: CustomText(
                          title: 'Skip',
                          size: 16,
                          fontWeight: FontWeights.bold,
                          color: AppColor.textColor,
                        ),
                      ),
                    ),
                    PrimaryBTN(
                        height: 40,
                        callback: () {
                          value.controller.nextPage(
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.easeInOut,
                          );
                        },
                        color: AppColor.primaryColor,
                        title: "Next",
                        width: AppConfig(context).width * .42),
                  ],
                ),
              );
      },
    );
  }

  Future<void> onNavigateFromOnBoarding(BuildContext context,
      {required OnBoardingProvider onBoardingProvider}) async {
    Navigator.pushNamedAndRemoveUntil(
      context,
      MyRoutes.rootView,
      (route) => false,
    );
    onBoardingProvider.dispose();
  }
}
