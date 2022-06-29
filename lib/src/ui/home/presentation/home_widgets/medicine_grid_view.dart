part of 'package:dro_health/src/ui/home/presentation/home_screen/home_page.dart';

class _MedicineGridView extends StatelessWidget {
  final List<Medicine> medicines;

  const _MedicineGridView({
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
        return MedicineCard(medicine: medicines[index]);
      },
    );
  }
}
