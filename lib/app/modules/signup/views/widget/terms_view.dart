import 'package:bellboy/app/common/widgets/app_icon_button.dart';
import 'package:bellboy/app/common/widgets/buttons/button_primary_fill.dart';
import 'package:bellboy/app/common/widgets/forms/check_box.dart';
import 'package:bellboy/app/common/widgets/navigation/top_nav_back_icon.dart';
import 'package:bellboy/app/config/theme/app_colors.dart';
import 'package:bellboy/app/config/theme/app_sizes.dart';
import 'package:bellboy/app/modules/signup/controllers/signup_controller.dart';
import 'package:bellboy/app/routes/app_pages.dart';
import 'package:bellboy/gen/assets.gen.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../config/theme/app_text_styles.dart';

class TermsView extends GetView<SignupController> {
  TermsView({Key? key}) : super(key: key);

  @override
  final SignupController controller = Get.put(SignupController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ///APP BAR
            const TopNavBackIcon(
              centerTitle: '',
              useRightIcon: false,
              useHomeIcon: false,
            ),

            SizedBox(
              height: AppSizes.mp_v_4,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ///PAGE TITLE
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: AppSizes.mp_w_4),
                    child: Text(
                      "Accept Terms & Review\nPrivacy Notice",
                      textAlign: TextAlign.start,
                      style: AppTextStyles.displayOneBold,
                    ),
                  ),

                  Expanded(
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: AppSizes.mp_w_4),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              // Checkbox for "I agree with all terms"
                              CheckBox(
                                text: "I agree with all terms",
                                isInitSelected:
                                    controller.allTermsChecked.value,
                                checkBoxSize: CheckBoxSize.LARGE,
                                onTap: controller.markAllTerms,
                              ),
                              const Expanded(child: SizedBox()),
                              AppSvgButton(
                                imagePath: Assets.icons.chevronRight,
                                iconColor: AppColors.grayDefault,
                                onPressed: () {},
                                size: AppSizes.icon_size_6,
                              ),
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: AppSizes.mp_v_1 / 2),
                            child: Divider(
                              color: AppColors.grayLighter,
                              thickness: 1,
                            ),
                          ),
                          // Individual term checkboxes
                          ValueListenableBuilder<bool>(
                            valueListenable: controller.termCheckboxes[0],
                            builder: (context, value, child) {
                              return Row(
                                children: [
                                  CheckBox(
                                    text: "Terms of Use",
                                    isInitSelected: value,
                                    checkBoxSize: CheckBoxSize.MEDIUM,
                                    onTap: () => controller.markTerm(0),
                                  ),
                                  const Expanded(child: SizedBox()),
                                  AppSvgButton(
                                    imagePath: Assets.icons.chevronRight,
                                    iconColor: AppColors.grayLight,
                                    onPressed: () {},
                                    size: AppSizes.icon_size_6,
                                  ),
                                ],
                              );
                            },
                          ),
                          ValueListenableBuilder<bool>(
                            valueListenable: controller.termCheckboxes[1],
                            builder: (context, value, child) {
                              return Row(
                                children: [
                                  CheckBox(
                                    text: "Privacy Notice",
                                    isInitSelected: value,
                                    checkBoxSize: CheckBoxSize.MEDIUM,
                                    onTap: () => controller.markTerm(1),
                                  ),
                                  const Expanded(child: SizedBox()),
                                  AppSvgButton(
                                    imagePath: Assets.icons.chevronRight,
                                    iconColor: AppColors.grayLight,
                                    onPressed: () {},
                                    size: AppSizes.icon_size_6,
                                  ),
                                ],
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),

                  SizedBox(
                    height: AppSizes.mp_v_4,
                  ),

                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: AppSizes.mp_w_4),
                    child: ButtonPrimaryFill(
                      buttonSizeType: ButtonSizeType.LARGE,
                      isDisabled: false,
                      text: "Next",
                      onTap: () {
                        Get.toNamed(Routes.SIGNUP);
                      },
                    ),
                  ),

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
