import 'package:dro_health/src/app/app_barrel.dart';
import 'package:dro_health/src/app/theme/colors.dart';
import 'package:dro_health/src/models/models.dart';
import 'package:dro_health/src/ui/medicine_detail/bloc/medicine_detail_bloc.dart';
import 'package:dro_health/src/ui/reuseable_widgets/functions/methods.dart';
import 'package:dro_health/src/ui/reuseable_widgets/icon_widgets/favorite_icon.dart';
import 'package:dro_health/src/ui/reuseable_widgets/reusable_widgets.dart';
import 'package:dro_health/src/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part '../widgets/add_to_cart.dart';

part '../widgets/medicine_image.dart';

part '../widgets/medicine_price.dart';

part '../widgets/pack_counter.dart';

part '../widgets/product_detail.dart';

part '../widgets/seller_detail.dart';

part '../widgets/similar_products_list.dart';

part 'medicine_detail_view.dart';

class MedicinePage extends StatefulWidget {
  final Medicine medicine;

  const MedicinePage({
    Key? key,
    required this.medicine,
  }) : super(key: key);

  @override
  State<MedicinePage> createState() => _MedicinePageState();
}

class _MedicinePageState extends State<MedicinePage> {
  PersistentBottomSheetController? sheetController;

  @override
  void dispose() {
    sheetController?.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => MedicineDetailCubit(
        widget.medicine,
      )..fetchSimilarProducts(),
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size(
            double.maxFinite,
            120,
          ),
          child: Appbar(
            onBackPressed: () => Navigator.of(context).pop(),
            icon: Builder(builder: (builderContext) {
              return CartIcon(
                hasItems: builderContext
                        .watch<UserBloc>()
                        .state
                        .user
                        ?.cart
                        .isNotEmpty ??
                    false,
              );
            }),
            title: Strings.pharmacyText,
          ),
        ),
        body: BlocListener<MedicineDetailCubit, MedicineDetailState>(
          listener: (context, state) {
            if (state.addedToCart) {
              sheetController = showBottomSheet(
                  context: context,
                  builder: (context) => const AddToCartBottomSheet(),
                  enableDrag: true,
                  backgroundColor: Colors.transparent);
            }
          },
          child: GestureDetector(
            onTap: () async {
              sheetController?.close();
            },
            child: _MedicineDetailView(
              medicine: widget.medicine,
            ),
          ),
        ),
      ),
    );
  }
}

class AddToCartBottomSheet extends StatelessWidget {
  const AddToCartBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomSheet(
      backgroundColor: Colors.transparent,
      constraints: const BoxConstraints.tightForFinite(),
      onClosing: () {
        Navigator.of(context).pop();
      },
      enableDrag: true,
      builder: (sheetContext) {
        return Container(
          height: context.queryScreenSize.height * 0.45,
          constraints: const BoxConstraints.tightForFinite(),
          decoration: BoxDecoration(
            borderRadius: verticalCircularRadius(30),
            color: AppColors.white,
          ),
          padding: const EdgeInsets.symmetric(horizontal: 26),
          child: Column(
            children: [
              boxHeight(64),
              SizedBox(
                width: sheetContext.queryScreenSize.width * 0.874,
                child: AppText.large(
                  Strings.addedToCartSuccessText,
                  textAlign: TextAlign.center,
                ),
              ),
              boxHeight(68),
              FilledButton(
                height: 50,
                width: double.maxFinite,
                onPressed: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).pushNamed(Routes.cartPage);
                },
                child: AppText.filledButton(Strings.viewCartU),
              ),
              boxHeight(19),
              AppOutlinedButton(
                height: 50,
                width: double.maxFinite,
                onPressed: () => Navigator.of(context).pop(),
                child: AppText.outlinedButton(Strings.continueShoppingU),
              ),
              boxHeight(35),
            ],
          ),
        );
      },
    );
  }
}
