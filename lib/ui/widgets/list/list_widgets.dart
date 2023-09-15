import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qr_code/bloc/bloc.dart';
import 'package:qr_code/ui/ui.dart';

Widget topBarWidget() {
  return BlocBuilder<ListBloc, ListState>(
    builder: (context, state) {
      return Container(
        height: 60.h,
        width: 375.w,
        margin: EdgeInsets.symmetric(horizontal: 10.w, vertical: 15.h),
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 7,
          itemBuilder: (context, index) {
            String text = "";
            switch (index) {
              case 0:
                text = "All";
              case 1:
                text = "VCard";
              case 2:
                text = "Wifi";
              case 3:
                text = "Sms";
              case 4:
                text = "Url";
              case 5:
                text = "Email";
              case 6:
                text = "Event";
            }
            return GestureDetector(
              onTap: () {
                context.read<ListBloc>().add(
                      ChangeIndexEvent(index),
                    );
              },
              child: topBarElementWidget(
                text,
                state.index == index ? true : false,
              ),
            );
          },
        ),
      );
    },
  );
}

Widget topBarElementWidget(String text, bool isSelected) {
  return Container(
      width: 100.w,
      alignment: Alignment.center,
      child: Column(
        children: [
          reusableText(text,
              fontColor: isSelected ? Colors.white : Colors.white10,
              fontSize: 18),
          SizedBox(height: 10.h,),
          Divider(
            color: isSelected ? Colors.white : Colors.white10,
            thickness: isSelected ? 2 : 1,
          )
        ],
      ));
}
