part of 'medicine_detail_page.dart';

class _MedicineDetailView extends StatelessWidget {
  final Medicine medicine;

  const _MedicineDetailView({
    Key? key,
    required this.medicine,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        constraints: const BoxConstraints.tightForFinite(),
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _MedicineImage(
              medicine: medicine,
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 35.0,
                top: 39,
                right: 35,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _SellerDetail(seller: medicine.seller),
                  const FavoriteIcon(
                    false,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 35),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  boxHeight(22),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Row(
                        children: [
                          Builder(builder: (context) {
                            int count = context
                                .watch<MedicineDetailBloc>()
                                .state
                                .packQuantity;
                            return PackCounter(
                              count: count,
                              onChanged: (int newVal) =>
                                  context.read<MedicineDetailBloc>().add(
                                        PacketQuantityChanged(newVal),
                                      ),
                            );
                          }),
                          boxWidth(15),
                          AppText(
                            Strings.packsCustom,
                            color: AppColors.deepBlack.withOpacity(0.5),
                          )
                        ],
                      ),
                      _MedicinePrice(
                        price: medicine.price,
                      ),
                    ],
                  ),
                  boxHeight(34),
                  AppText.bold(
                    Strings.productDetailsU,
                    color: AppColors.lightBlueGrey,
                  ),
                  boxHeight(20),
                  _ProductDetails(medicine: medicine),
                  boxHeight(39),
                  Align(
                    alignment: Alignment.center,
                    child: SizedBox(
                      width: context.queryScreenSize.width * 0.785,
                      child: AppText(
                        Strings.productDetailDescription,
                        textAlign: TextAlign.start,
                        color: AppColors.deepBlack.withOpacity(0.5),
                      ),
                    ),
                  ),
                  boxHeight(30),
                  AppText.mediumLarge(
                    Strings.similarProducts,
                    weight: FontWeight.w700,
                  ),
                  boxHeight(17),
                  const SimilarProductList(),
                  boxHeight(44),
                  AddToCartButton(
                    onPressed: () =>
                        context.read<MedicineDetailBloc>().add(AddedToCart()),
                  ),
                  boxHeight(27),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class AddToCartButton extends StatelessWidget {
  final VoidCallback onPressed;

  const AddToCartButton({Key? key, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      width: double.maxFinite,
      onPressed: onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const CartIcon(),
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

class SimilarProductList extends StatelessWidget {
  const SimilarProductList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (listViewContext) {
      List<Medicine> similarProducts =
          listViewContext.watch<MedicineDetailBloc>().state.similarProducts;
      return SizedBox(
        height: 250,
        child: similarProducts.isEmpty
            ? Center(child: AppText.large('Nothing to see here'))
            : ListView.separated(
                separatorBuilder: (context, index) => boxWidth(13.3),
                scrollDirection: Axis.horizontal,
                itemCount: similarProducts.length,
                itemBuilder: (context, index) => MedicineCard(
                  medicine: similarProducts[index],
                ),
              ),
      );
    });
  }
}

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

class _SellerDetail extends StatelessWidget {
  final Seller seller;

  const _SellerDetail({Key? key, required this.seller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Image.asset(
          seller.imagePath,
        ),
        boxWidth(10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const AppText(
              Strings.soldByU,
              color: AppColors.lightBlueGrey,
            ),
            AppText(
              seller.name,
              color: AppColors.deepBlueGrey,
              weight: FontWeight.w700,
            ),
          ],
        )
      ],
    );
  }
}

class _MedicineImage extends StatelessWidget {
  final Medicine medicine;

  const _MedicineImage({Key? key, required this.medicine}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        boxHeight(16),
        Image.asset(
          medicine.imagePath,
          height: 170,
          width: 170,
        ),
        boxHeight(13),
        AppText.large(medicine.name, weight: FontWeight.w700),
        AppText.mediumLarge(
          medicine.name,
          color: AppColors.black.withOpacity(0.4),
        ),
      ],
    );
  }
}
