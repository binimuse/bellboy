import 'package:bellboy/app/common/widgets/buttons/button_gray_scale_outline.dart';
import 'package:bellboy/app/common/widgets/buttons/custom_normal_button.dart';
import 'package:bellboy/app/config/theme/app_assets.dart';
import 'package:bellboy/app/config/theme/app_colors.dart';
import 'package:bellboy/app/config/theme/app_sizes.dart';
import 'package:bellboy/app/config/theme/app_text_styles.dart';
import 'package:bellboy/app/modules/quiz/views/widgets/pass_the_quiz.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../../common/widgets/buttons/button_primary_fill.dart';
import '../../controllers/quiz_controller.dart';

class Failedthequiz extends GetView<QuizController> {
  const Failedthequiz({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: AppSizes.mp_w_2,
            ),
            child: Column(
              children: [
                SizedBox(
                  height: AppSizes.mp_v_10,
                ),

                ///BUILD HEADER
                buildScore(),

                buildOverallscore(),

                buildImage(),

                ///BUILD TITLE AND SUB TITLE
                buildTitlAndSubTitle(context),
                const Expanded(
                  child: SizedBox(),
                ),
                ////BUILD ACTION BUTTONS
                buildActionButtons2(),
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
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: AppSizes.mp_v_2,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("You need to study",
                textAlign: TextAlign.center,
                style: AppTextStyles.displayTwoBold
                    .copyWith(fontSize: AppSizes.font_24)),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
                "Unfortunately, I didn't meet the score. \nPlease try again after studying.",
                textAlign: TextAlign.center,
                style: AppTextStyles.bodySmallRegular),
          ),
        ],
      ),
    );
  }

  buildActionButtons() {
    return Padding(
      padding: EdgeInsets.all(6.sp),
      child: Column(
        children: [
          CustomNormalButton(
            text: 'Try again 1/3',
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
              Get.to(const Passthequiz());
            },
          ),
        ],
      ),
    );
  }

  buildActionButtons2() {
    return Padding(
      padding: EdgeInsets.all(6.sp),
      child: Column(
        children: [
          ButtonGrayScaleOutline(
            text: 'Check the problem',
            buttonSizeType: ButtonSizeType.SMALL,
            onTap: () {},
            isDisabled: false,
          ),
        ],
      ),
    );
  }

  buildScore() {
    return Center(
      child: Text("20",
          textAlign: TextAlign.center,
          style: AppTextStyles.bodyLargeRegular.copyWith(
              fontSize: AppSizes.font_64, color: AppColors.grayDefault)),
    );
  }

  buildOverallscore() {
    return Align(
      alignment: Alignment.center,
      child: ClipRRect(
        borderRadius:
            BorderRadius.circular(60.0), // Adjust the radius as needed
        child: Container(
          color: AppColors.grayLighter.withOpacity(0.3),
          padding: const EdgeInsets.all(7.0),
          child: Text(
            '  ${controller.questionNumber}/${controller.questions.length}  ',
            style: AppTextStyles.bodySmallBold
                .copyWith(color: AppColors.grayDefault),
          ),
        ),
      ),
    );
  }

  buildImage() {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: AppSizes.mp_w_4,
      ),
      child: Image.asset(
        'assets/images/fail.png',
        fit: BoxFit.contain,
      ),
    );
  }
}
