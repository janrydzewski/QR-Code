import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:qr_code/bloc/bloc.dart';
import 'package:qr_code/models/models.dart';
import 'package:qr_code/resources/resources.dart';
import 'package:qr_code/ui/ui.dart';
import 'package:flutter/cupertino.dart';

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
              reusableTextFormField(
                "Start Date",
                _startDateController,
                type: "date",
                child: IconButton(
                  onPressed: () {
                    showCupertinoModalPopup(
                        context: context,
                        builder: (BuildContext context) {
                          return CupertinoTheme(
                            data: const CupertinoThemeData(
                              brightness: Brightness.dark,
                            ),
                            child: CupertinoDatePicker(
                              mode: CupertinoDatePickerMode.dateAndTime,
                              onDateTimeChanged: (DateTime newDate) {
                                _startDateController.text = "${newDate.year}/${newDate.month}/${newDate.day} ${newDate.hour}:${newDate.minute}";
                              },
                            ),
                          );
                        });
                  },
                  icon: Icon(Icons.date_range_outlined),
                ),
              ),
              reusableTextFormField(
                "End Date",
                _endDateController,
                type: "date",
                child: IconButton(
                  onPressed: () {
                    showCupertinoModalPopup(
                        context: context,
                        builder: (BuildContext context) {
                          return CupertinoTheme(
                            data: const CupertinoThemeData(
                              brightness: Brightness.dark,
                            ),
                            child: CupertinoDatePicker(
                              mode: CupertinoDatePickerMode.dateAndTime,
                              onDateTimeChanged: (DateTime newDate) {
                                _endDateController.text = "${newDate.year}/${newDate.month}/${newDate.day} ${newDate.hour}:${newDate.minute}";
                              },
                            ),
                          );
                        });
                  },
                  icon: Icon(Icons.date_range_outlined),
                ),
              ),
              reusableElevatedButton(() {
                context.read<CreateQrBloc>().add(
                      GenerateEventEvent(
                        EventModel(
                          _titleController.text,
                          _startDateController.text,
                          _endDateController.text,
                        ),
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
