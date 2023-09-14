import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:qr_code/bloc/bloc.dart';
import 'package:qr_code/resources/resources.dart';
import 'package:qr_code/ui/ui.dart';

class EventScreen extends StatefulWidget {
  const EventScreen({super.key});

  @override
  State<EventScreen> createState() => _VCardScreenState();
}

class _VCardScreenState extends State<EventScreen> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _startDateController = TextEditingController();
  final TextEditingController _endDateController = TextEditingController();

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
              reusableTextFormField("Title", _titleController),
              reusableTextFormField("Start Date", _startDateController),
              reusableTextFormField("End Date", _endDateController),
              reusableElevatedButton(() {
                context
                    .read<CreateQrBloc>()
                    .add(GenerateEventEvent(_titleController.text, _startDateController.text, _endDateController.text));
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