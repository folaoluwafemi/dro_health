import 'package:dro_health/src/ui/reuseable_widgets/app_text.dart';
import 'package:dro_health/src/utils/constants/assets.dart';
import 'package:dro_health/src/utils/constants/strings.dart';
import 'package:flutter/material.dart';

class AppBar extends StatelessWidget {
  final String title;
  final TextField? searchBar;
  final Widget? icon;

  const AppBar({
    this.icon,
    this.title = Strings.pharmacyText,
    this.searchBar,
    Key? key,
  }) : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(20),
        ),
        image: DecorationImage(
          image: AssetImage(
            Assets.appBarRings,
          ),
          fit: BoxFit.cover,
        ),
      ),
      padding: const EdgeInsets.only(
        left: 24,
        right: 24,
        bottom: 21,
      ),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              AppText.titleWhite(
                title,
              ),
              if (icon != null) icon!,
            ],
          ),
          if (searchBar != null) searchBar!,
        ],
      ),
    );
  }
}
