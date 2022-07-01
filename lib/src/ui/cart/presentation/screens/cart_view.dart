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
              _CheckoutBottomWidget(totalPrice: state.totalPrice),
            ],
          );
        },
      ),
    );
  }
}




