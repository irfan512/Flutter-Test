import 'package:flutter/material.dart';
import 'package:testapp/Utils/Theme/colors.dart';
import 'package:testapp/Utils/constant/AppTextView.dart';

class PrimaryBTN extends StatelessWidget {
  final double width;
  final String title;
  final VoidCallback? callback;
  final double height;
  final double fontSize;
  final double borderRadius;
  final bool isGradiant;

  final Color color;
  final Color textCLR;
  final FontWeight fontWeight;

  const PrimaryBTN({
    super.key,
    this.borderRadius = 100,
    required this.callback,
    required this.color,
    this.fontSize = 16,
    this.fontWeight = FontWeight.bold,
    this.height = 56,
    this.isGradiant = true,
    this.textCLR = Colors.white,
    required this.title,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: callback,
      borderRadius: BorderRadius.circular(borderRadius),
      child: Container(
        height: height,
        width: width,
        decoration: isGradiant == false
            ? BoxDecoration(
                color: color, borderRadius: BorderRadius.circular(borderRadius))
            : BoxDecoration(
                color: color,
                gradient:  LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [
                      AppColor.darkPrimary,
                      AppColor.lightPrimary,
                    ]),
                borderRadius: BorderRadius.circular(borderRadius)),
        child: Center(
          child: CustomText(
              title: title,
              color: textCLR,
              size: fontSize,
              fontWeight: fontWeight),
        ),
      ),
    );
  }
}
