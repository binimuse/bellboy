import 'package:bellboy/app/common/widgets/buttons/button_primary_fill.dart';
import 'package:bellboy/app/common/widgets/dialogs/dialog_center_common_widget.dart';
import 'package:bellboy/app/config/theme/app_colors.dart';
import 'package:bellboy/app/config/theme/app_sizes.dart';
import 'package:bellboy/app/config/theme/app_text_styles.dart';
import 'package:bellboy/app/utils/keyboard.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppUpdate extends StatelessWidget {
  const AppUpdate({super.key});

  @override
  Widget build(BuildContext context) {
    return DialogCenterCommonWidget(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: AppSizes.mp_w_6),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            SizedBox(
              height: AppSizes.mp_v_4,
            ),
            Text(
              'Update version',
              textAlign: TextAlign.center,
              style: AppTextStyles.headlineBold,
            ),
            SizedBox(
              height: AppSizes.mp_v_2,
            ),
            Text(
              "Navigate to the App Store for version updates.",
              textAlign: TextAlign.center,
              style: AppTextStyles.bodySmallRegular
                  .copyWith(color: AppColors.grayDefault),
            ),
            SizedBox(
              height: AppSizes.mp_v_4,
            ),
            ButtonPrimaryFill(
              isterms: false,
              buttonSizeType: ButtonSizeType.LARGE,
              isDisabled: false,
              text: "Move",
              onTap: () {
                KeyboardUtil.hideKeyboard(context);
                Get.back();
              },
            ),
            SizedBox(
              height: AppSizes.mp_v_2 * 1.4,
            ),
          ],
        ),
      ),
    );
  }
}
