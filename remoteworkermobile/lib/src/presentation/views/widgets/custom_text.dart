import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;
  final FontWeight? fontWeight;
  final Color? color;
  final double? fontSize;
  final TextAlign? textAlign;
  final String? fontFamily;
  final TextDecoration? textDecoration;
  final double? height;
  final TextOverflow? textOverflow;
  final int? maxLines;
  final double? letterSpacing;
  final FontStyle? fontStyle;
  const CustomText(
      {super.key,
      required this.text,
      this.fontWeight,
      this.color,
      this.fontSize,
      this.textAlign,
      this.fontFamily,
      this.textDecoration,
      this.height,
      this.textOverflow,
      this.maxLines,
      this.letterSpacing,
      this.fontStyle});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          color: color ?? Colors.black,
          fontFamily: fontFamily ?? 'sans',
          fontWeight: fontWeight,
          fontSize: fontSize ?? 10,
          decoration: textDecoration,
          height: height,
          letterSpacing: letterSpacing,
          fontStyle: fontStyle),
      textAlign: textAlign,
      softWrap: true,
      maxLines: maxLines,
      overflow: textOverflow ?? TextOverflow.visible,
    );
  }
}
