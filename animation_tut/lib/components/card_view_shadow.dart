import 'package:animation_tut/utilities/app_colors.dart';
import 'package:flutter/material.dart';

class CardViewShadow extends StatelessWidget {
  const CardViewShadow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration:
            BoxDecoration(borderRadius: BorderRadius.circular(40), boxShadow: [
      const BoxShadow(color: customDarkBlue, offset: Offset(0, 12)),
      BoxShadow(
        color: customBlueLight.withOpacity(0.85),
        offset: const Offset(0, 3),
      ),
    ]));
  }
}
