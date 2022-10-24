part of '../screens/medicine_detail_page.dart';

class _SimilarProductList extends StatelessWidget {
  const _SimilarProductList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (listViewContext) {
      List<Medicine> similarProducts =
          listViewContext.watch<MedicineDetailCubit>().state.similarProducts;
      return SizedBox(
        height: 250,
        child: similarProducts.isEmpty
            ? Center(child: AppText.large('Nothing to see here'))
            : ListView.separated(
                separatorBuilder: (context, index) => boxWidth(13.3),
                scrollDirection: Axis.horizontal,
                itemCount: similarProducts.length,
                itemBuilder: (context, index) => MedicineCard(
                  medicine: similarProducts[index],
                ),
              ),
      );
    });
  }
}
