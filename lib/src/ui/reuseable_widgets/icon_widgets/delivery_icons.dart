import 'package:dro_health/src/app/theme/colors.dart';
import 'package:dro_health/src/utils/utils.dart';
import 'package:flutter/material.dart';

class DeliveryIcon extends StatelessWidget {
  const DeliveryIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(Assets.deliveryIcon),
        const Positioned(
          left: 19,
          bottom: 16,
          child: CircleCap(),
        ),
      ],
    );
  }
}

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
