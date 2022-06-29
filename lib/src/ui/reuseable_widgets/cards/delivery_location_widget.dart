import 'package:dro_health/src/app/theme/colors.dart';
import 'package:dro_health/src/ui/reuseable_widgets/text/app_text.dart';
import 'package:dro_health/src/ui/reuseable_widgets/functions/methods.dart';
import 'package:dro_health/src/utils/constants/assets.dart';
import 'package:dro_health/src/utils/constants/strings.dart';
import 'package:flutter/material.dart';

class DeliveryLocation extends StatelessWidget {
  const DeliveryLocation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 69,
      width: double.maxFinite,
      color: AppColors.lightGrey,
      padding: const EdgeInsets.only(
        left: 25,
        bottom: 16,
      ),
      alignment: Alignment.bottomLeft,
      child: Row(
        children: [
          Image.asset(Assets.locationIcon),
          tinyWidth(),
          const AppText(Strings.deliveryIn),
          AppText.bold(Strings.deliveryLocation),
        ],
      ),
    );
  }
}
