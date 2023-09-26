import 'package:bellboy/app/common/widgets/buttons/button_primary_fill.dart';
import 'package:bellboy/app/config/theme/app_assets.dart';
import 'package:bellboy/app/config/theme/app_colors.dart';
import 'package:bellboy/app/config/theme/app_sizes.dart';
import 'package:bellboy/app/config/theme/app_text_styles.dart';
import 'package:bellboy/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../controllers/find_password_controller.dart';

class ForgotAccountDone extends GetView<FindPasswordController> {
  const ForgotAccountDone({Key? key}) : super(key: key);
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
                "No matching\nE-mail found.",
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
                    Assets.icons.customerservice,
                    color: AppColors.grayLight,
                  ),
                  SizedBox(
                    width: AppSizes.mp_w_2,
                  ),
                  Text(
                    "0430 027 934",
                    style: AppTextStyles.bodySmallBold.copyWith(
                      color: AppColors.grayDark,
                    ),
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
          onTap: () {},
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
                height: AppSizes.mp_v_4,
              ),
              Text(
                "Check your e-mail",
                textAlign: TextAlign.center,
                style: AppTextStyles.displayOneBold,
              ),
              SizedBox(
                height: AppSizes.mp_v_1,
              ),
              Text(
                "We sent your e-mail the password reset link. Please check your e-mail.",
                textAlign: TextAlign.center,
                style: AppTextStyles.bodySmallBold.copyWith(
                    color: AppColors.grayDark, fontSize: AppSizes.font_14),
              ),
            ],
          ),
        ),
        // ButtonPrimaryFill(
        //   buttonSizeType: ButtonSizeType.LARGE,
        //   isDisabled: false,
        //   text: "Go to log in",
        //   onTap: () {},
        // ),
        SizedBox(
          height: AppSizes.mp_v_4,
        ),
      ],
    );
  }
}
