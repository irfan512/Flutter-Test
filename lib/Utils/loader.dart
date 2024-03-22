import 'package:flutter/material.dart';
import 'package:testapp/Utils/AppText/size_conifg.dart';
import 'package:testapp/Utils/Theme/colors.dart';
import 'package:testapp/Utils/constant/app_images.dart';



void hideOpenDialog({
  required BuildContext context,
}) {
  Navigator.of(context).pop();
}

void showLoadingIndicator(
    {required BuildContext context, bool isDark = false}) {
  showDialog(
    barrierDismissible: false,
    useRootNavigator: false,
    context: context,
    builder: (BuildContext context) {
      return Padding(
        padding: EdgeInsets.symmetric(
          horizontal: AppConfig(context).width / 2 - 35,
          vertical: 20,
        ),
        child: Dialog(
          shape: RoundedRectangleBorder(
            borderRadius:
                BorderRadius.circular(10.0), // Adjust the radius as needed
          ),
          insetPadding: EdgeInsets.zero,
          child: SizedBox(
            height: 60,
            width: 60,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Image(
                  height: 30,
                  image: AssetImage(AppImages.splash),
                ),
                 SizedBox(
                  height: 50,
                  width: 50,
                  child: CircularProgressIndicator(
                    color: AppColor.primaryColor,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}
