// ignore_for_file: must_be_immutable, unnecessary_null_comparison

import 'package:bellboy/app/config/theme/app_colors.dart';
import 'package:bellboy/app/config/theme/app_sizes.dart';
import 'package:bellboy/app/config/theme/app_text_styles.dart';
import 'package:bellboy/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:slider_button/slider_button.dart';

import 'package:sizer/sizer.dart';

class AppDrawer extends StatefulWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  State<AppDrawer> createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  bool isExpanded = false;
  final List<String> titles = [
    'Order',
    'Matched',
    'Delivering',
    'Earnings',
    'Delivery History',
  ];

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildClosebutton(),
            SizedBox(height: 1.h),
            buildProfilecard(),
            SizedBox(height: 2.h),
            buildCard(),
            SizedBox(height: 2.h),
            buildMenus(),
            const Spacer(), // Add Spacer widget to push the button to the bottom
            buildSliderbutton(),
            SizedBox(height: 2.h),
          ],
        ),
      ),
    );
  }

  buildCard() {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.grayLight.withOpacity(0.2),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            SvgPicture.asset(
              Assets.icons.dollarcircleline,
            ),
            SizedBox(width: 1.w),
            Text(
              'Today',
              style: AppTextStyles.bodyLargeBold.copyWith(
                color: AppColors.grayDefault,
              ),
            ),
            Expanded(
              child: Align(
                alignment: Alignment.centerRight,
                child: Text(
                  '0',
                  style: AppTextStyles.bodyLargeBold.copyWith(
                    color: AppColors.grayDefault,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  buildProfilecard() {
    return Row(
      children: [
        const CircleAvatar(
          radius: 30,
          backgroundImage:
              NetworkImage('https://www.example.com/user_profile_pic.jpg'),
        ),
        const SizedBox(width: 10),
        SizedBox(height: 2.h),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Kristen Stewart',
              style: AppTextStyles.titleBold.copyWith(
                color: AppColors.black,
              ),
            ),
            Row(
              children: [
                Text(
                  'My page',
                  style: AppTextStyles.bodySmallRegular.copyWith(
                    color: AppColors.grayDefault,
                  ),
                ),
                SvgPicture.asset(
                  Assets.icons.chevronRight,
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }

  buildClosebutton() {
    return Container(
      padding: const EdgeInsets.only(top: 50, right: 0),
      alignment: Alignment.topRight,
      child: IconButton(
        icon: const Icon(Icons.close),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }

  buildMenus() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: titles
          .map((title) => Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: AppTextStyles.displayOneBold,
                  ),
                  SizedBox(height: 2.h),
                ],
              ))
          .toList(),
    );
  }

  Widget buildSliderbutton() {
    return SliderButton(
      action: () {
        ///Do something here
        Navigator.of(context).pop();
      },
      alignLabel: Alignment.center,
      label: Text(
        "Get off",
        style: AppTextStyles.displayOneBold.copyWith(
          fontSize: AppSizes.font_16,
        ),
        textAlign: TextAlign.center,
      ),
      icon: SvgPicture.asset(
        Assets.icons.arrowright,
      ),

      ///Change All the color and size from here.
      width: 90.w,
      radius: 10,
      buttonSize: 50,
      buttonColor: AppColors.whiteOff,
      backgroundColor: AppColors.black,
      highlightedColor: Colors.white,
      baseColor: AppColors.primary,
    );
  }
}
