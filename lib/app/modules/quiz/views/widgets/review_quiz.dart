import 'package:bellboy/app/common/widgets/buttons/button_gray_scale_outline.dart';
import 'package:bellboy/app/common/widgets/buttons/button_primary_fill.dart';
import 'package:bellboy/app/common/widgets/buttons/custom_normal_button.dart';
import 'package:bellboy/app/config/theme/app_colors.dart';
import 'package:bellboy/app/config/theme/app_sizes.dart';
import 'package:bellboy/app/config/theme/app_text_styles.dart';
import 'package:bellboy/gen/assets.gen.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../controllers/quiz_controller.dart';

class Reviewthequiz extends GetView<QuizController> {
  const Reviewthequiz({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(),
      backgroundColor: AppColors.white70.withOpacity(0.9),
      body: ListView.builder(
        itemCount: cardData.length,
        itemBuilder: (context, index) {
          final card = cardData[index];
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: CardWidget(
              title: card.title,
              image: card.image,
              text: card.text,
            ),
          );
        },
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: CustomNormalButton(
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
            // Handle button press
            // Get.to(const Passthequiz());
          },
        ),
      ),
    );
  }
}

getAppBar() {
  return AppBar(
    backgroundColor: Colors.white,
    elevation: 1,
    leading: IconButton(
      icon: SvgPicture.asset(Assets.icons.close),
      onPressed: () {
        Get.back();
      },
    ),
    title: Text(
      'Check the problem',
      style: AppTextStyles.titleBold,
    ),
    centerTitle: true,
  );
}

class CardWidget extends StatelessWidget {
  final String title;
  final String image;
  final String text;

  const CardWidget({
    required this.title,
    required this.image,
    required this.text,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            getNumber(),
            SizedBox(height: 2.h),
            getQuestion(),
            SizedBox(height: 2.h),
            getImage(),
            SizedBox(height: 2.h),
            getAnswer(),
            SizedBox(height: 2.h),
            getAnswer2(),
          ],
        ),
      ),
    );
  }

  getNumber() {
    return Text(
      'Q${1}',
      style: AppTextStyles.titleBold.copyWith(color: AppColors.success),
    );
  }

  Widget getQuestion() {
    return Text("Choose the correct one from the following.",
        style: AppTextStyles.bodyLargeBold
            .copyWith(fontSize: AppSizes.font_16, color: AppColors.grayDark));
  }

  getImage() {
    return Container(
      width: double.infinity,
      height: 200, // Adjust the height as needed
      decoration: BoxDecoration(
        color: AppColors.black,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withOpacity(0.2),
            spreadRadius: 4,
            blurRadius: 12,
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: CachedNetworkImage(
          width: double.infinity,
          height: double.infinity,
          imageUrl: image,
          imageBuilder: (context, imageProvider) => Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: imageProvider,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ),
    );
  }

  getAnswer() {
    return Container(
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: AppColors.grayLighter.withOpacity(0.3), // Gray background color
        borderRadius: BorderRadius.circular(8.0), // Border radius
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Your answer",
            style: AppTextStyles.captionRegular,
          ),
          Text("Answer 1", style: AppTextStyles.bodySmallBold),
        ],
      ),
    );
  }

  getAnswer2() {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.successLight,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: IntrinsicHeight(
        child: Row(
          children: [
            IconButton(
              icon: SvgPicture.asset(
                Assets.icons.doneRound,
                color: AppColors.successDark,
              ),
              onPressed: () {
                Get.back();
              },
            ),
            SizedBox(width: 2.0),
            Text(
              "That's right.",
              style: AppTextStyles.bodySmallBold.copyWith(
                color: AppColors.successDark,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CardData {
  final String title;
  final String image;
  final String text;

  CardData({
    required this.title,
    required this.image,
    required this.text,
  });
}

final List<CardData> cardData = [
  CardData(
    title: "Card 1",
    image:
        "https://cdn.pixabay.com/photo/2014/10/10/21/58/earth-483978_1280.png",
    text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
  ),
  CardData(
    title: "Card 2",
    image: "assets/images/image2.png",
    text: "Nulla facilisi. Sed euismod, turpis quis tincidunt ultrices.",
  ),
  // Add more card data as needed
];
