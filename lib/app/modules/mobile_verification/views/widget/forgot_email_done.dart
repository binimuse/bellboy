
import 'package:bellboy/app/common/widgets/buttons/button_primary_fill.dart';
import 'package:bellboy/app/common/widgets/buttons/button_white_fill.dart';
import 'package:bellboy/app/config/theme/app_assets.dart';
import 'package:bellboy/app/config/theme/app_colors.dart';
import 'package:bellboy/app/config/theme/app_sizes.dart';
import 'package:bellboy/app/config/theme/app_text_styles.dart';
import 'package:bellboy/app/routes/app_pages.dart';
import 'package:bellboy/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../controllers/mobile_verification_controller.dart';

class ForgotEmailtDone extends GetView<MobileVerificationController> {
  const ForgotEmailtDone({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: AppSizes.mp_w_6),
          child: buildEmailDound(),
        ),
      ),
    );
  }

  Column buildEmailNotFound() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "No matching e-mail address found.",
                textAlign: TextAlign.center,
                style: AppTextStyles.displayOneBold,
              ),
              SizedBox(
                height: AppSizes.mp_v_2,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: AppSizes.mp_w_8),
                child: Text(
                  "Check your phone number again or contact bellboy.",
                  textAlign: TextAlign.center,
                  style: AppTextStyles.bodySmallBold.copyWith(
                    color: AppColors.grayDark,
                  ),
                ),
              ),
              SizedBox(
                height: AppSizes.mp_v_4,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    Assets.icons.customercenter,
                    color: AppColors.grayLight,
                  ),
                  SizedBox(
                    width: AppSizes.mp_w_2,
                  ),
                  Text(
                    "0430 027 934",
                    style: AppTextStyles.bodySmallBold.copyWith(
                        color: AppColors.grayDark, fontSize: AppSizes.font_14),
                  ),
                ],
              ),
            ],
          ),
        ),
        ButtonPrimaryFill(
          isterms: false,
          buttonSizeType: ButtonSizeType.LARGE,
          isDisabled: false,
          text: "Go to log in",
          onTap: () {
            Get.toNamed(Routes.LOGIN);
          },
        ),
        SizedBox(
          height: AppSizes.mp_v_4,
        ),
      ],
    );
  }

  Column buildEmailDound() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                AppAssets.emailimage,
                // R.ASSETS_IMAGES_IMG_SENT_EMAIL_PNG,
                width: AppSizes.icon_size_24,
                height: AppSizes.icon_size_24,
                fit: BoxFit.contain,
              ),
              SizedBox(
                height: AppSizes.mp_v_2,
              ),
              Text(
                "We found your e-mail!",
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
                    vertical: AppSizes.mp_v_1,
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 55.w, // Set a specific width

                        child: Center(
                          child: Text(
                            "doubled@doubled.com",
                            textAlign: TextAlign.left,
                            style: AppTextStyles.titleBold.copyWith(
                              color: AppColors.primary,
                              fontSize: AppSizes.font_16,
                            ),
                            overflow: TextOverflow.fade,
                          ),
                        ),
                      ),
                      ButtonWhiteFill(
                        buttonSizeType: ButtonSizeType.SMALL,
                        text: 'Copy',
                        onTap: () {},
                        isDisabled: false,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        ButtonPrimaryFill(
          buttonSizeType: ButtonSizeType.LARGE,
          isDisabled: false,
          text: "Go to log in",
          onTap: () {
            Get.toNamed(Routes.LOGIN);
          },
          isterms: false,
        ),
        SizedBox(
          height: AppSizes.mp_v_4,
        ),
      ],
    );
  }
}
