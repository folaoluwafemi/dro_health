part of '../screens/medicine_detail_page.dart';
class _MedicinePrice extends StatelessWidget {
  final double price;

  const _MedicinePrice({Key? key, required this.price}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const AppText(Strings.nariaSymbol),
            Row(
              children: [
                AppText(
                  price.toStringAsFixed(0),
                  weight: FontWeight.w700,
                  fontSize: 28,
                ),
                AppText.mediumLarge(Strings.decimalDoubleZero,
                    weight: FontWeight.w700)
              ],
            ),
          ],
        )

      // RichText(
      //   text: TextSpan(
      //     text: Strings.nariaSymbol,
      //     style: const TextStyle(
      //       fontSize: 14,
      //       fontWeight: FontWeight.w400,
      //     ),
      //     children: [
      //       TextSpan(
      //         text: price.toStringAsFixed(0),
      //         style: const TextStyle(
      //           fontSize: 18,
      //           fontWeight: FontWeight.w700,
      //         ),
      //       ),
      //       TextSpan(
      //         text: price.toStringAsFixed(0),
      //         style: const TextStyle(
      //           fontSize: 14,
      //           fontWeight: FontWeight.w400,
      //         ),
      //       ),
      //     ],
      //   ),
      // ),
    );
  }
}
