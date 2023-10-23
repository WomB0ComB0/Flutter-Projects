import 'package:flutter/material.dart';
import 'package:flutter_authentication_ui/app_utils.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  final String text;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: MaterialButton(
          onPressed: onPressed,
          elevation: 5.0,
          child: Container(
              decoration: BoxDecoration(
                color: colorWhite,
                borderRadius: BorderRadius.circular(30.0),
              ),
              constraints: const BoxConstraints(maxHeight: 60),
              alignment: Alignment.center,
              child: Text(
                text,
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold),
              ))),
    );
  }
}
