import 'package:bellboy/app/common/widgets/layer_data/models/enums.dart';
import 'package:bellboy/app/config/theme/app_colors.dart';
import 'package:bellboy/app/config/theme/app_sizes.dart';
import 'package:bellboy/app/config/theme/app_text_styles.dart';
import 'package:bellboy/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CheckPointMarkerText extends StatelessWidget {
  const CheckPointMarkerText({
    super.key,
    required this.locationCheckPointStatus,
    required this.checkPointNumber,
  });

  final LocationCheckPointStatus locationCheckPointStatus;
  final String checkPointNumber;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppSizes.icon_size_12 * 1.2,
      width: AppSizes.icon_size_28,
      child: Stack(
        children: [
          Container(
            height: AppSizes.icon_size_10,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight:
                      Radius.circular(10)), // Adjust the radius as needed
              color: locationCheckPointStatus == LocationCheckPointStatus.TODAY
                  ? AppColors.success
                  : locationCheckPointStatus == LocationCheckPointStatus.ASAP
                      ? AppColors.danger
                      : AppColors.accentLight,
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                locationCheckPointStatus == LocationCheckPointStatus.TODAY
                    ? "Today"
                    : locationCheckPointStatus == LocationCheckPointStatus.ASAP
                        ? "ASAP"
                        : "~ PM 12:30",
                style: AppTextStyles.captionBold.copyWith(
                    fontSize: AppSizes.font_12, color: AppColors.whiteOff),
              ),
            ),
          ),
          getCompletedIcon(),
        ],
      ),
    );
  }

  getLocationPinColor() {
    if (locationCheckPointStatus == LocationCheckPointStatus.TODAY) {
      return AppColors.primary;
    } else if (locationCheckPointStatus == LocationCheckPointStatus.PRIMARY) {
      return AppColors.accent;
    } else if (locationCheckPointStatus == LocationCheckPointStatus.OTHERDAY) {
      return AppColors.success;
    } else if (locationCheckPointStatus == LocationCheckPointStatus.ASAP) {
      return AppColors.danger;
    }
    return AppColors.primary;
  }

  getCompletedIcon() {
    if (locationCheckPointStatus == LocationCheckPointStatus.PRIMARY) {
      return const SizedBox();
    } else if (locationCheckPointStatus == LocationCheckPointStatus.OTHERDAY) {
      return const SizedBox();
    } else if (locationCheckPointStatus == LocationCheckPointStatus.ASAP) {
      return Positioned(
        left: 0,
        top: 0,
        child: SizedBox(
          width: AppSizes.icon_size_6,
          height: AppSizes.icon_size_6,
          child: Stack(
            children: [
              Align(
                alignment: Alignment.center,
                child: CircleAvatar(
                  radius: AppSizes.icon_size_6,
                  backgroundColor: AppColors.blackLight,
                ),
              ),
              SvgPicture.asset(
                Assets.icons.dollar,
                color: AppColors.whiteOff,
              )
            ],
          ),
        ),
      );
    }
    return const SizedBox();
  }
}
