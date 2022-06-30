import 'package:dro_health/src/models/models.dart';
import 'package:dro_health/src/ui/medicine_detail/bloc/medicine_detail_bloc.dart';
import 'package:dro_health/src/ui/reuseable_widgets/app_bar/app_bar.dart';
import 'package:dro_health/src/ui/reuseable_widgets/icon_widgets/cart_icon.dart';
import 'package:dro_health/src/utils/constants/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'medicine_detail_view.dart';

class MedicinePage extends StatelessWidget {
  final Medicine medicine;

  const MedicinePage({
    Key? key,
    required this.medicine,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => MedicineDetailBloc(medicine),
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size(
            double.maxFinite,
            120,
          ),
          child: Appbar(
            onBackPressed: () => Navigator.of(context).pop(),
            icon: const CartIcon(hasItems: true),
            title: Strings.pharmacyText,
          ),
        ),
        body: const _MedicineDetailView(),
      ),
    );
  }
}
