part of '../screens/cart_page.dart';

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
