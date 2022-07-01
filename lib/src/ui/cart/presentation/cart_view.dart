part of 'cart_page.dart';

class _CartView extends StatelessWidget {
  const _CartView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints.tightForFinite(),
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: BlocBuilder<CartBloc, CartState>(
        builder: (context, state) {
          return Column(
            children: [
              SizedBox(
                height: (context.queryScreenSize.height - 260),
                child: ListView.separated(
                  padding: const EdgeInsets.only(top: 20),
                  separatorBuilder: (context, index) => const Divider(
                    color: AppColors.lightGrey,
                    thickness: 1.5,
                  ),
                  itemCount: state.cartItems.length,
                  itemBuilder: (context, index) {
                    CartItem cartItem = state.cartItems[index];
                    return _CartListItem(
                      cartItem: cartItem,
                      index: index,
                    );
                  },
                ),
              ),
              CheckoutBottomWidget(totalPrice: state.totalPrice),
            ],
          );
        },
      ),
    );
  }
}

class CheckoutBottomWidget extends StatelessWidget {
  final double totalPrice;

  const CheckoutBottomWidget({
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
            onPressed: () => context.read<CartBloc>().add(CheckedOut()),
            child: AppText.filledButton(Strings.checkoutU),
          ),
        ],
      ),
    );
  }
}

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

class _RemoveWidget extends StatelessWidget {
  final VoidCallback onPressed;

  const _RemoveWidget({
    required this.onPressed,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(Assets.removeIcon),
        TextButton(
          onPressed: onPressed,
          child: const AppText(
            Strings.remove,
            color: AppColors.purple,
            weight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}

class _CartCountDropDown extends StatelessWidget {
  final ValueChanged<int?> onChanged;
  final int initialValue;

  const _CartCountDropDown({
    required this.onChanged,
    required this.initialValue,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 58,
      height: 31,
      decoration: BoxDecoration(
          borderRadius: circularRadius(7),
          border: Border.all(
            color: AppColors.lightGreyVariant,
            width: 1,
          )),
      alignment: Alignment.center,
      padding: const EdgeInsets.only(right: 8),
      child: DropdownButtonHideUnderline(
        child: ButtonTheme(
          alignedDropdown: true,
          child: DropdownButton<int>(
            iconSize: 10,
            borderRadius: const BorderRadius.vertical(
              bottom: Radius.circular(
                10,
              ),
            ),
            alignment: Alignment.center,
            icon: Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Transform.rotate(
                angle: math.pi * 1.5,
                child: const Icon(
                  Icons.arrow_back_ios,
                  color: AppColors.purple,
                ),
              ),
            ),
            underline: const Divider(),
            selectedItemBuilder: (context) => eightInts
                .map<DropdownMenuItem<int>>(
                  (integer) => DropdownMenuItem<int>(
                    value: integer,
                    alignment: Alignment.center,
                    child: Center(child: AppText('$integer')),
                  ),
                )
                .toList(),
            items: eightInts
                .map<DropdownMenuItem<int>>(
                  (integer) => DropdownMenuItem<int>(
                    value: integer,
                    child: AppText('$integer'),
                  ),
                )
                .toList(),
            value: initialValue,
            onChanged: onChanged,
          ),
        ),
      ),
    );
  }
}
