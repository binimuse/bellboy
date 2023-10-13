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
            alignment: Alignment.center,
            child: Container(
              width: AppSizes.icon_size_8 * 1.2,
              height: AppSizes.icon_size_8 * 1.2,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: getLocationPinColor(),
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: SvgPicture.asset(
              Assets.icons.delivering,
              color: AppColors.whiteOff,
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
      return AppColors.accent;
    } else if (riderLocationCheckPointStatus ==
        RiderLocationCheckPointStatus.COMPLETED) {
      return AppColors.success;
    } else if (riderLocationCheckPointStatus ==
        RiderLocationCheckPointStatus.LAST_CHECK_POINT) {
      return AppColors.danger;
    }
    return AppColors.primary;
  }

  getCompletedIcon() {
    if (riderLocationCheckPointStatus == RiderLocationCheckPointStatus.ACTIVE) {
      return const SizedBox();
    } else if (riderLocationCheckPointStatus ==
        RiderLocationCheckPointStatus.PENDING) {
      return const SizedBox();
    } else if (riderLocationCheckPointStatus ==
        RiderLocationCheckPointStatus.COMPLETED) {
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
