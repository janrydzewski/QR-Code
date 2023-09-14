import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qr_code/resources/resources.dart';
import 'package:qr_code/ui/widgets/create_qr/create_qr.dart';

class UrlScreen extends StatefulWidget {
  const UrlScreen({super.key});

  @override
  State<UrlScreen> createState() => _VCardScreenState();
}

class _VCardScreenState extends State<UrlScreen> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 812.h,
      width: 375.w,
      child: Scaffold(
        backgroundColor: ColorProvider.mainBackground,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 20.h,),
                reusableTextFormField("Url"),

                reusableElevatedButton(),
                SizedBox(height: 80.h,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
