import 'package:bellboy/app/config/theme/app_colors.dart';
import 'package:bellboy/app/config/theme/app_sizes.dart';
import 'package:bellboy/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../../common/widgets/custom_normal_button.dart';
import '../../../config/theme/app_assets.dart';
import '../../../config/theme/app_theme.dart';
import '../controllers/on_bording_controller.dart';

class OnBordingView extends GetView<OnBordingController> {
  const OnBordingView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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

                SizedBox(
                  height: 50.h,
                  child: PageView(
                    controller: controller.pageController,
                    onPageChanged: (index) {
                      controller.currentSlide.value = index;

                      controller.onChangedFunction(index);
                    },
                    pageSnapping: true,
                    children: <Widget>[
                      sliderItem(imaUrl: AppAssets.onbording1),
                      sliderItem(imaUrl: AppAssets.onbording2),
                    ],
                  ),
                ),

                SmoothPageIndicator(
                  controller: controller.pageController, // PageController
                  count: 2,
                  effect: WormEffect(
                      activeDotColor: AppColors.primary,
                      dotColor: AppColors.grayLighter,
                      dotHeight: 1.9.w,
                      dotWidth: 2.0.w), // your preferred effect
                  onDotClicked: (index) {},
                ),

                const Expanded(
                  child: SizedBox(),
                ),

                ///BUILD TITLE AND SUB TITLE
                buildTitlAndSubTitle(context),

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
    return Obx(() => Padding(
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
                child: Text(
                  controller.titles[controller.currentSlide.value],
                  textAlign: TextAlign.start,
                  style: CustomTextStyles.bodyLarge.copyWith(
                    color: AppColors.black,
                    letterSpacing: 0.1,
                    fontSize: AppSizes.font_28,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
            ],
          ),
        ));
  }

  buildActionButtons() {
    return Padding(
      padding: EdgeInsets.all(12.sp),
      child: Column(
        children: [
          CustomNormalButton(
            text: 'Log in',
            textcolor: AppColors.whiteOff,
            buttoncolor: AppColors.primary,
            borderRadius: AppSizes.radius_8,
            padding: EdgeInsets.symmetric(
              vertical: AppSizes.mp_v_2,
              horizontal: AppSizes.mp_w_6,
            ),
            onPressed: () {
              Get.toNamed(Routes.LOGIN);
            },
          ),
          SizedBox(
            height: AppSizes.mp_v_2,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "New to Bellboy? Sign up!",
              textAlign: TextAlign.start,
              style: CustomTextStyles.bodyMedium.copyWith(
                color: AppColors.grayDefault,
                letterSpacing: 0.1,
                fontSize: AppSizes.font_16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
