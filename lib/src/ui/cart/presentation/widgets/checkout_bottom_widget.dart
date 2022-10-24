part of '../screens/cart_page.dart';

class _CheckoutBottomWidget extends StatelessWidget {
  final double totalPrice;

  const _CheckoutBottomWidget({
    required this.totalPrice,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 102,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            children: [
              AppText.mediumLarge(Strings.totalLeadingText),
              boxWidth(9),
              AppText.mediumLarge(
                '${Strings.nariaSymbol}$totalPrice',
                weight: FontWeight.w600,
              ),
            ],
          ),
          FilledButton(
            width: context.queryScreenSize.width * 0.5,
            onPressed: () async =>
                await context.read<CartCubit>().addCartToUserAndCheckout(),
            child: AppText.filledButton(Strings.checkoutU),
          ),
        ],
      ),
    );
  }
}
