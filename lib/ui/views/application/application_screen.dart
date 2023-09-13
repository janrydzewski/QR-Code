import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qr_code/bloc/bloc.dart';
import 'package:qr_code/resources/resources.dart';
import 'package:qr_code/ui/ui.dart';

class ApplicationScreen extends StatefulWidget {
  final Widget child;
  const ApplicationScreen({super.key, required this.child});

  @override
  State<ApplicationScreen> createState() => _ApplicationScreenState();
}

class _ApplicationScreenState extends State<ApplicationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorProvider.mainBackground,
      body: BlocBuilder<ApplicationBloc, ApplicationState>(
        builder: (context, state) {
          return SizedBox(
            height: 812.h,
            width: 375.w,
            child: Stack(
              children: [
                widget.child,
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: bottomNavigationBarWidget(context, state),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
