part of 'category_page.dart';

class _CategoryDetailView extends StatelessWidget {
  final List<Category> categories;

  const _CategoryDetailView({
    Key? key,
    required this.categories,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        constraints: const BoxConstraints.tightForFinite(),
        child: Column(
          children: [
            boxHeight(35),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  AppText.titleMedium(Strings.categoriesU),
                  TextButton(
                    onPressed: () {
                      context.read<CategoryCubit>().switchDetails();
                    },
                    child: const AppText(
                      Strings.viewAllU,
                      color: AppColors.purple,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 100,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                // shrinkWrap: true,
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  int? stateIndex =
                      context.read<CategoryCubit>().state.detailIndex;
                  return CategoryCard(
                    onPressed: () => context
                        .read<CategoryCubit>()
                        .switchDetails(detailIndex: index),
                    selected: stateIndex == index,
                    category: categories[index].name,
                    imagePath: categories[index].imagePath,
                  );
                },
              ),
            ),
            boxHeight(40),
            Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.only(left: 25),
              child: AppText.titleMedium(
                Strings.supplementsU,
              ),
            ),
            boxHeight(26),
            Builder(builder: (medsContext) {
              int index =
                  medsContext.watch<CategoryCubit>().state.detailIndex ?? 0;
              List<Medicine> medicines = categories[index].medicines;
              return MedicineGridView(
                medicines: medicines,
              );
            }),
          ],
        ),
      ),
    );
  }
}
