/// This file contains the implementation of the PreWorkChecklistView widget.
/// This widget displays a checklist for the user to complete before starting work.
/// The user can select their vehicle type and additional cards will be displayed based on their selection.
/// The widget also contains action buttons for the user to proceed with their work.
// ignore_for_file: unrelated_type_equality_checks

import 'package:bellboy/app/common/widgets/appbar/appbar.dart';
import 'package:bellboy/app/common/widgets/appdrawer/appdrawer.dart';
import 'package:bellboy/app/common/widgets/buttons/custom_normal_button.dart';
import 'package:bellboy/app/common/widgets/forms/check_box.dart';
import 'package:bellboy/app/config/theme/app_colors.dart';
import 'package:bellboy/app/config/theme/app_sizes.dart';
import 'package:bellboy/app/config/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../find_password/views/widget/suspended.dart';
import '../controllers/pre_work_checklist_controller.dart';
import '../model/confirmation_model.dart';
import '../model/vehcle_type.dart';
import 'widget/other_transportation.dart';

class PreWorkChecklistView extends GetView<PreWorkChecklistController> {
  const PreWorkChecklistView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: controller.keyforall,
      appBar: CustomAppBars(
        onPressed: () {
          controller.keyforall.currentState!.openDrawer();
        },
        isOrderpage: false,
        onMapIconPressed: () {},
      ),
      drawer: const AppDrawer(),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
              height: 75.h,
              child: SingleChildScrollView(
                child: Obx(
                  () => Column(
                    children: [
                      buildVehicleTypeList(),
                      if (controller.isVehicleTypeselelctedcar.value)
                        buildAdditionalCard("car"),
                      if (controller.isVehicleTypeselelctedmoto.value ||
                          controller.isVehicleTypeselelctedbic.value)
                        buildAdditionalCard("motorcycle"),
                    ],
                  ),
                ),
              )),
          buildActionButtons(),
        ],
      ),
    );
  }

  buildActionButtons() {
    return Padding(
      padding: EdgeInsets.all(16.sp),
      child: Column(
        children: [
          Obx(() => CustomNormalButton(
                text: 'Get on',
                textStyle: AppTextStyles.bodyLargeBold.copyWith(
                  color: AppColors.whiteOff,
                ),
                textcolor: AppColors.whiteOff,
                buttoncolor: controller.areAllTermsSelected()
                    ? AppColors.primary
                    : AppColors.grayLight,
                borderRadius: AppSizes.radius_8,
                padding: EdgeInsets.symmetric(
                  vertical: AppSizes.mp_v_2,
                  horizontal: AppSizes.mp_w_6,
                ),
                onPressed: () {
                  //dilaog
                  // Get.dialog(
                  //   const Dialogexpiration(),
                  //   barrierDismissible: true,
                  // );

                  //dilaog2
                  Get.dialog(
                    const Dialogothertransportation(),
                    barrierDismissible: true,
                  );
                },
              )),
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
          GestureDetector(
              onTap: () {
                Get.to(
                  SuspendedFrame(),
                );
              },
              child: Text('How do you work today? ',
                  style: AppTextStyles.headlineBold)),
          SizedBox(height: 2.h),
          FutureBuilder<List<VehicleType>>(
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
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: vehicleTypes.length,
                    itemBuilder: (context, index) {
                      final vehicleType = vehicleTypes[index];

                      return InkWell(
                        onTap: () {
                          controller.selectedIndex.value = index;
                          if (index == 0) {
                            controller.isVehicleTypeselelctedcar(true);
                            controller.isVehicleTypeselelctedmoto(false);
                            controller.isVehicleTypeselelctedbic(false);
                          } else if (index == 1) {
                            controller.isVehicleTypeselelctedmoto(true);
                            controller.isVehicleTypeselelctedcar(false);
                            controller.isVehicleTypeselelctedbic(false);
                          } else {
                            controller.isVehicleTypeselelctedbic(true);
                            controller.isVehicleTypeselelctedmoto(false);
                            controller.isVehicleTypeselelctedcar(false);
                          }
                        },
                        child: Container(
                          margin: const EdgeInsets.symmetric(vertical: 8.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12.0),
                            border: Border.all(
                              color: controller.selectedIndex.value == index
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
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.start,
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
                                          style: AppTextStyles.bodyLargeBold
                                              .copyWith(
                                            color: AppColors.black,
                                          ),
                                        ),
                                        Text(
                                          vehicleType.date,
                                          style: AppTextStyles.captionRegular
                                              .copyWith(
                                            color: AppColors.grayDark,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  width: 24,
                                  height: 24,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: controller.selectedIndex.value ==
                                              index
                                          ? Colors.transparent
                                          : AppColors.grayDark.withOpacity(0.4),
                                      width: 1.0,
                                    ),
                                    color:
                                        controller.selectedIndex.value == index
                                            ? AppColors.primary
                                            : Colors.transparent,
                                  ),
                                  child: controller.selectedIndex.value == index
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
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                });
              } else {
                return Container();
              }
            },
          ),
        ],
      ),
    );
  }

  Widget buildAdditionalCard(String vehicleType) {
    return SizedBox(
      height: 60.h,
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Did you check the confirmation before going to work?',
              style: AppTextStyles.headlineBold,
            ),
            SizedBox(height: 2.h),
            Expanded(
              // Move the Expanded widget here
              child: FutureBuilder<List<ConfirmationModel>>(
                future: vehicleType == 'car'
                    ? controller.fetchConfirmationModelCar()
                    : controller.fetchConfirmationModelMotorcycle(),
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
                    final List<ConfirmationModel> confirmationList =
                        snapshot.data!;

                    return ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: confirmationList.length,
                      itemBuilder: (context, index) {
                        final confirmation = confirmationList[index];

                        return Obx(() => Container(
                              margin: const EdgeInsets.symmetric(vertical: 8.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12.0),
                                border: Border.all(
                                  color: AppColors.grayLight.withOpacity(0.9),
                                  width: 1.0,
                                ),
                                color: !controller.isTermChecked(index)
                                    ? Colors.transparent
                                    : AppColors.primary.withOpacity(0.2),
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        SvgPicture.asset(
                                          confirmation.image,
                                          color:
                                              !controller.isTermChecked(index)
                                                  ? AppColors.grayLight
                                                  : AppColors.primary,
                                        ),
                                        SizedBox(width: 2.w),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              confirmation.name,
                                              style: AppTextStyles.bodySmallBold
                                                  .copyWith(
                                                color: AppColors.black,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: MyCheckBox(
                                      isInitSelected:
                                          controller.isTermChecked(index),
                                      checkBoxSize: CheckBoxSize.MEDIUM,
                                      onChanged: (isChecked) {
                                        controller.toggleTerm(index);
                                      },
                                      text: "",
                                    ),
                                  )
                                ],
                              ),
                            ));
                      },
                    );
                  } else {
                    return Container();
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
