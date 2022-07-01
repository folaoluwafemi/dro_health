part of '../screens/medicine_detail_page.dart';

class _MedicineImage extends StatelessWidget {
  final Medicine medicine;

  const _MedicineImage({Key? key, required this.medicine}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        boxHeight(16),
        Image.asset(
          medicine.imagePath,
          height: 170,
          width: 170,
        ),
        boxHeight(13),
        AppText.large(medicine.name, weight: FontWeight.w700),
        AppText.mediumLarge(
          medicine.name,
          color: AppColors.black.withOpacity(0.4),
        ),
      ],
    );
  }
}
