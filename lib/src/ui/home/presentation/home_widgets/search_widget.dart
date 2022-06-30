part of 'package:dro_health/src/ui/home/presentation/home_screen/home_page.dart';

class _SearchWidget extends StatefulWidget {
  const _SearchWidget({Key? key}) : super(key: key);

  @override
  State<_SearchWidget> createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<_SearchWidget> {
  List<Medicine> searchedMedicines = [];

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (builderContext) {
      print('search widget building');
      print('search widget building');
      print('search widget building');
      print('search widget building');
      searchedMedicines = builderContext.watch<HomeBloc>().state.medicines;
      if (searchedMedicines.isEmpty) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Image.asset(Assets.errorNotFoundImage),
            AppText.large(
              Strings.noResultError(_searchController.text),
              weight: FontWeight.w600,
            ),
          ],
        );
      }
      return GridView.builder(
        physics: const BouncingScrollPhysics(),
        shrinkWrap: true,
        padding: EdgeInsets.zero,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisExtent: 250,
          mainAxisSpacing: 10,
        ),
        itemCount: searchedMedicines.length,
        itemBuilder: (context, index) {
          return MedicineCartCard(
            onAddToCartPressed: () {
              ///todo: implement cart
            },
            medicine: searchedMedicines[index],
          );
        },
      );
    });
  }
}
