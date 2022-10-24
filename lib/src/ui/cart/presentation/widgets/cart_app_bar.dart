import 'package:dro_health/src/app/app_barrel.dart';
import 'package:dro_health/src/ui/reuseable_widgets/reusable_widgets.dart';
import 'package:dro_health/src/utils/utils.dart';
import 'package:flutter/material.dart';

class CartAppBar extends StatelessWidget {
  final VoidCallback? onBackPressed;

  const CartAppBar({
    Key? key,
    this.onBackPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            AppColors.purpleGradientStart,
            AppColors.purpleGradientEnd,
          ],
        ),
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(20),
        ),
        image: DecorationImage(
          image: AssetImage(
            Assets.appBarRings,
          ),
          alignment: Alignment.centerRight,
          fit: BoxFit.fitHeight,
        ),
      ),
      alignment: Alignment.bottomCenter,
      padding: const EdgeInsets.only(
        left: 20,
        right: 24,
        bottom: 15,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (onBackPressed != null)
            IconButton(
              padding: EdgeInsets.zero,
              onPressed: onBackPressed!,
              icon: const Icon(Icons.arrow_back_ios),
            ),
          const CartIcon(
            hasItems: false,
          ),
          AppText.titleWhite(
            Strings.cart,
          ),
        ],
      ),
    );
  }
}
