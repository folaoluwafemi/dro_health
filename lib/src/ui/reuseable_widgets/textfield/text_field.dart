import 'package:dro_health/src/app/theme/colors.dart';
import 'package:flutter/material.dart';

class AppTextField extends StatelessWidget {
  final TextEditingController? controller;
  final double? width;
  final double? height;
  final String? hintText;
  final EdgeInsetsGeometry? contentPadding;
  final Widget? icon;
  final InputBorder? inputBorder;
  final ValueChanged<String?> onChanged;
  final VoidCallback? onTap;
  final Color? color;
  final FocusNode? focusNode;

  const AppTextField({
    required this.onChanged,
    this.controller,
    this.width,
    this.height,
    this.hintText,
    this.icon,
    Key? key,
    this.onTap,
    this.focusNode,
    this.contentPadding,
    this.inputBorder,
    this.color,
  }) : super(key: key);

  get _style => const TextStyle(
        color: AppColors.white,
        fontWeight: FontWeight.w600,
        fontSize: 18,
      );

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 14),
      decoration: BoxDecoration(
        color: color ?? Colors.white.withOpacity(0.2),
        borderRadius: const BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      child: TextField(
        onChanged: onChanged,
        onTap: onTap,
        controller: controller,
        style: _style,
        focusNode: focusNode,
        decoration: InputDecoration(
          enabledBorder: inputBorder ?? textFieldBorder(),
          border: inputBorder ?? textFieldBorder(),
          focusedBorder: inputBorder ?? textFieldBorder(),
          hintText: hintText,
          hintStyle: _style,
          icon: icon,
          contentPadding: contentPadding ?? const EdgeInsets.all(9),
        ),
      ),
    );
  }
}

InputBorder textFieldBorder() => const OutlineInputBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(10),
      ),
      borderSide: BorderSide.none,
    );
