import 'dart:math' as math;

import 'package:dro_health/src/app/theme/colors.dart';
import 'package:dro_health/src/ui/reuseable_widgets/app_text.dart';
import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  final VoidCallback onPressed;
  final String category;
  final String imagePath;
  final bool selected;

  const CategoryCard({
    required this.onPressed,
    required this.category,
    required this.imagePath,
    this.selected = false,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        width: 126,
        height: 98.6,
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [
              AppColors.purpleGradientStart,
              AppColors.purpleGradientEnd,
            ],
          ),
          image: DecorationImage(
            image: AssetImage(imagePath),
          ),
          boxShadow: [
            BoxShadow(
              offset: Offset.fromDirection(math.pi / 2, 8.53),
              color: const Color(0xffc4c4c4),
            ),
          ],
        ),
        alignment: Alignment.center,
        child: AppText(
          category,
          color: AppColors.white,
        ),
      ),
    );
  }
}
