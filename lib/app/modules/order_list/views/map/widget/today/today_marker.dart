import 'package:bellboy/app/config/theme/app_colors.dart';
import 'package:bellboy/app/config/theme/app_sizes.dart';
import 'package:bellboy/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TodayMarker extends StatelessWidget {
  const TodayMarker({
    super.key,
    required this.extraMoney,
    required this.isageLimit,
  });

  final bool extraMoney;
  final bool isageLimit;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: isageLimit
              ? AppSizes.icon_size_18 * 1.2
              : AppSizes.icon_size_10 * 1.2,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(22.0),
            color: AppColors.success,
            border: Border.all(
              color: AppColors.successLight,
              width: 2.0,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  Assets.icons.delivering,
                  color: AppColors.whiteOff,
                ),
                SizedBox(width: isageLimit ? 10.0 : 0.0),
                isageLimit
                    ? SvgPicture.asset(
                        Assets.icons.eighteenplus2,
                        color: AppColors.whiteOff,
                      )
                    : const SizedBox(),
              ],
            ),
          ),
        ),
        extraMoney ? buildDollarSign() : const SizedBox(),
      ],
    );
  }

  buildDollarSign() {
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
}
