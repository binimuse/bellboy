import 'package:bellboy/app/common/widgets/layer_data/models/enums.dart';
import 'package:bellboy/app/config/theme/app_colors.dart';
import 'package:bellboy/app/config/theme/app_sizes.dart';
import 'package:bellboy/app/config/theme/app_text_styles.dart';
import 'package:bellboy/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RiderCheckPointMarker extends StatelessWidget {
  const RiderCheckPointMarker({
    super.key,
    required this.riderLocationCheckPointStatus,
    required this.checkPointNumber,
  });

  final RiderLocationCheckPointStatus riderLocationCheckPointStatus;
  final String checkPointNumber;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppSizes.icon_size_12 * 1.2,
      width: AppSizes.icon_size_12 * 1.2,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: SvgPicture.asset(
              Assets.icons.location,
              fit: BoxFit.cover,
              height: AppSizes.icon_size_12 * 1.2,
              width: AppSizes.icon_size_12 * 1.2,
              color: getLocationPinColor(),
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              width: AppSizes.icon_size_6 * 1.4,
              height: AppSizes.icon_size_6 * 1.4,
              margin: EdgeInsets.only(top: AppSizes.mp_v_1 * 0.5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100.0),
                color: AppColors.whiteOff,
              ),
              child: Center(
                child: riderLocationCheckPointStatus ==
                        RiderLocationCheckPointStatus.LAST_CHECK_POINT
                    ? SvgPicture.asset(
                        Assets.icons.flagrounded,
                        color: AppColors.black,
                      )
                    : Text(
                        checkPointNumber,
                        style: AppTextStyles.bodyLargeBold.copyWith(
                          color: getCenterTextColor(),
                        ),
                      ),
              ),
            ),
          ),
          getCompletedIcon(),
        ],
      ),
    );
  }

  getLocationPinColor() {
    if (riderLocationCheckPointStatus == RiderLocationCheckPointStatus.ACTIVE) {
      return AppColors.primary;
    } else if (riderLocationCheckPointStatus ==
        RiderLocationCheckPointStatus.PENDING) {
      return AppColors.black;
    } else if (riderLocationCheckPointStatus ==
        RiderLocationCheckPointStatus.COMPLETED) {
      return AppColors.grayLight;
    } else if (riderLocationCheckPointStatus ==
        RiderLocationCheckPointStatus.LAST_CHECK_POINT) {
      return AppColors.black;
    }
  }

  getCenterTextColor() {
    if (riderLocationCheckPointStatus == RiderLocationCheckPointStatus.ACTIVE) {
      return AppColors.primary;
    } else if (riderLocationCheckPointStatus ==
        RiderLocationCheckPointStatus.PENDING) {
      return AppColors.black;
    } else if (riderLocationCheckPointStatus ==
        RiderLocationCheckPointStatus.COMPLETED) {
      return AppColors.grayLight;
    } else if (riderLocationCheckPointStatus ==
        RiderLocationCheckPointStatus.LAST_CHECK_POINT) {
      return AppColors.grayLight;
    }
    return AppColors.primary;
  }

  getCompletedIcon() {
    if (riderLocationCheckPointStatus == RiderLocationCheckPointStatus.ACTIVE) {
      return SizedBox();
    } else if (riderLocationCheckPointStatus ==
        RiderLocationCheckPointStatus.PENDING) {
      return SizedBox();
    } else if (riderLocationCheckPointStatus ==
        RiderLocationCheckPointStatus.COMPLETED) {
      return Positioned(
        right: 0,
        top: 0,
        child: SizedBox(
          width: AppSizes.icon_size_6,
          height: AppSizes.icon_size_6,
          child: Stack(
            children: [
              Align(
                alignment: Alignment.center,
                child: CircleAvatar(
                  radius: AppSizes.icon_size_2,
                  backgroundColor: AppColors.whiteOff,
                ),
              ),
              Icon(
                Icons.check_circle,
                color: AppColors.success,
                size: AppSizes.icon_size_6,
              ),
            ],
          ),
        ),
      );
    }
    return SizedBox();
  }
}
