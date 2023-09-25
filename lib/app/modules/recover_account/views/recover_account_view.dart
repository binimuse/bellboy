import 'package:bellboy/app/config/theme/app_assets.dart';
import 'package:bellboy/app/config/theme/app_colors.dart';
import 'package:bellboy/app/config/theme/app_sizes.dart';
import 'package:bellboy/app/config/theme/app_text_styles.dart';
import 'package:bellboy/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';

import '../../../common/widgets/buttons/button_primary_fill.dart';
import '../controllers/recover_account_controller.dart';

class RecoverAccountView extends GetView<RecoverAccountController> {
  const RecoverAccountView({Key? key}) : super(key: key);
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
                    SizedBox(
                      width: AppSizes.icon_size_24,
                      height: AppSizes.icon_size_24,
                      child: Stack(
                        children: [
                          Image.asset(
                            AppAssets.recoveraccount2,
                            width: AppSizes.icon_size_24,
                            height: AppSizes.icon_size_24,
                            fit: BoxFit.contain,
                          ),
                          Align(
                            alignment: Alignment.bottomRight,
                            child: CircleAvatar(
                              radius: AppSizes.radius_8 * 2.7,
                              backgroundColor: AppColors.primary,
                              child: SvgPicture.asset(
                                Assets.icons.recoverloading,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: AppSizes.mp_v_4,
                    ),
                    Text(
                      "Recover Account",
                      style: AppTextStyles.displayOneBold,
                    ),
                    SizedBox(
                      height: AppSizes.mp_v_1,
                    ),
                    Text(
                      "Your account is currently applying for withdrawal. Do you want to recover your account again?",
                      textAlign: TextAlign.center,
                      style: AppTextStyles.bodySmallBold
                          .copyWith(color: AppColors.grayDark),
                    ),
                  ],
                ),
              ),
              ButtonPrimaryFill(
                buttonSizeType: ButtonSizeType.LARGE,
                isDisabled: false,
                isterms: false,
                text: "Recover my account",
                onTap: () {},
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
