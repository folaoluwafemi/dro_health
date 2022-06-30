import 'package:dro_health/src/app/theme/colors.dart';
import 'package:flutter/material.dart';

class AppOutlinedButton extends StatelessWidget {
  final double? height;
  final double? width;
  final bool stretched;
  final Widget child;
  final VoidCallback onPressed;

  const AppOutlinedButton({
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
        fillColor: AppColors.white,
        onPressed: onPressed,
        child: child,
      ),
    );
  }
}
