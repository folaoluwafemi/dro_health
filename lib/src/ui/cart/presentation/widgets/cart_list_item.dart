part of '../screens/cart_page.dart';
class _CartListItem extends StatelessWidget {
  final CartItem cartItem;
  final int index;

  const _CartListItem({
    required this.cartItem,
    required this.index,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.max,
      children: [
        Row(
          children: [
            Image.asset(
              cartItem.medicine.imagePath,
              height: 80,
              width: 80,
            ),
            boxWidth(14),
            Column(
              children: [
                AppText.medium(cartItem.medicine.name),
                boxHeight(7),
                AppText(
                  '${cartItem.medicine.constituents} · ${cartItem.medicine.packSize.weightString}',
                  color: AppColors.lightTextGrey,
                ),
                boxHeight(9),
                AppText.medium(
                  cartItem.medicine.priceAmount,
                  color: AppColors.black.withOpacity(0.9),
                  weight: FontWeight.w600,
                ),
              ],
            ),
          ],
        ),
        Column(
          children: [
            _CartCountDropDown(
              onChanged: (int? value) {
                if (value == null) return;
                context.read<CartBloc>().add(
                  CartItemCountChanged(item: cartItem, newCount: value),
                );
              },
              initialValue: cartItem.quantity,
            ),
            _RemoveWidget(
              onPressed: () =>
                  context.read<CartBloc>().add(CartItemRemoved(cartItem)),
            ),
          ],
        )
      ],
    );
  }
}
