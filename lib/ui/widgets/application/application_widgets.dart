import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:qr_code/bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_code/resources/resources.dart';

Widget bottomNavigationBarWidget(BuildContext context, ApplicationState state) {
  return BottomNavigationBar(
    backgroundColor: ColorProvider.mainNavBar,
    unselectedItemColor: ColorProvider.mainNavBarElementUnSelected,
    selectedItemColor: ColorProvider.mainNavBarElementSelected,
    showSelectedLabels: false,
    showUnselectedLabels: false,
    elevation: 0,
    iconSize: 35,
    type: BottomNavigationBarType.fixed,
    items: bottomNavigationBarItemsList(),
    currentIndex: state.index,
    onTap: (value) {
      switch (value) {
        case 0:
          context.go('/home');
          break;
        case 1:
          context.go('/list');
          break;
      }
      context.read<ApplicationBloc>().add(ChangeApplicationIndexEvent(value));
    },
  );
}

List<BottomNavigationBarItem> bottomNavigationBarItemsList() {
  List<BottomNavigationBarItem> bottomNavigationBarItems = [
    const BottomNavigationBarItem(
      icon: SizedBox(
        child: Icon(
          Icons.widgets,
        ),
      ),
      label: "Home",
    ),
    const BottomNavigationBarItem(
      icon: SizedBox(
        child: Icon(
          Icons.view_list_rounded,
        ),
      ),
      label: "List",
    ),
  ];
  return bottomNavigationBarItems;
}
