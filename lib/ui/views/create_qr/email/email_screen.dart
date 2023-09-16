import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:qr_code/bloc/bloc.dart';
import 'package:qr_code/models/models.dart';
import 'package:qr_code/resources/resources.dart';
import 'package:qr_code/ui/ui.dart';

class EmailScreen extends StatefulWidget {
  const EmailScreen({super.key});

  @override
  State<EmailScreen> createState() => _EmailScreenState();
}

class _EmailScreenState extends State<EmailScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _subjectController = TextEditingController();
  final TextEditingController _messageController = TextEditingController();

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
              reusableTextFormField("Email", _emailController),
              reusableTextFormField("Subject", _subjectController),
              reusableTextFormField("Message", _messageController),
              reusableElevatedButton(() {
                context.read<CreateQrBloc>().add(
                      GenerateEmailEvent(
                        EmailModel(_emailController.text,
                            _subjectController.text, _messageController.text),
                      ),
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
