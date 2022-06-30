import 'package:dro_health/src/models/models.dart';
import 'package:dro_health/src/ui/reuseable_widgets/reusable_widgets.dart';
import 'package:flutter/material.dart';

class MedicineGridView extends StatelessWidget {
  final List<Medicine> medicines;

  const MedicineGridView({
    required this.medicines,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const BouncingScrollPhysics(),
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisExtent: 250,
      ),
      itemCount: medicines.length,
      itemBuilder: (context, index) {
        return MedicineCard(
          medicine: medicines[index],
        );
      },
    );
  }
}
