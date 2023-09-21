// ignore_for_file: invalid_use_of_protected_member

import 'package:bellboy/app/common/widgets/custom_normal_button.dart';
import 'package:bellboy/app/config/theme/app_assets.dart';
import 'package:bellboy/app/config/theme/app_colors.dart';
import 'package:bellboy/app/config/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../../../config/theme/app_sizes.dart';
import '../controllers/quiz_controller.dart';
import 'widgets/quations.dart';

class QuizView extends GetView<QuizController> {
  const QuizView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          ///BUILD BG GRADIENT
          // buildBgGradient(),

          ///BUILD BG IMAGE
          //   buildBgImage(),

          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: AppSizes.mp_w_2,
            ),
            child: Column(
              children: [
                SizedBox(
                  height: AppSizes.mp_v_6,
                ),

                ///BUILD HEADER

                Container(
                  margin: EdgeInsets.symmetric(
                    horizontal: AppSizes.mp_w_4,
                  ),
                  child: Image.asset(
                    'assets/images/quizimage.png',
                    fit: BoxFit.contain,
                  ),
                ),

                ///BUILD TITLE AND SUB TITLE
                buildTitlAndSubTitle(context),
                const Expanded(
                  child: SizedBox(),
                ),
                ////BUILD ACTION BUTTONS
                buildActionButtons(),

                const Expanded(
                  child: SizedBox(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  buildBgGradient() {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter * 0.4,
          colors: [
            AppColors.whiteOff,
            AppColors.whiteOff,
          ],
        ),
      ),
    );
  }

  buildBgImage() {
    return Image.asset(
      AppAssets.splasehimage,
      fit: BoxFit.cover,
      width: double.infinity,
      height: double.infinity,
    );
  }

  sliderItem({required String imaUrl}) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Image.asset(
        imaUrl,
        fit: BoxFit.cover,
        height: double.infinity,
      ),
    );
  }

  buildTitlAndSubTitle(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: AppSizes.mp_v_2,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("Thank you for applying the rider",
                textAlign: TextAlign.start,
                style: AppTextStyles.displayTwoBold),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
                "Please take the quiz after understanding the rider's guide manual provided by e-mail.",
                textAlign: TextAlign.start,
                style: AppTextStyles.bodySmallRegular),
          ),
        ],
      ),
    );
  }

  buildActionButtons() {
    return Padding(
      padding: EdgeInsets.all(12.sp),
      child: Column(
        children: [
          CustomNormalButton(
            text: 'Start the quiz',
            textStyle: AppTextStyles.bodyLargeBold.copyWith(
              color: AppColors.whiteOff,
            ),
            textcolor: AppColors.whiteOff,
            buttoncolor: AppColors.primary,
            borderRadius: AppSizes.radius_8,
            padding: EdgeInsets.symmetric(
              vertical: AppSizes.mp_v_2,
              horizontal: AppSizes.mp_w_6,
            ),
            onPressed: () {
              Get.to(const QuationsView());
            },
          ),
        ],
      ),
    );
  }
}
