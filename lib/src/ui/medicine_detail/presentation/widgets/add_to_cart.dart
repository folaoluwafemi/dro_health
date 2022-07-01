part of '../screens/medicine_detail_page.dart';

class _AddToCartButton extends StatelessWidget {
  final VoidCallback onPressed;

  const _AddToCartButton({Key? key, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      width: double.maxFinite,
      onPressed: onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const CartIcon(
            hasItems: false,
          ),
          boxWidth(12),
          const AppText(
            Strings.addToCart,
            color: AppColors.white,
            weight: FontWeight.w700,
          )
        ],
      ),
    );
  }
}
