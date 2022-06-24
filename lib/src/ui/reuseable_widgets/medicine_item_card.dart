import 'package:dro_health/src/app/theme/colors.dart';
import 'package:dro_health/src/models/medicine/medicine_model.dart';
import 'package:dro_health/src/ui/reuseable_widgets/app_text.dart';
import 'package:dro_health/src/ui/reuseable_widgets/methods.dart';
import 'package:flutter/material.dart';

class MedicineCard extends StatelessWidget {
  final Medicine medicine;
  final double? width;

  const MedicineCard({
    required this.medicine,
    Key? key,
    this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
            height: 127,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(medicine.imagePath),
              ),
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(10),
              ),
            ),
          ),
          boxHeight(15),
          AppText.medium(medicine.name),
          AppText(
            '${medicine.dispensationType} • ${medicine.packSize.weight}mg',


          ),
        ],
      ),
    );
  }
}
