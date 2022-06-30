part of 'package:dro_health/src/ui/home/presentation/home_screen/home_page.dart';

class _CategoriesListView extends StatelessWidget {
  final List<Category> categories;

  const _CategoriesListView({
    required this.categories,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 15.5, horizontal: 25),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                Strings.categoriesU,
                style: context.theme.textTheme.titleMedium,
              ),
              TextButton(
                onPressed: () =>
                    Navigator.of(context).pushNamed(Routes.categoryPage),
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
          width: context.queryScreenSize.width,
          child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: categories.length,
            itemBuilder: (context, index) {
              final Category category = categories[index];
              return CategoryCard(
                onPressed: () {
                  context
                      .read<CategoryBloc>()
                      .add(SwitchDetails(detailIndex: index));
                  Navigator.of(context).pushNamed(Routes.categoryPage);
                },
                category: category.name,
                imagePath: category.imagePath,
              );
            },
          ),
        ),
      ],
    );
  }
}
