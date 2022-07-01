import 'package:dro_health/src/app/router/app_router.dart';
import 'package:dro_health/src/app/theme/colors.dart';
import 'package:dro_health/src/models/medicine/medicine_model.dart';
import 'package:dro_health/src/ui/reuseable_widgets/functions/methods.dart';
import 'package:dro_health/src/ui/reuseable_widgets/reusable_widgets.dart';
import 'package:dro_health/src/utils/constants/strings.dart';
import 'package:flutter/material.dart';

class MedicineCard extends StatelessWidget {
  final Medicine medicine;
  final double width;
  final double height;

  const MedicineCard({
    required this.medicine,
    this.width = 169,
    this.height = 222,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(
          Routes.medicineDetailPage,
          arguments: medicine,
        );
      },
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
            offset: const Offset(0, 7),
            blurRadius: 15,
            color: const Color(0x82828212).withOpacity(0.07),
          ),
        ], color: AppColors.white),
        child: Column(
          children: [
            Container(
              height: height * 0.57,
              width: width,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(medicine.imagePath),
                ),
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(10),
                ),
              ),
              child: medicine.requiresPrescription
                  ? Container(
                      decoration: BoxDecoration(
                        color: AppColors.deepBlack.withOpacity(0.5),
                        borderRadius: const BorderRadius.vertical(
                          top: Radius.circular(10),
                        ),
                      ),
                      alignment: Alignment.bottomCenter,
                      width: width,
                      height: 21,
                      child: AppText.small(
                        Strings.requiresPrescription,
                        color: AppColors.white,
                      ),
                    )
                  : null,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 11.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  boxHeight(15),
                  AppText.medium(medicine.name),
                  boxHeight(1),
                  AppText(
                    '${medicine.dispensationType} • ${medicine.packSize.weight.toInt()}mg',
                    color: AppColors.textGrey,
                  ),
                  boxHeight(10),
                  AppText.price('₦${medicine.price.toStringAsFixed(2)}'),
                  boxHeight(14),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
