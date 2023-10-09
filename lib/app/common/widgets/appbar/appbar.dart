import 'package:bellboy/app/config/theme/app_assets.dart';
import 'package:bellboy/gen/assets.gen.dart';
import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class CustomAppBars extends StatelessWidget implements PreferredSizeWidget {
  final VoidCallback onPressed; // Add a parameter for onPressed function

  const CustomAppBars({Key? key, required this.onPressed}) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      leading: Padding(
        padding: const EdgeInsets.only(left: 9.0),
        child: IconButton(
          icon: SvgPicture.asset(Assets.icons.menu),
          onPressed: onPressed, // Use the onPressed parameter here
        ),
      ),
      title: SizedBox(
        width: 25.w,
        height: 26.h,
        child: Image.asset(
          AppAssets.logo,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
