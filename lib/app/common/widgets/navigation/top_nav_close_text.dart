import 'package:bellboy/app/common/widgets/app_icon_button.dart';
import 'package:bellboy/app/config/theme/app_colors.dart';
import 'package:bellboy/app/config/theme/app_sizes.dart';
import 'package:bellboy/app/config/theme/app_text_styles.dart';
import 'package:bellboy/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class TopNavCloseText extends StatelessWidget {
  const TopNavCloseText(
      {Key? key, required this.centerTitle, required this.rightText})
      : super(key: key);

  final String centerTitle;
  final String rightText;

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
                AppSvgButton(
                  imagePath: Assets.icons.close,
                  onPressed: () {},
                  size: AppSizes.icon_size_8 * 0.9,
                ),
                SizedBox(
                  width: AppSizes.mp_w_1,
                ),
                AppSvgButton(
                  imagePath: Assets.icons.home,
                  onPressed: () {},
                  size: AppSizes.icon_size_8 * 0.9,
                ),
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
            child: Text(
              rightText,
              style: AppTextStyles.titleBold.copyWith(color: AppColors.primary),
            ),
          ),
        ],
      ),
    );
  }
}
