import 'package:dro_health/src/app/theme/colors.dart';
import 'package:dro_health/src/utils/constants/assets.dart';
import 'package:flutter/material.dart';

class FavoriteIcon extends StatelessWidget {
  final bool isFavorite;
  final VoidCallback? onPressed;

  const FavoriteIcon(
    this.isFavorite, {
    Key? key,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.all(7),
        decoration: BoxDecoration(
          color: AppColors.purple.withOpacity(0.1),
          borderRadius: const BorderRadius.all(
            Radius.circular(3),
          ),
        ),
        child: isFavorite
            ? Image.asset(
                Assets.favoriteIconFilled,
                color: AppColors.purple,
                width: 18,
              )
            : Image.asset(
                Assets.favoriteIcon,
                color: AppColors.purple,
                width: 18,
              ),
      ),
    );
  }
}
