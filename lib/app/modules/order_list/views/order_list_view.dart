import 'package:bellboy/app/config/theme/app_assets.dart';
import 'package:bellboy/app/config/theme/app_colors.dart';
import 'package:bellboy/app/config/theme/app_sizes.dart';
import 'package:bellboy/app/config/theme/app_text_styles.dart';
import 'package:bellboy/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:bellboy/app/common/widgets/appbar/appbar.dart';
import 'package:bellboy/app/common/widgets/appdrawer/appdrawer.dart';
import 'package:sizer/sizer.dart';

import '../controllers/order_list_controller.dart';

class OrderListView extends GetView<OrderListController> {
  const OrderListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: controller.keyforall,
      appBar: CustomAppBars(
        onPressed: () {
          controller.keyforall.currentState!.openDrawer();
        },
        isOrderpage: true,
      ),
      drawer: const AppDrawer(),
      body: buildTab(),
    );
  }

  Widget buildTab() {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: AppColors.grayLighter.withOpacity(0.4),
        appBar: AppBar(
          elevation: 1,
          toolbarHeight: 20, // Adjust the height of the AppBar
          backgroundColor:
              AppColors.whiteOff, // Change the background color of the AppBar
          bottom: TabBar(
            labelStyle: AppTextStyles.bodySmallBold,
            indicatorColor: AppColors.primary,
            unselectedLabelColor:
                AppColors.grayDefault, // Set the color for unselected tabs
            labelColor: AppColors.black, // Set the color for selected tab
            tabs: [
              Tab(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Order'),
                    const SizedBox(width: 8),
                    Container(
                      height: AppSizes.icon_size_7,
                      width: AppSizes.icon_size_6,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                            50.0), // Adjust the radius as needed
                        color: AppColors.danger,
                      ),
                      child: Text(
                        '1',
                        style: AppTextStyles.captionBold.copyWith(
                            fontSize: AppSizes.font_10,
                            color: AppColors.whiteOff),
                      ),
                    ),
                  ],
                ),
              ),
              const Tab(text: 'Matched'),
              const Tab(text: 'Delivering'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            buildTodayOrder(),
            //  buildNoorder(),
            const Icon(Icons.directions_transit),
            const Icon(Icons.directions_bike),
          ],
        ),
      ),
    );
  }

  buildTodayOrder() {
    return SingleChildScrollView(
      child: Container(
        margin: const EdgeInsets.all(2.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 1.h),
            buildDivider(true),
            SizedBox(height: 1.h),
            buildOrderList("today"),
            buildNormalDivider(),
            buildOrderList("asap"),

            //other day
            SizedBox(height: 2.h),
            buildDivider(false),
            SizedBox(height: 2.h),
            buildOrderList("otherday"),
            //other day
            SizedBox(height: 2.h),
            buildDivider(false),
            SizedBox(height: 2.h),
            buildOrderList("otherday"),
          ],
        ),
      ),
    );
  }

  buildNormalDivider() {
    return SizedBox(
      width: 90.w,
      child: Divider(
        color: AppColors.grayLighter,
        thickness: 1,
        height: 1,
      ),
    );
  }

  Widget buildDivider(bool isToday) {
    return Padding(
      padding: const EdgeInsets.only(left: 12.0, right: 12),
      child: SizedBox(
        width: 100.w,
        child: Row(
          children: [
            Expanded(
              child: Divider(
                color: AppColors.grayLight,
                thickness: 1,
                height: 1,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: Container(
                height: AppSizes.icon_size_7,
                width: AppSizes.icon_size_20,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                      50.0), // Adjust the radius as needed
                  color: isToday ? AppColors.primary : AppColors.accent,
                ),
                child: Text(
                  isToday ? 'Today' : "Other day",
                  style: AppTextStyles.captionBold.copyWith(
                      fontSize: AppSizes.font_10, color: AppColors.whiteOff),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: Text(
                '(Sat) 05/02',
                style: AppTextStyles.bodySmallBold.copyWith(
                    fontSize: AppSizes.font_14, color: AppColors.grayDefault),
              ),
            ),
            Expanded(
              child: Divider(
                color: AppColors.grayLight,
                thickness: 1,
                height: 1,
              ),
            ),
          ],
        ),
      ),
    );
  }

  buildOrderList(String text) {
    return Container(
      color: AppColors.whiteOff,
      child: Padding(
        padding: const EdgeInsets.only(left: 16.0),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: AppSizes.icon_size_10,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(10),
                            bottomRight: Radius.circular(
                                10)), // Adjust the radius as needed
                        color: text.contains("today")
                            ? AppColors.success
                            : text.contains("asap")
                                ? AppColors.danger
                                : AppColors.accentLight,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          text.contains("today")
                              ? "Today"
                              : text.contains("asap")
                                  ? "ASAP"
                                  : "~ PM 12:30",
                          style: AppTextStyles.captionBold.copyWith(
                              fontSize: AppSizes.font_12,
                              color: AppColors.whiteOff),
                        ),
                      ),
                    ),
                    SizedBox(height: 2.h),
                    Text(
                      '\$9.0',
                      style: AppTextStyles.captionBold.copyWith(
                          fontSize: AppSizes.font_14, color: AppColors.black),
                    ),
                    Text(
                      '0.8 km',
                      style: AppTextStyles.bodySmallBold.copyWith(
                        fontSize: AppSizes.font_14,
                        color: text.contains("today")
                            ? AppColors.success
                            : text.contains("asap")
                                ? AppColors.danger
                                : AppColors.accentLight,
                      ),
                    ),
                  ],
                ),
                //
                SizedBox(width: 15.w),
                Padding(
                  padding: const EdgeInsets.only(top: 18.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      text.contains("asap")
                          ? const SizedBox()
                          : Container(
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                    20.0), // Adjust the radius as needed
                                color: AppColors.grayLighter.withOpacity(0.2),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  'No. Stops : 25',
                                  style: AppTextStyles.captionBold.copyWith(
                                      fontSize: AppSizes.font_14,
                                      color: AppColors.grayDark),
                                ),
                              ),
                            ),
                      Row(
                        children: [
                          Column(
                            children: [
                              text.contains("today")
                                  ? SvgPicture.asset(
                                      Assets.icons.listcircle,
                                      fit: BoxFit.cover,
                                    )
                                  : text.contains("asap")
                                      ? SvgPicture.asset(
                                          Assets.icons.listcircleasap,
                                          fit: BoxFit.cover,
                                        )
                                      : SvgPicture.asset(
                                          Assets.icons.listcircleother,
                                          fit: BoxFit.cover,
                                        ),
                              SizedBox(
                                height: 5.h,
                                child: VerticalDivider(
                                  thickness: 2,
                                  color: AppColors.grayLighter,
                                  indent: 0,
                                  endIndent: 0,
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color: text.contains("today")
                                          ? AppColors.successLight
                                              .withOpacity(0.4) // shadow color
                                          : text.contains("asap")
                                              ? AppColors.danger
                                                  .withOpacity(0.4)
                                              : AppColors.accent
                                                  .withOpacity(0.4),

                                      spreadRadius: 2, // spread radius
                                      blurRadius: 5, // blur radius
                                      offset: const Offset(0,
                                          2), // offset in the form of (dx, dy)
                                    ),
                                  ],
                                ),
                                child: SvgPicture.asset(
                                  Assets.icons.listcirclesolid,
                                  color: text.contains("today")
                                      ? null
                                      : text.contains("asap")
                                          ? AppColors.danger
                                          : AppColors.accent,
                                  fit: BoxFit.cover,
                                ),
                              )
                            ],
                          ),
                          SizedBox(width: 5),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '24 O\'Connell St',
                                style: AppTextStyles.captionBold.copyWith(
                                  fontSize: AppSizes.font_14,
                                  color: AppColors.black,
                                ),
                              ),
                              SizedBox(height: 3.h),
                              Text(
                                '27 Eighth Ave',
                                style: AppTextStyles.captionBold.copyWith(
                                  fontSize: AppSizes.font_14,
                                  color: AppColors.black,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 1.h),
                      SizedBox(
                        width: 50.w,
                        child: Divider(
                          color: AppColors.backgroundDark,
                          thickness: 2,
                          height: 1,
                        ),
                      ),
                      SizedBox(height: 1.h),
                      Row(
                        children: [
                          SvgPicture.asset(
                            Assets.icons.dangerTriangle,
                            color: AppColors.warning,
                            fit: BoxFit.contain,
                          ),
                          SizedBox(width: 1.h),
                          Text(
                            '2 Items',
                            style: AppTextStyles.bodyLargeRegular.copyWith(
                                fontSize: AppSizes.font_14,
                                color: AppColors.grayDark),
                          ),
                          SizedBox(
                            height: 2.h,
                            child: VerticalDivider(
                              color: AppColors.grayLighter,
                              thickness: 2,
                            ),
                          ),
                          Text(
                            'Small Size',
                            style: AppTextStyles.bodyLargeRegular.copyWith(
                                fontSize: AppSizes.font_14,
                                color: AppColors.grayDark),
                          ),
                        ],
                      ),
                      SizedBox(height: 2.h),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  buildNoorder() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Centered Image
        Center(
          child: SizedBox(
            width: 25.w,
            height: 26.h,
            child: Image.asset(
              AppAssets.imageEmptyBox,
            ),
          ),
        ),
        // Text at the bottom
        Text(
          'Order does not exist.',
          style: AppTextStyles.titleBold
              .copyWith(fontSize: AppSizes.font_18, color: AppColors.grayDark),
        ),
        Text(
          'Hold on a minute, please.',
          style: AppTextStyles.bodySmallRegular.copyWith(
              fontSize: AppSizes.font_14, color: AppColors.grayDefault),
        ),
      ],
    );
  }
}
