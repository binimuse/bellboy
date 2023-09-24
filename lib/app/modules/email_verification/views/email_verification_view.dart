import 'package:bellboy/app/common/widgets/buttons/button_primary_fill.dart';
import 'package:bellboy/app/common/widgets/buttons/button_white_fill.dart';
import 'package:bellboy/app/config/theme/app_assets.dart';
import 'package:bellboy/app/config/theme/app_colors.dart';
import 'package:bellboy/app/config/theme/app_sizes.dart';
import 'package:bellboy/app/config/theme/app_text_styles.dart';
import 'package:bellboy/app/routes/app_pages.dart';
import 'package:bellboy/app/utils/keyboard.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/email_verification_controller.dart';
import 'widgets/dialog_email_resend.dart';

class EmailVerificationView extends GetView<EmailVerificationController> {
  const EmailVerificationView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: AppSizes.mp_w_6),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Get.toNamed(Routes.QUIZ);
                      },
                      child: Image.asset(
                        AppAssets.emailimage,
                        width: AppSizes.icon_size_24,
                        height: AppSizes.icon_size_24,
                        fit: BoxFit.contain,
                      ),
                    ),
                    SizedBox(
                      height: AppSizes.mp_v_2,
                    ),
                    Text(
                      "We sent a rider application e-mail!",
                      textAlign: TextAlign.center,
                      style: AppTextStyles.displayOneBold,
                    ),
                    SizedBox(
                      height: AppSizes.mp_v_2,
                    ),
                    Material(
                      color: AppColors.primaryLighter,
                      borderRadius: BorderRadius.circular(AppSizes.radius_12),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: AppSizes.mp_w_4 * 1.2,
                          vertical: AppSizes.mp_v_1 * 1.5,
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "doubled@doubled.com",
                              textAlign: TextAlign.center,
                              style: AppTextStyles.titleBold.copyWith(
                                  color: AppColors.primary,
                                  fontSize: AppSizes.font_14),
                            ),
                            ButtonWhiteFill(
                              buttonSizeType: ButtonSizeType.SMALL,
                              text: 'Change',
                              onTap: () {},
                              isDisabled: false,
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: AppSizes.mp_v_2,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Please complete the registration through the rider application.",
                        textAlign: TextAlign.center,
                        style: AppTextStyles.bodySmallBold
                            .copyWith(color: AppColors.grayDark),
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MaterialButton(
                    padding: EdgeInsets.symmetric(horizontal: AppSizes.mp_w_2),
                    onPressed: () {},
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: AppSizes.mp_v_2),
                      child: Center(
                        child: Text(
                          "Didn’t get an e-mail?",
                          style: AppTextStyles.bodyLargeBold
                              .copyWith(color: AppColors.grayLight),
                        ),
                      ),
                    ),
                  ),
                  MaterialButton(
                    padding: EdgeInsets.symmetric(horizontal: AppSizes.mp_w_2),
                    onPressed: () {
                      KeyboardUtil.hideKeyboard(context);
                      Get.dialog(
                        DialogEmailResend(),
                        barrierDismissible: true,
                      );
                    },
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: AppSizes.mp_v_2),
                      child: Center(
                        child: Text(
                          "Send again",
                          style: AppTextStyles.bodyLargeBold
                              .copyWith(color: AppColors.primary),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: AppSizes.mp_v_4,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
