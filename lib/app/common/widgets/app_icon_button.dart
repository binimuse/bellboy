import 'package:bellboy/app/config/theme/app_sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppSvgButton extends StatelessWidget {
  final String imagePath;
  final VoidCallback onPressed;
  final double size;

  const AppSvgButton(
      {super.key,
      required this.imagePath,
      required this.onPressed,
      required this.size});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      padding: EdgeInsets.all(AppSizes.mp_w_2),
      minWidth: size,
      height: size,
      child: SvgPicture.asset(
        imagePath,
        width: size,
        height: size,
      ),
    );
  }
}