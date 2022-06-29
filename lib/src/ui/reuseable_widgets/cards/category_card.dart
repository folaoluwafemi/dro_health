import 'package:dro_health/src/app/theme/colors.dart';
import 'package:dro_health/src/ui/reuseable_widgets/reusable_widgets.dart';
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
      child: Stack(
        alignment: Alignment.center,
        children: [
          Image.asset(
            width: 126,
            height: 100,
            imagePath,
            fit: BoxFit.cover,
          ),
          AppText(
            category,
            color: AppColors.white,
          ),
        ],
      ),
    );
  }
}

double _aspectRatio = 1.390728476821192;
