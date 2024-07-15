import 'package:flutter/material.dart';
import 'package:remoteworkermobile/src/presentation/views/widgets/custom_text.dart';

class CustomButton extends StatelessWidget {
  final String? text;
  final double? width;
  final double? height;
  final Function? onTap;
  final Color? color;
  final double? fontSize;
  final Color? textColor;
  final FontWeight? textFontWeight;
  final BorderRadius? borderRadius;
  final Widget? customWidget;
  final double? elevation;
  final BorderSide? borderSide;
  final EdgeInsets? padding;
  final Gradient? gradient;
  final Color? borderColor;
  final bool? isInactive;
  const CustomButton(
      {super.key,
      this.text,
      this.width,
      this.height,
      this.onTap,
      this.color,
      this.fontSize,
      this.textColor,
      this.textFontWeight,
      this.borderRadius,
      this.customWidget,
      this.elevation,
      this.borderSide,
      this.padding,
      this.gradient,
      this.borderColor,
      this.isInactive});

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    final sp = (MediaQuery.of(context).size.width / 3) / 100;

    final funOnTap = onTap;

    return Container(
      width: width ?? w,
      height: height ?? 0.057 * h,
      decoration: BoxDecoration(
          gradient: gradient ??
              LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    isInactive != null && isInactive!
                        ? Colors.grey
                        : const Color(0xff7C7A48),
                    isInactive != null && isInactive!
                        ? Colors.grey
                        : const Color(0xff7C7A48)
                  ]),
          borderRadius: borderRadius ?? BorderRadius.circular(10),
          border: Border.all(color: borderColor ?? Colors.white)),
      child: ElevatedButton(
        style: ButtonStyle(
            padding: padding != null ? MaterialStatePropertyAll(padding) : null,
            backgroundColor:
                MaterialStatePropertyAll(color ?? Colors.transparent),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    side: borderSide ?? BorderSide.none,
                    borderRadius: borderRadius ?? BorderRadius.circular(10))),
            elevation:
                elevation != null ? MaterialStatePropertyAll(elevation) : null),
        onPressed: () => funOnTap != null ? funOnTap() : () {},
        child: customWidget ??
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomText(
                text: text ?? "",
                fontWeight: textFontWeight ?? FontWeight.w700,
                fontSize: fontSize ?? 15.8 * sp,
                color: textColor ?? Colors.white,
              ),
            ),
      ),
    );
  }
}
