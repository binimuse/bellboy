import 'package:bellboy/app/common/widgets/buttons/button_gray_scale_outline.dart';
import 'package:bellboy/app/common/widgets/buttons/button_primary_fill.dart';
import 'package:bellboy/app/common/widgets/buttons/button_primary_fill_login.dart';
import 'package:bellboy/app/common/widgets/forms/phone_number_input.dart';
import 'package:bellboy/app/common/widgets/forms/text_input_login.dart';
import 'package:bellboy/app/common/widgets/navigation/top_nav_close_text.dart';
import 'package:bellboy/app/config/theme/app_colors.dart';
import 'package:bellboy/app/config/theme/app_sizes.dart';
import 'package:bellboy/app/config/theme/app_text_styles.dart';
import 'package:bellboy/app/modules/login/views/widget/dialog_find_email.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../controllers/mobile_verification_controller.dart';
import 'package:otp_text_field/otp_text_field.dart';
import 'package:otp_text_field/style.dart';

class MobileVerificationView extends GetView<MobileVerificationController> {
  const MobileVerificationView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
              height: AppSizes.mp_v_2,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: AppSizes.mp_w_4),
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
                    height: AppSizes.mp_v_4,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Column(
                        children: [
                          Row(
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
                          ),
                          SizedBox(
                            height: AppSizes.mp_v_2,
                          ),
                          SizedBox(
                            width: 24.w,
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
                      Expanded(
                        child: PhoneNumberInput(
                          hint: 'Phone Number',
                          autofocus: false,
                          controller: controller.phoneController,
                          onChanged: (value) {
                            // Validate password on type
                            bool isValid = controller
                                .validatPhone(); // Pass the value to validatePassword
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
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: AppSizes.mp_v_4,
                  ),
                  Obx(() => controller.isPhoneValid.value
                      ? OTPTextField(
                          length: 5,
                          width: 100.w,
                          fieldWidth: AppSizes.icon_size_16,
                          otpFieldStyle: OtpFieldStyle(
                            borderColor: AppColors.grayDark,
                            focusBorderColor: AppColors.grayDark,
                            disabledBorderColor: AppColors.grayLight,
                            enabledBorderColor: AppColors.grayLight,
                            errorBorderColor: AppColors.danger,
                          ),
                          style: AppTextStyles.bodyLargeBold,
                          textFieldAlignment: MainAxisAlignment.spaceAround,
                          fieldStyle: FieldStyle.underline,
                          contentPadding:
                              EdgeInsets.only(bottom: AppSizes.mp_v_2),
                          onCompleted: (pin) {},
                        )
                      : const SizedBox()),
                  SizedBox(
                    height: AppSizes.mp_v_2,
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: ButtonGrayScaleOutline(
                      buttonSizeType: ButtonSizeType.SMALL,
                      text: 'Resend',
                      onTap: () {},
                      isDisabled: false,
                    ),
                  ),
                ],
              ),
            ),
            const Expanded(
              child: SizedBox(),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: AppSizes.mp_w_4),
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      MaterialButton(
                        onPressed: () {
                          showModalBottomSheet(
                            context: context,
                            builder: (BuildContext context) {
                              return Container(
                                height: 40.h,
                                padding: const EdgeInsets.all(16),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Center(
                                      child: Text(
                                        'I didn’t receive a code',
                                        style: AppTextStyles.bodyLargeBold
                                            .copyWith(color: AppColors.black),
                                      ),
                                    ),
                                    const SizedBox(height: 8),
                                    Text(
                                      'Check your phone number',
                                      style: AppTextStyles.bodySmallBold
                                          .copyWith(color: AppColors.black),
                                    ),
                                    const SizedBox(height: 16),
                                    Text(
                                      'Make sure that you entered your phone number correctly..',
                                      style: AppTextStyles.bodySmallRegular
                                          .copyWith(
                                              color: AppColors.grayDefault),
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
                                          .copyWith(
                                              color: AppColors.grayDefault),
                                    ),
                                    const SizedBox(height: 16),
                                    Center(
                                      child: ButtonPrimaryFill(
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
                        },
                        child: Padding(
                          padding:
                              EdgeInsets.symmetric(vertical: AppSizes.mp_v_2),
                          child: Center(
                            child: Text(
                              "I didn’t receive a code",
                              style: AppTextStyles.bodySmallUnderlineRegular
                                  .copyWith(color: AppColors.grayLight),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Obx(() => ButtonPrimaryFill(
                        buttonSizeType: ButtonSizeType.LARGE,
                        isDisabled:
                            controller.isPhoneValid.value ? false : true,
                        text: "Enter your phone number",
                        onTap: () {
                          // Navigator.of(context).pushNamed(
                          //   AppRouterPaths.findEmailDone,
                          // );
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
