import 'package:bellboy/app/common/widgets/buttons/button_primary_fill.dart';
import 'package:bellboy/app/common/widgets/forms/text_input_login.dart';
import 'package:bellboy/app/common/widgets/navigation/top_nav_back_text.dart';
import 'package:bellboy/app/config/theme/app_colors.dart';
import 'package:bellboy/app/config/theme/app_sizes.dart';
import 'package:bellboy/app/config/theme/app_text_styles.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/find_password_controller.dart';
import 'widget/find_account_done.dart';

class FindPasswordView extends GetView<FindPasswordController> {
  const FindPasswordView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ///APP BAR
            const TopNavBackText(
              centerTitle: '',
              rightText: '',
              useHomeIcon: false,
            ),

            SizedBox(
              height: AppSizes.mp_v_2,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: AppSizes.mp_w_6),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Find your password",
                    textAlign: TextAlign.start,
                    style: AppTextStyles.displayOneBold,
                  ),
                  SizedBox(
                    height: AppSizes.mp_v_4,
                  ),
                  TextInputLogin(
                    autofocus: true,
                    focusNode: controller.passwordFocusNode,
                    hint: 'Email',
                    controller: controller.emailController,
                    onChanged: (value) {
                      // Validate email on type
                      bool isValid = controller.validateEmail();
                      controller.isEmailValidated.value = isValid;

                      // Check if email is valid and update UI accordingly
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your email';
                      }
                      if (!controller.isEmailValidated.value) {
                        return 'Invalid email';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: AppSizes.mp_v_2,
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: AppSizes.mp_w_8 * 2),
                    child: Text(
                      "Enter the e-mail address that you registered. Let us send your e-mail password reset link.",
                      style: AppTextStyles.captionRegular
                          .copyWith(color: AppColors.grayDark),
                    ),
                  ),
                ],
              ),
            ),
            const Expanded(
              child: SizedBox(),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: AppSizes.mp_w_6),
              child: Column(
                children: [
                  Obx(() => ButtonPrimaryFill(
                        isterms: false,
                        buttonSizeType: ButtonSizeType.LARGE,
                        isDisabled:
                            controller.isEmailValidated.value ? false : true,
                        text: !controller.isEmailValidated.value
                            ? "Enter your e-mail address"
                            : "Send password reset link",
                        onTap: () {
                          Get.to(const ForgotAccountDone());
                        },
                      )),
                  SizedBox(
                    height: AppSizes.mp_v_2,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
