import 'package:dro_health/src/app/theme/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppText extends StatelessWidget {
  final String text;
  final double? fontSize;
  final TextAlign? textAlign;
  final FontWeight? weight;
  final Color? color;

  const AppText(
    this.text, {
    this.fontSize = 14,
    this.textAlign = TextAlign.center,
    this.weight = FontWeight.w400,
    this.color = AppColors.black,
    Key? key,
  }) : super(key: key);

  ///size : 12
  static AppText small(
    String text, {
    Color? color,
    FontWeight? weight,
  }) =>
      AppText(
        text,
        color: color,
        weight: weight,
        fontSize: 12,
      );

  ///size : 12
  ///weight: FontWeight.w700
  static AppText smallBold(
    String text, {
    Color? color,
  }) =>
      AppText(
        text,
        color: color,
        weight: FontWeight.w700,
        fontSize: 12,
      );

  static AppText white(
    String text, {
    FontWeight? weight,
  }) =>
      AppText(
        text,
        color: AppColors.white,
        weight: weight,
      );

  static AppText titleWhite(String text) => AppText(
        text,
        color: AppColors.white,
        fontSize: 22,
        weight: FontWeight.w700,
      );

  static AppText medium(
    String text, {
    Color? color,
    FontWeight? weight,
  }) =>
      AppText(
        text,
        color: color,
        weight: weight,
        fontSize: 16,
      );

  static AppText bold(
    String text, {
    Color? color,
  }) =>
      AppText(
        text,
        color: color,
        weight: FontWeight.w700,
      );

  static AppText mediumLarge(
    String text, {
    Color? color,
    FontWeight? weight,
  }) =>
      AppText(
        text,
        color: color,
        weight: weight,
        fontSize: 18,
      );

  static AppText price(
    String text,
  ) =>
      AppText(
        text,
        weight: FontWeight.w700,
        fontSize: 18,
      );

  static AppText large(
    String text, {
    Color? color,
    FontWeight? weight,
  }) =>
      AppText(
        text,
        color: color,
        weight: weight,
        fontSize: 20,
      );

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: 'ProximaNova',
        fontSize: fontSize,
        fontWeight: weight,
        color: color,
      ),
      textAlign: textAlign,
    );
  }
}
