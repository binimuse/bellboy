import 'package:bellboy/app/common/widgets/buttons/button_gray_scale_outline.dart';

import 'package:bellboy/app/config/theme/app_assets.dart';
import 'package:bellboy/app/config/theme/app_colors.dart';
import 'package:bellboy/app/config/theme/app_sizes.dart';
import 'package:bellboy/app/config/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../../common/widgets/buttons/button_primary_fill.dart';
import '../../controllers/quiz_controller.dart';
import 'review_quiz.dart';

class Passthequiz extends GetView<QuizController> {
  const Passthequiz({Key? key}) : super(key: key);

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
            child: SingleChildScrollView(
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

                  const SizedBox(
                    height: 20, // Adjust this value as needed
                  ),

                  ////BUILD ACTION BUTTONS
                  buildActionButtons2(),

                  const SizedBox(
                    height: 20, // Adjust this value as needed
                  ),
                ],
              ),
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
            child: Text("Congratulations, Rider!",
                textAlign: TextAlign.center,
                style: AppTextStyles.displayTwoBold
                    .copyWith(fontSize: AppSizes.font_24)),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
                "You just passed our verification. You can use the app after the administrator's authentication. Just wait for reference.",
                textAlign: TextAlign.center,
                style: AppTextStyles.bodyLargeRegular
                    .copyWith(fontSize: AppSizes.font_16)),
          ),
        ],
      ),
    );
  }

  buildActionButtons2() {
    return Padding(
      padding: EdgeInsets.all(12.sp),
      child: Column(
        children: [
          ButtonGrayScaleOutline(
            text: 'Check the problem',
            buttonSizeType: ButtonSizeType.SMALL,
            onTap: () {
              Get.to(const Reviewthequiz());
            },
            isDisabled: false,
          ),
        ],
      ),
    );
  }

  buildScore() {
    return Center(
      child: Text("80",
          textAlign: TextAlign.center,
          style: AppTextStyles.bodyLargeRegular
              .copyWith(fontSize: AppSizes.font_64, color: AppColors.primary)),
    );
  }

  buildOverallscore() {
    return Align(
      alignment: Alignment.center,
      child: ClipRRect(
        borderRadius:
            BorderRadius.circular(60.0), // Adjust the radius as needed
        child: Container(
          color: AppColors.primary.withOpacity(0.2),
          padding: const EdgeInsets.all(8.0),
          child: Text(
            '  ${controller.questionNumber}/${controller.questions.length}  ',
            style:
                AppTextStyles.bodySmallBold.copyWith(color: AppColors.primary),
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
        'assets/images/pass.png',
        fit: BoxFit.contain,
      ),
    );
  }
}
