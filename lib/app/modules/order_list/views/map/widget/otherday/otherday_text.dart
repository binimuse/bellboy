import 'package:bellboy/app/config/theme/app_colors.dart';
import 'package:bellboy/app/config/theme/app_sizes.dart';
import 'package:bellboy/app/config/theme/app_text_styles.dart';
import 'package:bellboy/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OtherdayText extends StatelessWidget {
  const OtherdayText({
    Key? key,
    required this.extraMoney,
    required this.isAgeLimit,
  }) : super(key: key);

  final bool extraMoney;
  final bool isAgeLimit;

  @override
  Widget build(BuildContext context) {
    return Stack(
      //fit: StackFit.expand,
      alignment: Alignment.bottomCenter,
      children: [
        Container(
          width: isAgeLimit ? AppSizes.icon_size_32 : AppSizes.icon_size_30,
          height: isAgeLimit
              ? AppSizes.icon_size_14 * 1.2
              : AppSizes.icon_size_14 * 1.2,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(10),
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
              bottomRight: Radius.circular(10),
            ),
            color: AppColors.accentLight,
            border: Border.all(
              color: AppColors.accentLighter,
              width: 2.0,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Text(
                  "~ PM 12:30",
                  style: AppTextStyles.captionBold.copyWith(
                    fontSize: AppSizes.font_12,
                    color: AppColors.whiteOff,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "22/03",
                    style: AppTextStyles.captionRegular.copyWith(
                      fontSize: AppSizes.font_10,
                      color: AppColors.whiteOff,
                    ),
                  ),
                  SizedBox(width: isAgeLimit ? 5.0 : 0.0),
                  isAgeLimit
                      ? SvgPicture.asset(
                          Assets.icons.eighteenplus2,
                          color: AppColors.whiteOff,
                        )
                      : const SizedBox(),
                ],
              ),
            ],
          ),
        ),
        Positioned(
          bottom: 0,
          child: SvgPicture.asset(
            Assets.icons.pinRotate,
            color: AppColors.accentDark,
          ),
        ),
        extraMoney ? buildDollarSign() : const SizedBox(),
      ],
    );
  }

  Widget buildDollarSign() {
    return Positioned(
      left: -1,
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
                backgroundColor: AppColors.blackLight.withOpacity(0.8),
              ),
            ),
            SvgPicture.asset(
              Assets.icons.dollar,
              color: AppColors.whiteOff,
            ),
          ],
        ),
      ),
    );
  }
}
