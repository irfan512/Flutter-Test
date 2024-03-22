import 'package:flutter/material.dart';
import 'package:testapp/Utils/AppText/FontType.dart';

class CustomText extends StatelessWidget {
  final String title;
  final TextAlign alignment;
  final TextOverflow txtOverFlow;
  final FontStyle style;
  final double letterSpacce;
  final Color color;
  final TextDecoration textDecoration;
  final FontWeight fontWeight;
  final double size;
  final FontType fontType;
  final int? maxLines;
  final bool softWrap;
  const CustomText({
    super.key,
    this.fontType = FontType.Poppins,
    this.size = 14,
    this.fontWeight = FontWeights.regular,
    this.textDecoration = TextDecoration.none,
    this.color = Colors.black,
    this.letterSpacce = 0,
    this.style = FontStyle.normal,
    this.alignment = TextAlign.start,
    this.txtOverFlow = TextOverflow.visible,
    required this.title,
    this.maxLines,
    this.softWrap = false,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      textAlign: alignment,
      maxLines: maxLines,
      softWrap:softWrap ,
      style: TextStyle(
        
        overflow: txtOverFlow,
        fontStyle: style,
        letterSpacing: letterSpacce,
        fontFamily: fontType == FontType.Urbanist
            ? "Urbanist"
            : fontType == FontType.Urbanist
                ? "Urbanist"
                : fontType == FontType.Urbanist
                    ? "Urbanist"
                    : fontType == FontType.Urbanist
                        ? "Urbanist"
                        : "Urbanist",
        color: color,
        decoration: textDecoration,
        fontWeight: fontWeight,
        fontSize: size,
      ),
    );
  }
}
