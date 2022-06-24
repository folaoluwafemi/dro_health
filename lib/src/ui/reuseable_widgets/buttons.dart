import 'package:dro_health/src/app/theme/colors.dart';
import 'package:flutter/material.dart';

class OutlinedButton extends StatelessWidget {
  final double? height;
  final double? width;
  final bool stretched;
  final Widget child;
  final VoidCallback onPressed;

  const OutlinedButton({
    required this.onPressed,
    required this.child,
    this.stretched = false,
    this.height = 40,
    this.width = 154,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: stretched ? null : width,
      child: RawMaterialButton(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
          side: BorderSide(
            width: 1.5,
            color: AppColors.purple,
          ),
        ),
        fillColor: Colors.transparent,
        onPressed: onPressed,
        child: child,
      ),
    );
  }
}

class FilledButton extends StatelessWidget {
  final double? height;
  final double? width;
  final bool stretched;
  final Widget child;
  final VoidCallback onPressed;

  const FilledButton({
    required this.onPressed,
    required this.child,
    this.stretched = false,
    this.height = 50,
    this.width = 207,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: const Color(0xAD3BFC26).withOpacity(0.15),
              offset: const Offset(4, 10),
              blurRadius: 8,
              spreadRadius: 8,
            ),
          ],
          borderRadius: const BorderRadius.all(
            Radius.circular(10),
          ),
          gradient: const LinearGradient(
            colors: [
              AppColors.purpleGradientStart,
              AppColors.purpleGradientEnd,
            ],
          ),
        ),
        child: child,
      ),
    );
  }
}
