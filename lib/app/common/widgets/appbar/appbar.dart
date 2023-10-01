import 'package:bellboy/app/config/theme/app_assets.dart';
import 'package:bellboy/gen/assets.gen.dart';
import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class CustomAppBars extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBars({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      leading: Padding(
        padding: const EdgeInsets.only(left: 9.0), // Add padding to the left
        child: IconButton(
          icon: SvgPicture.asset(Assets.icons.menu),
          onPressed: () {
            Get.back();
          },
        ),
      ),
      title: SizedBox(
        width: 25.w, // Set the desired width of the title image
        height: 26.h, // Set the desired height of the title image
        child: Image.asset(
          AppAssets.logo,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
