import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:qr_code/bloc/bloc.dart';
import 'package:qr_code/resources/resources.dart';
import 'package:qr_code/ui/ui.dart';

class UrlScreen extends StatefulWidget {
  const UrlScreen({super.key});

  @override
  State<UrlScreen> createState() => _VCardScreenState();
}

class _VCardScreenState extends State<UrlScreen> {
  final TextEditingController _urlController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 812.h,
      width: 375.w,
      child: Scaffold(
        backgroundColor: ColorProvider.mainBackground,
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 20.h,
              ),
              reusableTextFormField("Url", _urlController),
              reusableElevatedButton(() {
                context.read<CreateQrBloc>().add(
                      GenerateUrlEvent(_urlController.text),
                    );
                context.go("/list/showQr");
              }),
              SizedBox(
                height: 80.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
