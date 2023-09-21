import 'package:bellboy/app/common/widgets/buttons/button_primary_fill.dart';
import 'package:bellboy/app/common/widgets/buttons/button_primary_fill_login.dart';
import 'package:bellboy/app/common/widgets/forms/text_input_signup.dart';

import 'package:bellboy/app/common/widgets/navigation/top_nav_back_text.dart';
import 'package:bellboy/app/config/theme/app_colors.dart';
import 'package:bellboy/app/config/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../common/widgets/forms/text_input_login.dart';
import '../../../config/theme/app_sizes.dart';
import '../../../routes/app_pages.dart';
import '../controllers/signup_controller.dart';
import 'widget/username.dart';

class SignupView extends GetView<SignupController> {
  const SignupView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      FocusScope.of(context).requestFocus(controller.emailFocusNode);
    });

    return WillPopScope(
      onWillPop: () async {
        Get.back();
        return false;
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TopNavBackText(
                centerTitle: '',
                rightText: '',
                useHomeIcon: false,
              ),
              SizedBox(height: 2.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 4.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Sign up",
                      textAlign: TextAlign.start,
                      style: AppTextStyles.displayOneBold,
                    ),
                    SizedBox(height: 2.h),
                    Obx(
                      () => SingleChildScrollView(
                        child: Column(
                          children: [
                            TextInputSignup(
                              hint: 'Email',
                              controller: controller.emailController,
                              focusNode: controller.emailFocusNode,
                              signupController: controller,
                              onChanged: (value) {
                                // Validate email on type
                                bool isValid = controller.validateEmail();
                                controller.isEmailValidated.value = isValid;

                                // Check if email is valid and update UI accordingly
                                if (isValid) {
                                  controller.isNextPressed(
                                      false); // Reset Next button
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
                            ),
                            SizedBox(height: 1.h),

                            // Show Password field only when Next is pressed
                            if (controller.isNextPressed.value)

                              // Inside the password field widget
                              TextInputLogin(
                                hint: 'Password',
                                isPassword: true,
                                onChanged: (value) {
                                  // Validate password on type
                                  bool isValid = controller
                                      .validatePassword(); // Pass the value to validatePassword
                                  controller.isPasswordValid.value = isValid;

                                  // Check if the password is valid and display the appropriate text
                                  if (isValid) {
                                    controller.isNextPressed(
                                        true); // Set to true but don't hide password field
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
                              ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Obx(
                        () => SizedBox(
                          height: controller.isNextPressed.value ? 0.0 : 100,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: AppSizes.mp_w_4,
                          vertical: AppSizes.mp_v_2,
                        ),
                        child: Column(
                          children: [
                            SizedBox(height: 2.h),
                            Obx(
                              () => ButtonPrimaryFillLogin(
                                buttonSizeType: ButtonSizeTypeLogin.LARGE,
                                isDisabled:
                                    !controller.isEmailValidated.value ||
                                        (controller.isEmailValidated.value &&
                                            !controller.isNextPressed.value),
                                text: controller.isEmailValidated.value
                                    ? controller.isNextPressed.value
                                        ? controller.isPasswordValid.value
                                            ? "Next"
                                            : "Enter password"
                                        : "Next"
                                    : 'Enter your e-mail address',
                                onTap: () {
                                  if (!controller.isEmailValidated.value) {
                                    controller.isEmailValidated.value = false;
                                    FocusScope.of(context).requestFocus(
                                        controller.passwordFocusNode);
                                  } else if (!controller.isNextPressed.value) {
                                    controller.isNextPressed(true);
                                    // Change the button text to "Enter password"
                                  } else {
                                    // Handle final next logic
                                    Get.to(const SignUpUserName());
                                  }
                                },
                              ),
                            ),
                            SizedBox(height: 2.h),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
