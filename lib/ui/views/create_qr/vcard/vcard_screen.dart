import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:qr_code/bloc/bloc.dart';
import 'package:qr_code/models/models.dart';
import 'package:qr_code/resources/resources.dart';
import 'package:qr_code/ui/ui.dart';

class VCardScreen extends StatefulWidget {
  const VCardScreen({super.key});

  @override
  State<VCardScreen> createState() => _VCardScreenState();
}

class _VCardScreenState extends State<VCardScreen> {
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _nickNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _websiteController = TextEditingController();
  final TextEditingController _streetController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _countryController = TextEditingController();
  final TextEditingController _birthdayController = TextEditingController();
  final TextEditingController _noteController = TextEditingController();
  String birthDayText = "";

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
                reusableTextFormField("First Name", _firstNameController),
                reusableTextFormField("Last Name", _lastNameController),
                reusableTextFormField("Phone Number", _phoneNumberController,
                    type: "number"),
                reusableTextFormField("Nickname", _nickNameController),
                reusableTextFormField(
                  "Email",
                  _emailController,
                ),
                reusableTextFormField(
                  "Website",
                  _websiteController,
                ),
                reusableTextFormField("Street", _streetController),
                reusableTextFormField("City", _cityController),
                reusableTextFormField("Country", _countryController),
                reusableTextFormField(
                  "Birthday",
                  _birthdayController,
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
                                  _birthdayController.text =
                                      "${newDate.year}/${newDate.month.toString().padLeft(2, '0')}/${newDate.day.toString().padLeft(2, '0')}}";
                                  birthDayText =
                                      "${newDate.year}${newDate.month.toString().padLeft(2, '0')}${newDate.day.toString().padLeft(2, '0')}";
                                },
                              ),
                            );
                          });
                    },
                    icon: const Icon(
                      Icons.date_range_outlined,
                      color: Colors.white,
                    ),
                  ),
                ),
                reusableTextFormField("Note", _noteController),
                reusableElevatedButton(() {
                  context.read<CreateQrBloc>().add(
                        GenerateVCardEvent(
                          VCardModel(
                            _firstNameController.text,
                            _lastNameController.text,
                            _nickNameController.text,
                            _websiteController.text,
                            _streetController.text,
                            _cityController.text,
                            _countryController.text,
                            _birthdayController.text,
                            _noteController.text,
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
      ),
    );
  }
}
