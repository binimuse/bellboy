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

class Failedallthequiz extends GetView<QuizController> {
  const Failedallthequiz({Key? key}) : super(key: key);

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
            child: Text("Please try again in a month",
                textAlign: TextAlign.center,
                style: AppTextStyles.displayOneBold),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
                "Sadly, you've run out of three chances. Please study a little more and take the test again in a month",
                textAlign: TextAlign.center,
                style: AppTextStyles.bodySmallRegular),
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
            onTap: () {},
            isDisabled: false,
          ),
        ],
      ),
    );
  }

  buildScore() {
    return Center(
      child: Text("10",
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
          padding: const EdgeInsets.all(8.0),
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
