import 'package:bellboy/app/common/widgets/app_icon_button.dart';
import 'package:bellboy/app/config/theme/app_colors.dart';
import 'package:bellboy/app/config/theme/app_sizes.dart';
import 'package:bellboy/app/config/theme/app_text_styles.dart';
import 'package:bellboy/gen/assets.gen.dart';
import 'package:flutter/material.dart';

class TopNavCloseText extends StatelessWidget {
  const TopNavCloseText({
    Key? key,
    required this.centerTitle,
    required this.rightText,
    required this.useHomeIcon,
    this.useCloseIcon,
    this.rightTextStyle,
  }) : super(key: key);

  final String centerTitle;
  final String rightText;
  final bool useHomeIcon;
  final bool? useCloseIcon;
  final TextStyle? rightTextStyle;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: AppSizes.mp_w_4,
      ),
      height: AppSizes.mp_v_6,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                useCloseIcon != null
                    ? !useCloseIcon!
                        ? const SizedBox()
                        : AppSvgButton(
                            imagePath: Assets.icons.close,
                            onPressed: () {},
                            size: AppSizes.icon_size_8 * 0.9,
                            iconColor: AppColors.blackLight,
                          )
                    : AppSvgButton(
                        imagePath: Assets.icons.close,
                        onPressed: () {},
                        size: AppSizes.icon_size_8 * 0.9,
                        iconColor: AppColors.blackLight,
                      ),
                SizedBox(
                  width: AppSizes.mp_w_1,
                ),
                useHomeIcon
                    ? AppSvgButton(
                        imagePath: Assets.icons.home,
                        onPressed: () {},
                        size: AppSizes.icon_size_8 * 0.9,
                        iconColor: AppColors.blackLight,
                      )
                    : const SizedBox(),
              ],
            ),
          ),
          Center(
            child: Text(
              centerTitle,
              style: AppTextStyles.titleBold,
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: MaterialButton(
              onPressed: () {},
              child: Text(
                rightText,
                style: isRightTextStyle()
                    ? rightTextStyle!
                    : AppTextStyles.titleBold
                        .copyWith(color: AppColors.primary),
              ),
            ),
          ),
        ],
      ),
    );
  }

  isRightTextStyle() {
    if (rightTextStyle != null) {
      return true;
    }
    return false;
  }
}
