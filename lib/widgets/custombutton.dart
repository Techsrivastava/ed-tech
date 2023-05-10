import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CustomButton extends StatelessWidget {
  final Text title;
  final GestureTapCallback onPressed;

  const CustomButton({Key? key, required this.title, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 6.h,
      width: 40.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        color: Colors.blue,
      ),
      child: TextButton(
        onPressed: onPressed,
        child: title,
        style: TextButton.styleFrom(
          primary: Colors.white,
          textStyle: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
