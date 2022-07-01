import 'package:dro_health/src/ui/reuseable_widgets/icon_widgets/circle_cap.dart';
import 'package:dro_health/src/utils/constants/assets.dart';
import 'package:flutter/material.dart';

class CartIcon extends StatelessWidget {
  final bool hasItems;

  const CartIcon({
    Key? key,
    this.hasItems = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      fit: StackFit.loose,
      children: [
        Image.asset(
          Assets.cartIcon,
          height: 21,
          width: 23,
        ),
        if (hasItems)
          const Positioned(
            left: 19,
            bottom: 16,
            child: CircleCap(),
          ),
      ],
    );
  }
}
