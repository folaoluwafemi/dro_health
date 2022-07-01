part of '../screens/medicine_detail_page.dart';

class PackCounter extends StatefulWidget {
  final int count;
  final ValueChanged<int> onChanged;

  const PackCounter({
    Key? key,
    required this.count,
    required this.onChanged,
  }) : super(key: key);

  @override
  State<PackCounter> createState() => _PackCounterState();
}

class _PackCounterState extends State<PackCounter> {
  int count = 0;

  @override
  void initState() {
    super.initState();
    count = widget.count;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: circularRadius(10),
        border: Border.all(
          color: AppColors.grey.withOpacity(0.3),
          width: 1,
        ),
      ),
      // padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            onPressed: () {
              if (count <= 0) return;
              setState(() {
                --count;
              });
              widget.onChanged(count);
            },
            icon: const Icon(
              Icons.remove,
              color: AppColors.black,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 1),
            child: SizedBox(
              width: 25,
              child: AppText.large(
                '$count',
                weight: FontWeight.w700,
              ),
            ),
          ),
          IconButton(
            onPressed: () {
              if (count >= 20) return;
              setState(() {
                ++count;
              });
              widget.onChanged(count);
            },
            icon: const Icon(
              Icons.add,
              color: AppColors.black,
            ),
          ),
        ],
      ),
    );
  }
}
