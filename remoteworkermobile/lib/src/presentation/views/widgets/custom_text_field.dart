import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:remoteworkermobile/src/core/constants.dart';
import 'package:responsive_framework/responsive_framework.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final Color? labelColor;
  final IconButton? suffixIcon;
  final Widget? prefix;
  final Widget? suffix;
  final String? Function(String?)? validator;
  final bool? obscureText;
  final double? borderRadius;
  final bool? filled;
  final double? fontSize;
  final EdgeInsets? contentPadding;
  final FontWeight? fontWeight;
  final TextInputType? textInputType;
  final BorderSide? borderSide;
  final int? minLines;
  final int? maxLines;
  final int? maxLength;
  final InputBorder? border;
  final InputBorder? focusedBorder;
  final InputBorder? enabledBorder;
  final List<TextInputFormatter>? inputFormatters;
  final double? height;
  final void Function(String)? onChanged;
  final void Function(String?)? onSaved;
  final void Function()? onEditingComplete;
  final TextAlign? textAlign;
  final Color? textColor;
  final bool? enabled;
  final FocusNode? focusNode;
  final Color? fillColor;
  final bool? autofill;
  final String? initalValue;
  final bool? readOnly;
  final TextStyle? labelStyle;
  const CustomTextField(
      {Key? key,
      required this.controller,
      required this.label,
      this.labelColor,
      this.suffixIcon,
      this.prefix,
      this.suffix,
      this.validator,
      this.obscureText,
      this.borderRadius,
      this.filled,
      this.fontSize,
      this.contentPadding,
      this.fontWeight,
      this.textInputType,
      this.borderSide,
      this.minLines,
      this.maxLines,
      this.maxLength,
      this.border,
      this.focusedBorder,
      this.enabledBorder,
      this.inputFormatters,
      this.height,
      this.onChanged,
      this.onSaved,
      this.onEditingComplete,
      this.textAlign,
      this.textColor,
      this.enabled,
      this.focusNode,
      this.fillColor,
      this.autofill,
      this.initalValue,
      this.readOnly,
      this.labelStyle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final sp = (MediaQuery.of(context).size.width / 3) / 100;

    return TextFormField(
      initialValue: initalValue,
      textAlign: textAlign ?? TextAlign.start,
      autofillHints: obscureText == null
          ? (autofill == null || autofill!)
              ? const [AutofillHints.email, AutofillHints.name]
              : null
          : null,
      controller: controller,
      enabled: enabled ?? true,
      focusNode: focusNode,
      style: TextStyle(
          fontSize: fontSize ?? 12 * sp,
          fontFamily: 'DMSans',
          fontWeight: fontWeight,
          height: height,
          color: textColor),
      obscureText: obscureText ?? false,
      keyboardType: textInputType,
      minLines: minLines,
      maxLines: obscureText != null && obscureText! ? 1 : maxLines ?? 1,
      inputFormatters: inputFormatters,
      maxLength: maxLength,
      onChanged: onChanged != null ? (_) => onChanged!(_) : null,
      onSaved: onSaved != null ? (_) => onSaved!(_) : null,
      onEditingComplete:
          onEditingComplete != null ? () => onEditingComplete!() : null,
      validator: validator,
      readOnly: readOnly ?? false,
      decoration: InputDecoration(
        contentPadding: contentPadding ??
            EdgeInsets.symmetric(vertical: 10 * sp, horizontal: 10 * sp),
        isDense: true,
        fillColor: Colors.white,
        filled: filled ?? false,
        border: border ??
            OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadius ?? 10),
              borderSide: borderSide ?? const BorderSide(color: Colors.grey),
            ),
        enabledBorder: enabledBorder ??
            border ??
            OutlineInputBorder(
                borderRadius: BorderRadius.circular(borderRadius ?? 10),
                borderSide: borderSide ?? BorderSide(color: Colors.grey)),
        focusedBorder: focusedBorder ??
            border ??
            OutlineInputBorder(
                borderRadius: BorderRadius.circular(borderRadius ?? 10),
                borderSide:
                    borderSide ?? BorderSide(color: ThemeColor.mainColor)),
        hintText: label,
        hintStyle: labelStyle ?? TextStyle(color: labelColor ?? Colors.grey),
        errorStyle: TextStyle(fontSize: FontSize.small()),
        suffix: suffix,
        suffixIcon: suffixIcon,
        suffixIconConstraints: ResponsiveBreakpoints.of(context).isPhone
            ? const BoxConstraints(
                maxWidth: 35,
                maxHeight: 25,
              )
            : null,
        prefixIcon: prefix,
        prefixIconConstraints: const BoxConstraints(
          minWidth: 25,
          minHeight: 25,
        ),
      ),
    );
  }
}

class FontSize {
  static double _sp = 1.0;

  // Set the scale factor using:
  // FontSize.scaleFactor = ResponsiveBreakpoints.of(context).isMobile ? (w / 3) / 100 : (w / 3) / 150;

  static set scaleFactor(double value) {
    _sp = value;
  }

  static double get sp => _sp;

  static double xsmall() {
    return 7.0 * sp;
  }

  static double small() {
    return 8.0 * sp;
  }

  static double medium() {
    return 10.0 * sp;
  }

  static double large() {
    return 11.0 * sp;
  }

  static double larger() {
    return 14.0 * sp;
  }

  static double largest() {
    return 20.0 * sp;
  }
}
