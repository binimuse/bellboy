// ignore_for_file: invalid_use_of_protected_member, must_be_immutable

import 'package:bellboy/app/common/widgets/app_toasts.dart';
import 'package:bellboy/app/common/widgets/buttons/button_primary_fill.dart';
import 'package:bellboy/app/config/theme/app_colors.dart';
import 'package:bellboy/app/config/theme/app_text_styles.dart';
import 'package:bellboy/app/modules/quiz/views/widgets/pass_the_quiz.dart';
import 'package:bellboy/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../controllers/quiz_controller.dart';
import 'failed_all_the_quiz.dart';
import 'failed_the_quiz.dart';

class QuationsView extends GetView<QuizController> {
  QuationsView({Key? key}) : super(key: key);
  @override
  QuizController controller = Get.put(QuizController());
  @override
  Widget build(BuildContext context) {
    return Obx(() => controller.isquestionsFeched.isTrue
        ? Scaffold(
            appBar: getAppBar(),
            body: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        LinearProgressIndicator(
                          color: AppColors.primary,
                          backgroundColor: AppColors.grayLighter,
                          value: controller.selectedAnswerIndex.value == -1
                              ? controller.currentIndex.value /
                                  controller.questions.value.length
                              : (controller.currentIndex.value + 1) /
                                  controller.questions.value.length,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              getNumber(),
                              getQuestion(),
                              getimage(),
                              SizedBox(height: 1.h),
                              getAnswerOptions(),
                              SizedBox(height: 1.h),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                buildButton(),
              ],
            ),
          )
        : Container(
            color: Colors.white,
            child: Center(
              child: CircularProgressIndicator(
                color: AppColors.primary,
              ),
            ),
          ));
  }

  getAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 1,
      leading: IconButton(
        icon: SvgPicture.asset(Assets.icons.arrowleft),
        onPressed: () {
          Get.back();
        },
      ),
      title: Text(
        'Rider Quiz',
        style: AppTextStyles.titleBold,
      ),
      actions: [
        Align(
          alignment: Alignment.center,
          child: Padding(
            padding: const EdgeInsets.only(top: 0.0, right: 16.0),
            child: Text(
              ' ${controller.questionNumber}/${controller.questions.value.length}',
              style: AppTextStyles.bodySmallBold
                  .copyWith(color: AppColors.grayDefault),
            ),
          ),
        ),
      ],
      centerTitle: true,
    );
  }

  Widget getimage() {
    final currentIndex = controller.currentIndex.value;
    if (currentIndex >= 0 && currentIndex < controller.questions.length) {
      final question = controller.questions[currentIndex];
      final imageUrl = question.image;
      if (imageUrl.isNotEmpty) {
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
              imageUrl: imageUrl,
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
    }
    return const SizedBox();
  }

  Widget getAnswerOptions() {
    return Obx(() {
      final currentIndex = controller.currentIndex.value;
      final questions = controller.questions.value;

      if (currentIndex >= 0 && currentIndex < questions.length) {
        final selectedIndex = controller.selectedAnswerIndex.value;
        final answers = questions[currentIndex].answers;

        return ListView.builder(
          shrinkWrap: true,
          itemCount: answers.length,
          itemBuilder: (context, index) {
            final answer = answers[index];

            return InkWell(
              onTap: () async {
                controller.selectedAnswerIndex.value = index;
                await Future.delayed(const Duration(milliseconds: 400));
                controller.answerQuestion(index);
              },
              child: Container(
                margin: const EdgeInsets.symmetric(vertical: 8.0),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: selectedIndex == index
                        ? AppColors.primary.withOpacity(1.0)
                        : Colors.black.withOpacity(0.1),
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.circular(8.0),
                  color: selectedIndex == index
                      ? AppColors.primary.withOpacity(0.2)
                      : Colors.transparent,
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 12.0,
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        answer,
                        style: AppTextStyles.bodyLargeBold.copyWith(
                          color: AppColors.black,
                        ),
                      ),
                    ),
                    Container(
                      width: 24,
                      height: 24,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: selectedIndex == index
                              ? Colors.transparent
                              : AppColors.grayDark.withOpacity(0.4),
                          width: 1.0,
                        ),
                        color: selectedIndex == index
                            ? AppColors.primary
                            : Colors.transparent,
                      ),
                      child: selectedIndex == index
                          ? Center(
                              child: Container(
                                width: 10,
                                height: 10,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.white,
                                ),
                              ),
                            )
                          : null,
                    ),
                  ],
                ),
              ),
            );
          },
        );
      } else {
        return const SizedBox();
      }
    });
  }

  getNumber() {
    return Text(
      'Q${controller.questionNumber}',
      style: AppTextStyles.titleBold.copyWith(color: AppColors.primary),
    );
  }

  Widget getQuestion() {
    final currentIndex = controller.currentIndex.value;
    if (currentIndex >= 0 && currentIndex < controller.questions.length) {
      final question = controller.questions[currentIndex].question;
      return Text(
        question,
        style: AppTextStyles.titleBold.copyWith(color: AppColors.black),
      );
    } else {
      return const SizedBox();
    }
  }

  buildButton() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ButtonPrimaryFill(
        isterms: false,
        buttonSizeType: ButtonSizeType.LARGE,
        isDisabled: controller.selectedAnswerIndex.value == -1,
        text: () {
          final currentQuestionIndex = controller.questionNumber;
          final totalQuestions = controller.questions.length;

          if (currentQuestionIndex < totalQuestions) {
            return 'Next';
          } else {
            return 'Quiz complete';
          }
        }(),
        onTap: () {
          if (controller.selectedAnswerIndex.value == -1) {
            AppToasts.showError("select an answer before proceeding   ");
          } else {
            // An answer has been selected, proceed to the next question.
            controller.answerQuestion(controller.selectedAnswerIndex.value);
            final currentQuestionIndex = controller.questionNumber;
            final totalQuestions = controller.questions.length;

            if (currentQuestionIndex < totalQuestions) {
              controller.nextQuestion();
              controller.questionNumber++;
            } else {
              // Last question, quiz complete
              // Perform any necessary actions or navigate to a different screen
              Get.to(const Passthequiz());
                      }
          }
        },
      ),
    );
  }
}
