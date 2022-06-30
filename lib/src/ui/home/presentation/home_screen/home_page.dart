import 'package:dro_health/src/app/theme/colors.dart';
import 'package:dro_health/src/models/models.dart';
import 'package:dro_health/src/ui/home/bloc/home_bloc.dart';
import 'package:dro_health/src/ui/reuseable_widgets/buttons/checkout_button.dart';
import 'package:dro_health/src/ui/reuseable_widgets/cards/delivery_location_widget.dart';
import 'package:dro_health/src/ui/reuseable_widgets/cards/medicine_cart_item_card.dart';
import 'package:dro_health/src/ui/reuseable_widgets/functions/methods.dart';
import 'package:dro_health/src/ui/reuseable_widgets/reusable_widgets.dart';
import 'package:dro_health/src/utils/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'package:dro_health/src/ui/home/presentation/home_screen/home_view.dart';

part 'package:dro_health/src/ui/home/presentation/home_widgets/category_list_view.dart';

part 'package:dro_health/src/ui/home/presentation/home_widgets/medicine_grid_view.dart';

part 'package:dro_health/src/ui/home/presentation/home_widgets/search_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeBloc>(
      create: (_) => HomeBloc()..add(FetchCategories()),
      child: const _HomeView(),
    );
  }
}
