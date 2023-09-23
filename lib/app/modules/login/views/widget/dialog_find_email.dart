import 'package:bellboy/app/common/widgets/buttons/button_gray_scale_fill.dart';
import 'package:bellboy/app/common/widgets/buttons/button_primary_fill.dart';
import 'package:bellboy/app/common/widgets/dialogs/dialog_center_common_widget.dart';
import 'package:bellboy/app/config/theme/app_colors.dart';
import 'package:bellboy/app/config/theme/app_sizes.dart';
import 'package:bellboy/app/config/theme/app_text_styles.dart';
import 'package:bellboy/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DialogFindEmail extends StatelessWidget {
  const DialogFindEmail({super.key});

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
              'Forgot the e-mail?',
              textAlign: TextAlign.center,
              style: AppTextStyles.headlineBold,
            ),
            SizedBox(
              height: AppSizes.mp_v_2,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: AppSizes.mp_w_4),
              child: Text(
                "You can find your e-mail address by Mobile Authentication.",
                textAlign: TextAlign.center,
                style: AppTextStyles.bodySmallRegular
                    .copyWith(color: AppColors.grayDefault),
              ),
            ),
            SizedBox(
              height: AppSizes.mp_v_4,
            ),
            ButtonGrayScaleFill(
              buttonSizeType: ButtonSizeType.LARGE,
              isDisabled: false,
              text: "Discard",
              onTap: () {
                Navigator.of(context).pop();
              },
            ),
            SizedBox(
              height: AppSizes.mp_v_2,
            ),
            ButtonPrimaryFill(
              buttonSizeType: ButtonSizeType.LARGE,
              isDisabled: false,
              text: "Go to mobile authentication",
              onTap: () {
                Get.toNamed(Routes.MOBILE_VERIFICATION);
                Navigator.of(context).pop();
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
