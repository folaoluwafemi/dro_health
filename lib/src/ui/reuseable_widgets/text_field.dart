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

  const AppTextField({
    required this.onChanged,
    this.controller,
    this.width,
    this.height,
    this.hintText,
    this.icon,
    Key? key,
    this.onTap,
    this.contentPadding,
    this.inputBorder,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChanged,
      onTap: onTap,
      controller: controller,
      style: const TextStyle(
        fontSize: 18,
      ),
      decoration: InputDecoration(
        enabledBorder: inputBorder ?? textFieldBorder(),
        border: inputBorder ?? textFieldBorder(),
        focusedBorder: inputBorder ?? textFieldBorder(),
        hintText: hintText,
        icon: icon,
        fillColor: color ?? Colors.white.withOpacity(0.2),
        contentPadding: contentPadding ?? const EdgeInsets.all(9),
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
