import 'package:dro_health/src/app/theme/colors.dart';
import 'package:flutter/material.dart';

class CircleCap extends StatelessWidget {
  const CircleCap({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const CircleAvatar(
      minRadius: 3.02,
      backgroundColor: AppColors.paleYellow,
    );
  }
}
