import 'package:bellboy/app/common/widgets/buttons/button_gray_scale_outline_without_icon.dart';
import 'package:bellboy/app/common/widgets/buttons/button_primary_fill.dart';
import 'package:bellboy/app/common/widgets/forms/phone_number_input.dart';
import 'package:bellboy/app/common/widgets/navigation/top_nav_close_text.dart';
import 'package:bellboy/app/config/theme/app_colors.dart';
import 'package:bellboy/app/config/theme/app_sizes.dart';
import 'package:bellboy/app/config/theme/app_text_styles.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:sizer/sizer.dart';

import '../controllers/mobile_verification_controller.dart';

import 'widget/find_email_done.dart';

class MobileVerificationView extends GetView<MobileVerificationController> {
  const MobileVerificationView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ///APP BAR
            const TopNavCloseText(
              centerTitle: '',
              rightText: '',
              useHomeIcon: false,
            ),

            SizedBox(
              height: AppSizes.mp_v_1,
            ),
            SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.w),
                child: Form(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Mobile verification",
                        textAlign: TextAlign.start,
                        style: AppTextStyles.displayOneBold,
                      ),
                      SizedBox(
                        height: AppSizes.mp_v_1,
                      ),
                      Text(
                        "Before ordering, we need your phone number.",
                        textAlign: TextAlign.start,
                        style: AppTextStyles.bodySmallRegular
                            .copyWith(color: AppColors.grayDark),
                      ),
                      SizedBox(
                        height: AppSizes.mp_v_2,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Column(
                            children: [
                              buildCountryCode(),
                              SizedBox(
                                height: AppSizes.mp_v_1,
                              ),
                              SizedBox(
                                width: 34.w,
                                child: Divider(
                                  color: AppColors.grayLighter,
                                  thickness: 1,
                                  height: 1,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            width: AppSizes.mp_w_4,
                          ),
                          buildPhonenumber(),
                        ],
                      ),
                      SizedBox(
                        height: AppSizes.mp_v_1,
                      ),
                      Obx(() => controller.isPhoneValid.value &&
                              controller.isNextPressed.value
                          ? buildOTPNumber(context)
                          : const SizedBox()),
                      SizedBox(
                        height: AppSizes.mp_v_1,
                      ),
                      Obx(() => controller.isPhoneValid.value &&
                              controller.isNextPressed.value &&
                              !controller.isOtpValid.value
                          ? Align(
                              alignment: Alignment.topRight,
                              child: ButtonGrayScaleOutlineWithOutIcon(
                                buttonSizeType: ButtonSizeType.SMALL,
                                text: 'Resend',
                                onTap: () {},
                                isDisabled: true,
                              ),
                            )
                          : SizedBox()),
                    ],
                  ),
                ),
              ),
            ),
            const Expanded(
              child: SizedBox(),
            ),
            Column(
              children: [
                Obx(() => controller.isPhoneValid.value &&
                        controller.isNextPressed.value &&
                        !controller.isOtpValid.value
                    ? buildIdidntrecive(context)
                    : const SizedBox()),
                Obx(() => Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: AppSizes.mp_w_8,
                      ),
                      child: ButtonPrimaryFill(
                        isterms: false,
                        buttonSizeType: ButtonSizeType.LARGE,
                        isDisabled: !controller.isPhoneValid.value ||
                            (controller.isNextPressed.value &&
                                !controller.isOtpValid.value),
                        text: !controller.isPhoneValid.value
                            ? "Enter your phone number"
                            : controller.isNextPressed.value
                                ? !controller.isOtpValid.value
                                    ? "Enter the 6-digit code you’ve got."
                                    : "Done"
                                : "Next",
                        onTap: () {
                          if (!controller.isPhoneValid.value) {
                            // Logic for when the "Enter your phone number" button is pressed
                          } else if (!controller.isNextPressed.value) {
                            controller.isNextPressed(true);
                            FocusScope.of(context)
                                .requestFocus(controller.otpFocusNode);
                            // Logic for when the "Next" button is pressed
                          } else if (!controller.isOtpValid.value) {
                            // Logic for when the "Enter 6-digit code" button is pressed
                          } else {
                            Get.to(const ForgotEmailtDone());
                            // Logic for when the "Done" button is pressed
                          }
                        },
                      ),
                    )),
                SizedBox(height: 1.h),
              ],
            ),
          ],
        ),
      ),
    );
  }

  buildCountryCode() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          width: AppSizes.mp_w_2,
        ),
        Text(
          '+61', // Replace with the desired country code
          style: AppTextStyles.bodyLargeBold,
        ),
        SizedBox(
          width: AppSizes.mp_w_4,
        ),
        Image.asset(
          'assets/images/AU.png', // Replace with the path to the Austinian flag image
          width: 27,
        ),
        SizedBox(
          width: AppSizes.mp_w_6,
        ),
      ],
    );
  }

  buildPhonenumber() {
    return Expanded(
        child: PhoneNumberInput(
      hint: 'Phone number',
      focusNode: controller.phoneFocusNode,
      autofocus: true,
      controller: controller.phoneController,
      onChanged: (value) {
        // Validate password on type
        bool isValid =
            controller.validatPhone(); // Pass the value to validatePassword
        controller.isPhoneValid.value = isValid;

        // Check if the password is valid and display the appropriate text
      },
      validator: (value) {
        if (value!.isEmpty) {
          return 'Please enter your Password';
        }
        if (!controller.isPhoneValid.value) {
          return 'Password must be at least 8 characters';
        }
        return null;
      },
    ));
  }

  buildOTPNumber(BuildContext context) {
    return PinCodeTextField(
      focusNode: controller.otpFocusNode,
      length: 6,
      autoDisposeControllers: false,
      controller: controller.otpController,
      keyboardType: TextInputType.number,
      cursorColor: AppColors.primary,
      animationType: AnimationType.none,
      animationDuration: Duration.zero,
      pinTheme: PinTheme(
        activeColor: AppColors.grayDark,
        inactiveColor: AppColors.grayLight,
        selectedColor: AppColors.grayDark,
      ),
      onCompleted: (pin) {},
      onChanged: (pin) {
        if (pin.length == 6) {
          controller.isOtpValid(true);
        } else {
          controller.isOtpValid(false);
        }
      },
      appContext: context,
    );
  }

  showbottomSheet(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 40.h,
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  'I didn’t receive a code',
                  style: AppTextStyles.headlineBold
                      .copyWith(color: AppColors.black),
                ),
              ),
              const SizedBox(height: 10),
              Text(
                'Check your phone number',
                style: AppTextStyles.bodySmallBold
                    .copyWith(color: AppColors.black),
              ),
              const SizedBox(height: 16),
              Text(
                'Make sure that you entered your phone number correctly..',
                style: AppTextStyles.bodySmallRegular
                    .copyWith(color: AppColors.grayDefault),
              ),
              const SizedBox(height: 16),
              Text(
                'Check for spam or blocking',
                style: AppTextStyles.bodySmallBold
                    .copyWith(color: AppColors.black),
              ),
              const SizedBox(height: 16),
              Text(
                'Please unblock spam and try again.',
                style: AppTextStyles.bodySmallRegular
                    .copyWith(color: AppColors.grayDefault),
              ),
              const SizedBox(height: 16),
              Center(
                child: ButtonPrimaryFill(
                  isterms: false,
                  buttonSizeType: ButtonSizeType.MEDIUM,
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  isDisabled: false,
                  text: 'Confirm',
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  buildIdidntrecive(BuildContext context) {
    return MaterialButton(
      onPressed: () {
        showbottomSheet(context);
      },
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: AppSizes.mp_v_2),
        child: Center(
          child: Text(
            "I didn’t receive a code",
            style: AppTextStyles.bodySmallUnderlineRegular
                .copyWith(color: AppColors.grayLight),
          ),
        ),
      ),
    );
  }
}
