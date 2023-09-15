import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qr_code/bloc/bloc.dart';
import 'package:qr_code/resources/colors/colors.dart';
import 'package:qr_code/ui/ui.dart';

class ListScreen extends StatefulWidget {
  const ListScreen({super.key});

  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 812.h,
      width: 375.w,
      child: Scaffold(
        backgroundColor: ColorProvider.mainBackground,
        body: SafeArea(
          child: Column(
            children: [
              topBarWidget(),
              Expanded(child: ListView.builder(itemBuilder: (context, index){}))
            ],
          )
        ),
      ),
    );
  }
}
