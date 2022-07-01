import 'package:dro_health/src/ui/reuseable_widgets/icon_widgets/circle_cap.dart';
import 'package:dro_health/src/utils/utils.dart';
import 'package:flutter/material.dart';

class DeliveryIcon extends StatelessWidget {
  final bool isDelivering;

  const DeliveryIcon({
    this.isDelivering = true,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      fit: StackFit.loose,
      children: [
        Image.asset(Assets.deliveryIcon),
        if (isDelivering)
          const Positioned(
            left: 19,
            bottom: 16,
            child: CircleCap(),
          ),
      ],
    );
  }
}
