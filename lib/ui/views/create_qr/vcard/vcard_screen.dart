import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qr_code/resources/resources.dart';
import 'package:qr_code/ui/widgets/create_qr/create_qr.dart';

class VCardScreen extends StatefulWidget {
  const VCardScreen({super.key});

  @override
  State<VCardScreen> createState() => _VCardScreenState();
}

class _VCardScreenState extends State<VCardScreen> {
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
                reusableTextFormField("First Name"),
                reusableTextFormField("Last Name"),
                reusableTextFormField("Company"),
                reusableTextFormField("Phone Number"),
                reusableTextFormField("Email"),
                reusableTextFormField("Website"),
                reusableTextFormField("Street"),
                reusableTextFormField("City"),
                reusableTextFormField("ZIP Code"),
                reusableTextFormField("Country"),
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
