import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qr_code/bloc/bloc.dart';
import 'package:qr_code/resources/resources.dart';
import 'package:qr_code/ui/ui.dart';

class WifiScreen extends StatefulWidget {
  const WifiScreen({super.key});

  @override
  State<WifiScreen> createState() => _VCardScreenState();
}

class _VCardScreenState extends State<WifiScreen> {
  final TextEditingController _networkNameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _securityController = TextEditingController();

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
                SizedBox(
                  height: 20.h,
                ),
                reusableTextFormField("Network Name", _networkNameController),
                reusableTextFormField("Password", _passwordController),
                reusableTextFormField("Security", _securityController),
                reusableElevatedButton(() {
                  context.read<CreateQrBloc>().add(
                        GenerateWifiEvent(_networkNameController.text,
                            _passwordController.text, _securityController.text),
                      );
                }),
                SizedBox(
                  height: 80.h,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
