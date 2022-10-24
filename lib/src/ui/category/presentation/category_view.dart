part of 'category_page.dart';

class _CategoryView extends StatelessWidget {
  final List<Category> categories;

  const _CategoryView({
    required this.categories,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryCubit, CategoryState>(
      builder: (context, state) {
        return GridView.builder(
          padding: EdgeInsets.symmetric(
            vertical: 0,
            horizontal: context.queryScreenSize.width * 0.057,
          ),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisExtent: 130,
          ),
          itemCount: categories.length,
          itemBuilder: (context, index) {
            final Category category = categories[index];
            return CategoryCard(
              width: context.queryScreenSize.width -
                  (context.queryScreenSize.width * 0.089),
              onPressed: () => context
                  .read<CategoryCubit>()
                  .switchDetails(detailIndex: index),
              category: category.name,
              imagePath: category.imagePath,
            );
          },
        );
      },
    );
  }
}
