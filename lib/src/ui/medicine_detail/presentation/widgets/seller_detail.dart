part of '../screens/medicine_detail_page.dart';
class _SellerDetail extends StatelessWidget {
  final Seller seller;

  const _SellerDetail({Key? key, required this.seller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Image.asset(
          seller.imagePath,
        ),
        boxWidth(10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const AppText(
              Strings.soldByU,
              color: AppColors.lightBlueGrey,
            ),
            AppText(
              seller.name,
              color: AppColors.deepBlueGrey,
              weight: FontWeight.w700,
            ),
          ],
        )
      ],
    );
  }
}
