import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qr_code/resources/resources.dart';
import 'package:qr_code/ui/widgets/common_widgets.dart';

reusableTextFormField(String text, TextEditingController textEditingController,
    {String type = "string", Widget? child}) {
  return Container(
    width: 375.w,
    height: 100.h,
    margin: EdgeInsets.symmetric(horizontal: 35.w),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        reusableText(text, fontColor: Colors.white),
        SizedBox(
          height: 10.h,
        ),
        TextField(
          autofocus: false,
          autocorrect: false,
          keyboardType:
              type == "number" ? TextInputType.number : TextInputType.text,
          controller: textEditingController,
          decoration: InputDecoration(
            suffixIcon: child,
            fillColor: ColorProvider.mainElement,
            filled: true,
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: ColorProvider.mainElement),
            ),
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: ColorProvider.mainElement),
            ),
            disabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: ColorProvider.mainElement),
            ),
          ),
          style: GoogleFonts.notoSans(color: Colors.white),
          cursorColor: Colors.white,
        ),
      ],
    ),
  );
}

reusableElevatedButton(Function() func) {
  return Container(
    width: 375.w,
    height: 40.h,
    margin: EdgeInsets.symmetric(horizontal: 100.w),
    child: Theme(
      data: ThemeData(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: ColorProvider.mainNavBarElementSelected,
        ),
        onPressed: func,
        child: reusableText("Create QR",
            fontColor: Colors.white, fontWeight: FontWeight.w700),
      ),
    ),
  );
}

class SecurityWidget extends StatefulWidget {
  final TextEditingController textEditingController;
  const SecurityWidget({super.key, required this.textEditingController});

  @override
  State<SecurityWidget> createState() => _SecurityWidgetState();
}

class _SecurityWidgetState extends State<SecurityWidget> {
  int selectedOption = 1;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 35.w, right: 35.w, bottom: 20.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          reusableText("Security", fontColor: Colors.white),
          SizedBox(
            height: 10.h,
          ),
          Container(
            height: 70.h,
            padding: EdgeInsets.symmetric(vertical: 5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: ColorProvider.mainElement,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    reusableText("WPA", fontColor: Colors.white),
                    Radio(
                        activeColor: Colors.white,
                        value: 0,
                        groupValue: selectedOption,
                        onChanged: (value) {
                          setState(() {
                            selectedOption = int.parse(value.toString());
                            widget.textEditingController.text = "WPA";
                          });
                        }),
                  ],
                ),
                Column(
                  children: [
                    reusableText("WPA2", fontColor: Colors.white),
                    Radio(
                        activeColor: Colors.white,
                        value: 1,
                        groupValue: selectedOption,
                        onChanged: (value) {
                          setState(() {
                            selectedOption = int.parse(value.toString());
                            widget.textEditingController.text = "WPA2";
                          });
                        }),
                  ],
                ),
                Column(
                  children: [
                    reusableText("WEP", fontColor: Colors.white),
                    Radio(
                        activeColor: Colors.white,
                        value: 2,
                        groupValue: selectedOption,
                        onChanged: (value) {
                          setState(() {
                            selectedOption = int.parse(value.toString());
                            widget.textEditingController.text = "WEP";
                          });
                        }),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
