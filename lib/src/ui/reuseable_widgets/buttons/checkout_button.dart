import 'package:dro_health/src/app/app_barrel.dart';
import 'package:dro_health/src/ui/reuseable_widgets/text/app_text.dart';
import 'package:dro_health/src/utils/constants/assets.dart';
import 'package:dro_health/src/utils/constants/strings.dart';
import 'package:flutter/material.dart';

class CheckoutButton extends StatelessWidget {
  final bool expanded;
  final int items;
  final double width;
  final double height;

  const CheckoutButton({
    required this.items,
    this.expanded = true,
    Key? key,
    this.width = 142,
    this.height = 43,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: () => Navigator.of(context).pushNamed(Routes.cartPage),
      child: Container(
        width: expanded ? width : 43,
        height: height,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(
            Radius.circular(50),
          ),
          gradient: const LinearGradient(
            colors: [
              AppColors.redGradientStart,
              AppColors.redGradientEnd,
            ],
          ),
          boxShadow: const [
            BoxShadow(
              offset: Offset(2, 4),
              blurRadius: 10,
              spreadRadius: 1,
            ),
          ],
          border: Border.all(
            color: AppColors.white,
          ),
        ),
        padding: const EdgeInsets.all(13),
        child: expanded
            ? Row(
                children: [
                  AppText.white(
                    Strings.checkout,
                    weight: FontWeight.w700,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 7),
                    child: Image.asset(Assets.cartIcon),
                  ),
                  _ItemCountIcon(
                    items: items,
                  ),
                ],
              )
            : Stack(
                clipBehavior: Clip.none,
                children: [
                  Image.asset(Assets.cartIcon),
                  Positioned(
                    left: 14.3333,
                    bottom: 14.3333,
                    child: _ItemCountIcon(
                      items: items,
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}

class _ItemCountIcon extends StatelessWidget {
  final int items;

  const _ItemCountIcon({
    Key? key,
    required this.items,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      minRadius: 9,
      backgroundColor: AppColors.paleYellow,
      child: AppText.smallBold(
        '$items',
        color: AppColors.black,
      ),
    );
  }
}
