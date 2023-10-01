// ignore_for_file: unrelated_type_equality_checks

import 'package:bellboy/app/common/widgets/appbar/appbar.dart';
import 'package:bellboy/app/common/widgets/buttons/custom_normal_button.dart';
import 'package:bellboy/app/config/theme/app_colors.dart';
import 'package:bellboy/app/config/theme/app_sizes.dart';
import 'package:bellboy/app/config/theme/app_text_styles.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../controllers/pre_work_checklist_controller.dart';
import '../model/vehcle_type.dart';

class PreWorkChecklistView extends GetView<PreWorkChecklistController> {
  const PreWorkChecklistView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBars(),
      body: Column(
        children: [
          Expanded(
            child: buildVehicleTypeList(),
          ),

          const SizedBox(
              height: 16), // Add some spacing between the list and the button
          buildActionButtons(), // Replace `MyStaticButton` with the actual widget for your button
        ],
      ),
    );
  }

  buildActionButtons() {
    return Padding(
      padding: EdgeInsets.all(16.sp),
      child: Column(
        children: [
          CustomNormalButton(
            text: 'Get on',
            textStyle: AppTextStyles.bodyLargeBold.copyWith(
              color: AppColors.whiteOff,
            ),
            textcolor: AppColors.whiteOff,
            buttoncolor: AppColors.grayLight,
            borderRadius: AppSizes.radius_8,
            padding: EdgeInsets.symmetric(
              vertical: AppSizes.mp_v_2,
              horizontal: AppSizes.mp_w_6,
            ),
            onPressed: () {
              //Get.to(QuationsView());
            },
          ),
        ],
      ),
    );
  }

  Widget buildVehicleTypeList() {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('How do you work today? ', style: AppTextStyles.headlineBold),
          SizedBox(height: 2.h),
          Expanded(
            child: FutureBuilder<List<VehicleType>>(
              future: controller.fetchVehicleTypes(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(
                      color: AppColors.primary,
                    ),
                  );
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else if (snapshot.hasData) {
                  final vehicleTypes = snapshot.data!;

                  return Builder(builder: (context) {
                    return ListView.builder(
                      itemCount: vehicleTypes.length,
                      itemBuilder: (context, index) {
                        final vehicleType = vehicleTypes[index];

                        return InkWell(
                          onTap: () {
                            controller.selectedIndex.value = index;
                            print(index);
                          },
                          child: Obx(() => Container(
                                margin:
                                    const EdgeInsets.symmetric(vertical: 8.0),
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 16.0,
                                  vertical: 12.0,
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12.0),
                                  border: Border.all(
                                    color: controller.selectedIndex.value ==
                                            index
                                        ? AppColors.primary.withOpacity(0.9)
                                        : AppColors.grayDark.withOpacity(0.4),
                                    width: 1.0,
                                  ),
                                  color: controller.selectedIndex.value == index
                                      ? AppColors.primary.withOpacity(0.2)
                                      : Colors.transparent,
                                ),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Container(
                                            alignment: Alignment.centerRight,
                                            child: Image.asset(
                                              vehicleType.image,
                                              fit: BoxFit.contain,
                                            ),
                                          ),
                                          SizedBox(width: 1.w),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                vehicleType.name,
                                                style: AppTextStyles
                                                    .bodyLargeBold
                                                    .copyWith(
                                                  color: AppColors.black,
                                                ),
                                              ),
                                              Text(
                                                vehicleType.date,
                                                style: AppTextStyles
                                                    .captionRegular
                                                    .copyWith(
                                                  color: AppColors.grayDark,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      width: 24,
                                      height: 24,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                          color:
                                              controller.selectedIndex.value ==
                                                      index
                                                  ? Colors.transparent
                                                  : AppColors.grayDark
                                                      .withOpacity(0.4),
                                          width: 1.0,
                                        ),
                                        color: controller.selectedIndex.value ==
                                                index
                                            ? AppColors.primary
                                            : Colors.transparent,
                                      ),
                                      child: controller.selectedIndex.value ==
                                              index
                                          ? Center(
                                              child: Container(
                                                width: 10,
                                                height: 10,
                                                decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            )
                                          : null,
                                    ),
                                  ],
                                ),
                              )),
                        );
                      },
                    );
                  });
                } else {
                  return Container();
                }
              },
            ),
          ),
          controller.selectedIndex.value != -1
              ? buildAdditionalCard()
              : SizedBox(),
        ],
      ),
    );
  }

  Widget buildAdditionalCard() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      padding: const EdgeInsets.symmetric(
        horizontal: 16.0,
        vertical: 12.0,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
        border: Border.all(
          color: AppColors.primary.withOpacity(0.9),
          width: 1.0,
        ),
        color: AppColors.primary.withOpacity(0.2),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                // Container(
                //   alignment: Alignment.centerRight,
                //   child: Image.asset(
                //     "vehicleType.image",
                //     fit: BoxFit.contain,
                //   ),
                // ),
                SizedBox(width: 1.w),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "vehicleType.name",
                      style: AppTextStyles.bodyLargeBold.copyWith(
                        color: AppColors.black,
                      ),
                    ),
                    Text(
                      "vehicleType.date",
                      style: AppTextStyles.captionRegular.copyWith(
                        color: AppColors.grayDark,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            width: 24,
            height: 24,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: Colors.transparent,
                width: 1.0,
              ),
              color: AppColors.primary,
            ),
            child: Center(
              child: Container(
                width: 10,
                height: 10,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
