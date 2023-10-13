import 'package:bellboy/app/common/widgets/buttons/button_primary_fill.dart';
import 'package:bellboy/app/config/theme/app_assets.dart';
import 'package:bellboy/app/config/theme/app_colors.dart';
import 'package:bellboy/app/config/theme/app_sizes.dart';
import 'package:bellboy/app/config/theme/app_text_styles.dart';
import 'package:bellboy/gen/assets.gen.dart';
import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../../../modules/order_list/views/map/mapView.dart';
import '../buttons/button_gray_scale_outline_order.dart';

class CustomAppBars extends StatelessWidget implements PreferredSizeWidget {
  final VoidCallback onPressed; // Add a parameter for onPressed function
  final bool isOrderpage; // Add a parameter for onPressed function
  final VoidCallback onMapIconPressed;

  const CustomAppBars({
    Key? key,
    required this.onPressed,
    required this.isOrderpage,
    required this.onMapIconPressed,
  }) : super(key: key);

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
      actions: [
        isOrderpage == true
            ? Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    IconButton(
                      icon: SvgPicture.asset(Assets.icons.sort),
                      color: AppColors.grayDefault,
                      onPressed: () {
                        showbottomSheet(context);
                      },
                    ),
                    IconButton(
                      icon: SvgPicture.asset(Assets.icons.mapoutline),
                      color: AppColors.grayDefault,
                      onPressed: onMapIconPressed,
                    ),
                  ],
                ),
              )
            : const SizedBox(),
      ],
    );
  }

  showbottomSheet(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) {
        final screenWidth = MediaQuery.of(context).size.width;
        return SingleChildScrollView(
          child: Container(
            width: screenWidth,
            height: 70.h,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(24.0),
                topRight: Radius.circular(24.0),
              ),
              color: AppColors.whiteOff, // Add desired background color
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Text(
                    'Sort by',
                    style: AppTextStyles.headlineBold.copyWith(
                      color: AppColors.black,
                      fontSize: AppSizes.font_20,
                    ),
                  ),
                ),
                SizedBox(height: 2.h),
                Center(
                  child: ButtonGrayScaleOutlineOrder(
                    buttonSizeType: ButtonSizeType.MEDIUM,
                    onTap: () {},
                    isDisabled: false,
                    text: 'Nearest',
                  ),
                ),
                SizedBox(
                  height: 2.h,
                ),
                Center(
                  child: ButtonGrayScaleOutlineOrder(
                    buttonSizeType: ButtonSizeType.MEDIUM,
                    onTap: () {},
                    isDisabled: true,
                    text: 'Time Remaining : Short',
                  ),
                ),
                SizedBox(
                  height: 2.h,
                ),
                Center(
                  child: ButtonGrayScaleOutlineOrder(
                    buttonSizeType: ButtonSizeType.MEDIUM,
                    onTap: () {},
                    isDisabled: true,
                    text: 'Time Remaining : Long',
                  ),
                ),
                SizedBox(
                  height: 2.h,
                ),
                Center(
                  child: ButtonGrayScaleOutlineOrder(
                    buttonSizeType: ButtonSizeType.MEDIUM,
                    onTap: () {},
                    isDisabled: true,
                    text: 'Latest',
                  ),
                ),
                SizedBox(
                  height: 2.h,
                ),
                Center(
                  child: ButtonGrayScaleOutlineOrder(
                    buttonSizeType: ButtonSizeType.MEDIUM,
                    onTap: () {},
                    isDisabled: true,
                    text: 'Price : High to Low',
                  ),
                ),
                SizedBox(
                  height: 2.h,
                ),
                Center(
                  child: ButtonGrayScaleOutlineOrder(
                    buttonSizeType: ButtonSizeType.MEDIUM,
                    onTap: () {},
                    isDisabled: true,
                    text: 'Price : Low To High',
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
