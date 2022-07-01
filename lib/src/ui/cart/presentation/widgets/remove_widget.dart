part of '../screens/cart_page.dart';


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
