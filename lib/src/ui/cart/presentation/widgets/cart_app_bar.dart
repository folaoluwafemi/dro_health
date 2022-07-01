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
        left: 24,
        right: 24,
        bottom: 30,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (onBackPressed != null)
            Padding(
              padding: const EdgeInsets.only(bottom: 1.0, right: 7),
              child: InkWell(
                onTap: onBackPressed!,
                child: const Icon(Icons.arrow_back_ios),
              ),
            ),
          const CartIcon(
            hasItems: false,
          ),
          boxWidth(15),
          AppText.titleWhite(
            Strings.cart,
          ),
        ],
      ),
    );
  }
}
