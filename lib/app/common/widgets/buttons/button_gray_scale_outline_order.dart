import 'package:bellboy/app/config/theme/app_colors.dart';
import 'package:bellboy/app/config/theme/app_sizes.dart';
import 'package:bellboy/app/config/theme/app_text_styles.dart';
import 'package:flutter/material.dart';

import 'button_primary_fill.dart';

class ButtonGrayScaleOutlineOrder extends StatelessWidget {
  const ButtonGrayScaleOutlineOrder(
      {Key? key,
      required this.buttonSizeType,
      required this.text,
      required this.onTap,
      required this.isDisabled})
      : super(key: key);

  final ButtonSizeType buttonSizeType;
  final String text;
  final VoidCallback onTap;
  final bool isDisabled;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: buttonSizeType == ButtonSizeType.SMALL ? null : double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          shadowColor: AppColors.grayLight,
          backgroundColor:
              isDisabled ? Colors.transparent : AppColors.primaryLighter,
          // shape: RoundedRectangleBorder(
          //   borderRadius: BorderRadius.circular(AppSizes.radius_8),
          //
          // ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppSizes.radius_8),
            side: !isDisabled
                ? BorderSide(
                    color: AppColors.primary,
                    width: 1,
                  )
                : BorderSide(
                    color: AppColors.grayLight,
                    width: 1,
                  ),
          ),
        ),
        onPressed: onTap,
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: buttonSizeType == ButtonSizeType.LARGE
                ? AppSizes.mp_v_2 * 0.9
                : buttonSizeType == ButtonSizeType.MEDIUM
                    ? AppSizes.mp_v_1 * 1.5
                    : AppSizes.mp_v_1 / 2,
          ),
          child: Text(
            text,
            style: AppTextStyles.bodyLargeBold.copyWith(
              color: isDisabled ? AppColors.grayLight : AppColors.primary,
            ),
          ),
        ),
      ),
    );
  }
}
