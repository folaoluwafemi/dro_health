part of '../screens/medicine_detail_page.dart';

class _ProductDetails extends StatelessWidget {
  final Medicine medicine;

  const _ProductDetails({Key? key, required this.medicine}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _ProductDetailLayout(
              asset: Assets.packSizeIcon,
              leading: Strings.packSizeU,
              detail: '${medicine.packSize}',
            ),
            _ProductDetailLayout(
              asset: Assets.productIdIcon,
              leading: Strings.productIdU,
              detail: medicine.id,
            ),
          ],
        ),
        boxHeight(24),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _ProductDetailLayout(
              asset: Assets.constituentIcon,
              leading: Strings.constituentsU,
              detail: medicine.constituents,
            ),
            _ProductDetailLayout(
              asset: Assets.dispensationIcon,
              leading: Strings.dispensedInU,
              detail: medicine.dispensationType,
            ),
          ],
        ),
      ],
    );
  }
}
class _ProductDetailLayout extends StatelessWidget {
  final String asset;
  final String leading;
  final String detail;

  const _ProductDetailLayout({
    Key? key,
    required this.asset,
    required this.leading,
    required this.detail,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(asset),
        boxWidth(10.5),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppText.tiny(leading),
            AppText.bold(detail),
          ],
        )
      ],
    );
  }
}
