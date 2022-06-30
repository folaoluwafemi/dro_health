import 'package:dro_health/src/app/theme/colors.dart';
import 'package:dro_health/src/ui/reuseable_widgets/reusable_widgets.dart';
import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  final VoidCallback onPressed;
  final double? height;
  final double? width;
  final String category;
  final String imagePath;
  final bool selected;

  const CategoryCard({
    required this.onPressed,
    required this.category,
    required this.imagePath,
    this.selected = false,
    Key? key,
    this.height,
    this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: width ?? 126,
            height: height ?? 100,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(
                Radius.circular(11),
              ),
              image: DecorationImage(
                image: AssetImage(
                  imagePath,
                ),
                fit: BoxFit.cover,
              ),
            ),
            child: Image.asset(
              imagePath,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            width: width ?? 126,
            height: height ?? 100,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(
                Radius.circular(11),
              ),
              image: DecorationImage(
                image: AssetImage(
                  imagePath,
                ),
                fit: BoxFit.cover,
              ),
            ),
            child: Image.asset(
              imagePath,
              color: selected ? AppColors.purple.withOpacity(0.56) : null,
              fit: BoxFit.cover,
            ),
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

double categoryAspectRatio = 1.5454545;
