import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String btnTitle;
  final Function onPressed;
  final Color buttonColor;
  const CustomButton({
    super.key,
    required this.onPressed,
    required this.btnTitle,
    required this.buttonColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: buttonColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            )),
        onPressed: () {
          onPressed();
        },
        child: Text(
          btnTitle,
        ),
      ),
    );
  }
}
