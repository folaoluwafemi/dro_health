part of 'package:dro_health/src/ui/home/presentation/home_screen/home_page.dart';

class _HomeView extends StatefulWidget {
  const _HomeView({Key? key}) : super(key: key);

  @override
  State<_HomeView> createState() => _HomeViewState();
}

final TextEditingController _searchController = TextEditingController();

class _HomeViewState extends State<_HomeView> {
  late final List<Category> categories;
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    _focusNode.addListener(() {
      if (_focusNode.hasFocus) {
        context.read<HomeBloc>().add(StartSearch());
      }
    });
    super.initState();
    categories = context.read<HomeBloc>().state.categories;
  }

  @override
  void dispose() {
    _focusNode.dispose();
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print('building home view');
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size(
            double.maxFinite,
            151,
          ),
          child: Builder(builder: (appBarContext) {
            return Appbar(
              onBackPressed: appBarContext.watch<HomeBloc>().state.search
                  ? _closeSearch
                  : null,
              icon: const DeliveryIcon(),
              title: Strings.pharmacyText,
              searchBar: AppTextField(
                controller: _searchController,
                onChanged: _onSearchTextChanged,
                icon: Icon(
                  Icons.search,
                  color: context.theme.iconTheme.color,
                ),
                onTap: () {
                  context.read<HomeBloc>().add(StartSearch());
                },
                hintText: Strings.search,
              ),
            );
          }),
        ),
        extendBodyBehindAppBar: true,
        body: SingleChildScrollView(
          child: Container(
            constraints: const BoxConstraints.tightForFinite(),
            child: Column(
              children: [
                boxHeight(141),
                const DeliveryLocation(),
                BlocBuilder<HomeBloc, HomeState>(
                  builder: (context, state) {
                    if (state.search == true) {
                      return const _SearchWidget();
                    }
                    if (state.status == StateStatus.loading) {
                      return Column(
                        children: const [
                          Spacer(),
                          CircularProgressIndicator(),
                          Spacer(),
                        ],
                      );
                    }
                    return Column(
                      children: [
                        _CategoriesListView(categories: state.categories),
                        Container(
                          alignment: Alignment.centerLeft,
                          padding: const EdgeInsets.only(
                              left: 25, top: 26, bottom: 13),
                          child: Text(
                            Strings.suggestionsU,
                            style:
                                context.theme.textTheme.titleMedium?.copyWith(
                              color: AppColors.black.withOpacity(0.4),
                            ),
                          ),
                        ),
                        MedicineGridView(
                          medicines: state.medicines,
                        ),
                      ],
                    );
                  },
                ),
              ],
            ),
          ),
        ),
        floatingActionButton: Builder(builder: (checkoutContext) {
          return CheckoutButton(
            items: checkoutContext.watch<UserBloc>().state.user?.cart.length ?? 0,
            expanded: !(checkoutContext.watch<HomeBloc>().state.search),
          );
        }),
        bottomNavigationBar: context.watch<HomeBloc>().state.search
            ? null
            : BottomNavigationBar(
                type: BottomNavigationBarType.fixed,
                items: navMap.values.toList(),
                currentIndex: 2,
                showUnselectedLabels: true,
                showSelectedLabels: true,
              ),
      ),
    );
  }

  void _closeSearch() {
    _searchController.clear();
    if (_focusNode.hasFocus) {
      _focusNode.unfocus();
    }
    SystemChannels.textInput.invokeListMethod('TextInput.hide');
    context.read<HomeBloc>().add(EndSearch());
  }

  void _onSearchTextChanged(String? value) {
    if (value == null) {
      return;
    }
    context.read<HomeBloc>().add(SearchEvent(query: value));
  }
}

Map<HomeNavItem, BottomNavigationBarItem> navMap = {
  HomeNavItem.home: BottomNavigationBarItem(
    icon: Image.asset(
      Assets.homeNavIcon,
      color: AppColors.grey,
    ),
    activeIcon: Image.asset(
      Assets.homeNavIcon,
      color: AppColors.purple,
    ),
    label: Strings.home,
    backgroundColor: AppColors.paleYellow,
  ),
  HomeNavItem.doctors: BottomNavigationBarItem(
    icon: Image.asset(
      Assets.doctorNavIcon,
      color: AppColors.grey,
    ),
    activeIcon: Image.asset(
      Assets.doctorNavIcon,
      color: AppColors.purple,
    ),
    label: 'Doctors',
  ),
  HomeNavItem.pharmacy: BottomNavigationBarItem(
    icon: Image.asset(
      Assets.pharmacyNavIcon,
      color: AppColors.grey,
    ),
    activeIcon: Image.asset(
      Assets.pharmacyNavIcon,
      color: AppColors.purple,
    ),
    label: Strings.pharmacyText,
  ),
  HomeNavItem.community: BottomNavigationBarItem(
    icon: Image.asset(
      Assets.communityNavIcon,
    ),
    activeIcon: Image.asset(
      Assets.communityNavIcon,
      color: AppColors.purple,
    ),
    label: 'Doctors',
  ),
  HomeNavItem.profile: BottomNavigationBarItem(
    icon: Image.asset(
      Assets.profileNavIcon,
      color: AppColors.grey,
    ),
    activeIcon: Image.asset(
      Assets.profileNavIcon,
      color: AppColors.purple,
    ),
    label: Strings.profile,
  ),
};

enum HomeNavItem {
  home,
  profile,
  community,
  doctors,
  pharmacy,
}
