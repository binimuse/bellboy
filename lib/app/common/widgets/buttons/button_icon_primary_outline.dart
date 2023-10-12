import 'package:bellboy/app/config/theme/app_colors.dart';
import 'package:bellboy/app/config/theme/app_sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ButtonIconPrimaryOutline extends StatelessWidget {
  const ButtonIconPrimaryOutline(
      {Key? key,
      required this.icon,
      required this.onTap,
      required this.isDisabled})
      : super(key: key);

  final String icon;
  final VoidCallback onTap;
  final bool isDisabled;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: AppSizes.icon_size_10,
      height: AppSizes.icon_size_10,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppSizes.radius_8),
          border: Border.all(
            color: isDisabled ? AppColors.grayLighter : AppColors.primary,
            width: 2,
          ),
        ),
        child: MaterialButton(
          onPressed: onTap,
          padding: EdgeInsets.zero,
          child: Padding(
            padding: EdgeInsets.all(AppSizes.mp_w_2),
            child: SvgPicture.asset(
              icon,
              color: AppColors.primary,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
