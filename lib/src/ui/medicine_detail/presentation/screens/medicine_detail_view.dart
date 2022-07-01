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
                ],
              ),
            ),
            boxHeight(17),
            const _SimilarProductList(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 35),
              child: Column(
                children: [
                  boxHeight(44),
                  _AddToCartButton(
                    onPressed: () {
                      int packQuantity =
                          context.read<MedicineDetailBloc>().state.packQuantity;
                      if (packQuantity == 0) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            backgroundColor: AppColors.purple,
                            content: AppText(
                              'Please increase item count',
                              color: AppColors.white,
                            ),
                          ),
                        );
                        return;
                      }
                      context.read<UserBloc>().add(UserCartItemAdded(CartItem(
                            quantity: packQuantity,
                            medicine: medicine,
                          )));
                      context.read<MedicineDetailBloc>().add(AddedToCart());
                    },
                  ),
                  boxHeight(27),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}









