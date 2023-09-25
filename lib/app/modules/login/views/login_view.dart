import 'package:bellboy/app/common/widgets/buttons/button_primary_fill_login.dart';
import 'package:bellboy/app/common/widgets/forms/text_input_login.dart';
import 'package:bellboy/app/common/widgets/navigation/top_nav_back_text.dart';
import 'package:bellboy/app/config/theme/app_colors.dart';
import 'package:bellboy/app/config/theme/app_sizes.dart';
import 'package:bellboy/app/config/theme/app_text_styles.dart';
import 'package:bellboy/app/modules/login/views/widget/dialog_find_email.dart';
import 'package:bellboy/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Get.back();
        return false;
      },
      child: Scaffold(
        //resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TopNavBackText(
                centerTitle: '',
                rightText: '',
                useHomeIcon: false,
              ),
              SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 6.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Log in",
                        textAlign: TextAlign.start,
                        style: AppTextStyles.displayOneBold,
                      ),
                      SizedBox(height: 2.h),
                      Obx(
                        () => Form(
                          child: Column(
                            children: [
                              buildEmailinput(),
                              SizedBox(height: 1.h),

                              // Show Password field only when Next is pressed
                              if (controller.isNextPressed.value)
                                buildPasswordinput()
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              const Expanded(child: SizedBox()),
              Column(
                children: [
                  Obx(
                    () => SizedBox(
                      height: controller.isNextPressed.value ? 0.0 : 90,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: AppSizes.mp_w_4,
                      vertical: AppSizes.mp_v_2,
                    ),
                    child: Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            buildFindEmailButton(),
                            SizedBox(
                              height: 2.h,
                              child: VerticalDivider(
                                color: AppColors.grayLighter,
                                thickness: 2,
                              ),
                            ),
                            buildFindPassswordButton(),
                          ],
                        ),
                        SizedBox(height: 2.h),
                        Obx(
                          () => Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: buildButton(context)),
                        ),
                        SizedBox(height: 2.h),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  buildEmailinput() {
    return TextInputLogin(
      hint: 'Email',
      autofocus: true,
      controller: controller.emailController,
      focusNode: controller.emailFocusNode,
      logincontroller: controller,
      onChanged: (value) {
        // Validate email on type
        bool isValid = controller.validateEmail();
        controller.isEmailValidated.value = isValid;

        // Check if email is valid and update UI accordingly
        if (isValid) {
          controller.isNextPressed(false); // Reset Next button
        }
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
    );
  }

  buildPasswordinput() {
    return TextInputLogin(
      hint: 'Password',
      isPassword: true,
      onChanged: (value) {
        // Validate password on type
        bool isValid = controller.validatePassword();
        controller.isPasswordValid.value = isValid;

        // Check if the password is valid and display the appropriate text
        if (isValid) {
          controller
              .isNextPressed(true); // Set to true but don't hide password field
        }
      },
      validator: (value) {
        if (value!.isEmpty) {
          return 'Please enter your Password';
        }
        if (!controller.isPasswordValid.value) {
          return 'Password must be at least 8 characters';
        }
        return null;
      },
      controller: controller.passwordController,
      autofocus: controller
          .isNextPressed.value, // Set autofocus to true when Next is pressed
      focusNode: controller.passwordFocusNode, // Pass the password focus node
    );
  }

  buildFindEmailButton() {
    return MaterialButton(
      onPressed: () {
        Get.dialog(
          const DialogFindEmail(),
          barrierDismissible: true,
        );
      },
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 2.h),
        child: Center(
          child: Text(
            "Find email",
            style: AppTextStyles.bodySmallUnderlineRegular
                .copyWith(color: AppColors.grayLight),
          ),
        ),
      ),
    );
  }

  buildFindPassswordButton() {
    return MaterialButton(
      onPressed: () {
        Get.toNamed(Routes.FIND_PASSWORD);
      },
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 2.h),
        child: Center(
          child: Text(
            "Find password",
            style: AppTextStyles.bodySmallUnderlineRegular
                .copyWith(color: AppColors.grayLight),
          ),
        ),
      ),
    );
  }

  buildButton(BuildContext context) {
    return ButtonPrimaryFillLogin(
      buttonSizeType: ButtonSizeTypeLogin.LARGE,
      isDisabled: !controller.isEmailValidated.value ||
          (controller.isEmailValidated.value &&
              !controller.isNextPressed.value),
      text: controller.isEmailValidated.value
          ? controller.isNextPressed.value
              ? controller.isPasswordValid.value
                  ? "Log in"
                  : "Enter password"
              : "Next"
          : 'Enter your e-mail address',
      onTap: () {
        if (controller.isEmailValidated.value &&
            !controller.isNextPressed.value) {
          controller.isNextPressed(true);
          Future.delayed(const Duration(milliseconds: 100), () {
            FocusScope.of(context).requestFocus(controller.passwordFocusNode);
          });
        } else {
          // Handle login logic
        }
      },
    );
  }
}
