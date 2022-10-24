import 'package:dro_health/src/app/theme/colors.dart';
import 'package:dro_health/src/ui/reuseable_widgets/text/app_text.dart';
import 'package:dro_health/src/utils/constants/assets.dart';
import 'package:dro_health/src/utils/constants/strings.dart';
import 'package:flutter/material.dart';

class Appbar extends StatelessWidget {
  final String title;
  final Widget? searchBar;
  final Widget? icon;
  final VoidCallback? onBackPressed;

  const Appbar({
    this.icon,
    this.title = Strings.pharmacyText,
    this.searchBar,
    Key? key,
    this.onBackPressed,
  }) : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return Container(
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
      padding: const EdgeInsets.only(
        left: 18,
        right: 24,
        bottom: 18,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  if (onBackPressed != null)
                    IconButton(
                      onPressed: onBackPressed!,
                      icon: const Icon(Icons.arrow_back_ios),
                    ),
                  AppText.titleWhite(title),
                ],
              ),
              if (icon != null) icon!,
            ],
          ),
          if (searchBar != null)
            Padding(
              padding: const EdgeInsets.only(top: 21.0),
              child: searchBar!,
            ),
        ],
      ),
    );
  }
}
