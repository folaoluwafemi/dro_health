import 'package:dro_health/src/app/app_barrel.dart';
import 'package:dro_health/src/models/models.dart';
import 'package:dro_health/src/ui/category/bloc/category_bloc.dart';
import 'package:dro_health/src/ui/home/bloc/home_bloc.dart';
import 'package:dro_health/src/ui/reuseable_widgets/buttons/checkout_button.dart';
import 'package:dro_health/src/ui/reuseable_widgets/cards/delivery_location_widget.dart';
import 'package:dro_health/src/ui/reuseable_widgets/cards/medicine_cart_item_card.dart';
import 'package:dro_health/src/ui/reuseable_widgets/reusable_widgets.dart';
import 'package:dro_health/src/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'package:dro_health/src/ui/home/presentation/home_screen/home_view.dart';

part 'package:dro_health/src/ui/home/presentation/home_widgets/category_list_view.dart';

part 'package:dro_health/src/ui/home/presentation/home_widgets/search_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.read<HomeBloc>().add(FetchCategories());
    return const _HomeView();
  }
}
