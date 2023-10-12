import 'package:bellboy/app/config/theme/app_colors.dart';
import 'package:bellboy/app/config/theme/app_sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ButtonIconPrimaryFill extends StatelessWidget {
  const ButtonIconPrimaryFill(
      {Key? key,
      required this.onTap,
      required this.isDisabled,
      required this.icon})
      : super(key: key);

  final VoidCallback onTap;
  final bool isDisabled;
  final String icon;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: AppSizes.icon_size_10,
      height: AppSizes.icon_size_10,
      child: Material(
        color: isDisabled ? AppColors.grayLighter : AppColors.primary,
        borderRadius: BorderRadius.circular(AppSizes.radius_8),
        child: MaterialButton(
          onPressed: onTap,
          padding: EdgeInsets.zero,
          child: Padding(
            padding: EdgeInsets.all(AppSizes.mp_w_2 * 1.2),
            child: SvgPicture.asset(
              icon,
              color: AppColors.whiteOff,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
