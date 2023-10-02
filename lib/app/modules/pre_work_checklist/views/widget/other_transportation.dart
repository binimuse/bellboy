import 'package:bellboy/app/common/widgets/buttons/button_primary_fill.dart';
import 'package:bellboy/app/common/widgets/dialogs/dialog_center_common_widget.dart';
import 'package:bellboy/app/config/theme/app_colors.dart';
import 'package:bellboy/app/config/theme/app_sizes.dart';
import 'package:bellboy/app/config/theme/app_text_styles.dart';
import 'package:bellboy/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

class Dialogothertransportation extends StatelessWidget {
  const Dialogothertransportation({super.key});

  @override
  Widget build(BuildContext context) {
    return DialogCenterCommonWidget(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: AppSizes.mp_w_6),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            SizedBox(
              height: AppSizes.mp_v_4,
            ),
            Text(
              'You have another transportation delivery reservation',
              textAlign: TextAlign.center,
              style: AppTextStyles.headlineBold,
            ),
            SizedBox(
              height: AppSizes.mp_v_2,
            ),
            Text(
              "If you go to work with this transportation, the reservation will be canceled automatically and you will receive a penalty.",
              textAlign: TextAlign.center,
              style: AppTextStyles.bodySmallRegular
                  .copyWith(color: AppColors.grayDefault),
            ),
            SizedBox(
              height: AppSizes.mp_v_4,
            ),
            ButtonPrimaryFill(
              isterms: false,
              buttonSizeType: ButtonSizeType.MEDIUM,
              isDisabled: false,
              text: "Confirm",
              onTap: () {
                Navigator.of(context).pop();
              },
            ),
            SizedBox(
              height: AppSizes.mp_v_2 * 1.4,
            ),
          ],
        ),
      ),
    );
  }
}
