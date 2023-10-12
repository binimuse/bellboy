import 'dart:async';

import 'package:bellboy/app/common/widgets/app_common_annotated_region.dart';
import 'package:bellboy/app/common/widgets/buttons/button_icon_grey_scale_fill.dart';
import 'package:bellboy/app/common/widgets/buttons/button_icon_primary_fill.dart';
import 'package:bellboy/app/common/widgets/buttons/button_icon_primary_outline.dart';
import 'package:bellboy/app/common/widgets/layer_data/models/enums.dart';
import 'package:bellboy/app/common/widgets/navigation/top_nav_close_text.dart';
import 'package:bellboy/app/config/theme/app_colors.dart';
import 'package:bellboy/app/config/theme/app_sizes.dart';
import 'package:bellboy/app/config/theme/app_text_styles.dart';
import 'package:bellboy/gen/assets.gen.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter/material.dart';
import 'package:widget_to_marker/widget_to_marker.dart';

import 'rider_check_point_marker.dart';
import 'rider_current_location_marker.dart';

class ScreenRealTimeLocation extends StatefulWidget {
  const ScreenRealTimeLocation({Key? key}) : super(key: key);

  @override
  State<ScreenRealTimeLocation> createState() => _ScreenRealTimeLocationState();
}

class _ScreenRealTimeLocationState extends State<ScreenRealTimeLocation> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(9.030997, 38.748962),
    zoom: 14,
  );

  Set<Marker> markers = {};

  initMarkers() async {
    markers = {};

    markers.add(
      Marker(
        markerId: const MarkerId("1"),
        position: const LatLng(9.050959034031933, 38.744761824707986),
        icon: await const RiderCheckPointMarker(
          riderLocationCheckPointStatus:
              RiderLocationCheckPointStatus.COMPLETED,
          checkPointNumber: "1",
        ).toBitmapDescriptor(),
      ),
    );

    markers.add(
      Marker(
        markerId: const MarkerId("2"),
        position: const LatLng(9.043994490620204, 38.748997730537944),
        icon: await const RiderCheckPointMarker(
          riderLocationCheckPointStatus:
              RiderLocationCheckPointStatus.COMPLETED,
          checkPointNumber: "2",
        ).toBitmapDescriptor(),
      ),
    );

    markers.add(
      Marker(
        markerId: const MarkerId("3"),
        position: const LatLng(9.03118044977825, 38.738217553988726),
        icon: await const RiderCheckPointMarker(
          riderLocationCheckPointStatus: RiderLocationCheckPointStatus.ACTIVE,
          checkPointNumber: "3",
        ).toBitmapDescriptor(),
      ),
    );

    markers.add(
      Marker(
        markerId: const MarkerId("4"),
        position: const LatLng(9.021134765027485, 38.748725833580835),
        icon: await const RiderCheckPointMarker(
          riderLocationCheckPointStatus: RiderLocationCheckPointStatus.PENDING,
          checkPointNumber: "4",
        ).toBitmapDescriptor(),
      ),
    );

    markers.add(
      Marker(
        markerId: const MarkerId("5"),
        position: const LatLng(9.008494480553173, 38.743958724707674),
        icon: await const RiderCheckPointMarker(
          riderLocationCheckPointStatus: RiderLocationCheckPointStatus.PENDING,
          checkPointNumber: "5",
        ).toBitmapDescriptor(),
      ),
    );

    markers.add(
      Marker(
        markerId: const MarkerId("5"),
        position: const LatLng(9.035653256641449, 38.7579873382014),
        icon: await const RiderCheckPointMarker(
          riderLocationCheckPointStatus:
              RiderLocationCheckPointStatus.LAST_CHECK_POINT,
          checkPointNumber: "5",
        ).toBitmapDescriptor(),
      ),
    );

    markers.add(
      Marker(
        markerId: const MarkerId("6"),
        position: const LatLng(9.012969935596415, 38.75285307892485),
        icon: await const RiderCurrentLocationMarker().toBitmapDescriptor(),
      ),
    );

    setState(() {});
  }

  @override
  void initState() {
    initMarkers();

    Future.delayed(
      const Duration(milliseconds: 1000),
      () {
        // showDialog(
        //   context: context,
        //   builder: (context) {
        //     return const DialogDeliveryCompleted();
        //   },
        // );
      },
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AppCommonAnnotatedRegion(
      child: Scaffold(
        body: SafeArea(
          bottom: false,
          child: Column(
            children: [
              SizedBox(
                height: AppSizes.mp_v_2,
              ),
              TopNavCloseText(
                centerTitle: '',
                useHomeIcon: true,
                useCloseIcon: false,
                rightText: 'Details',
                rightTextStyle: AppTextStyles.bodySmallUnderlineRegular,
              ),

              SizedBox(
                height: AppSizes.mp_v_2,
              ),

              ///BUILD RIDER ITEM
              buildRiderItem(context),

              SizedBox(
                height: AppSizes.mp_v_4 * 0.6,
              ),

              Expanded(
                child: GoogleMap(
                  mapType: MapType.normal,
                  initialCameraPosition: _kGooglePlex,
                  markers: markers,
                  myLocationEnabled: true,
                  myLocationButtonEnabled: false,
                  onMapCreated: (GoogleMapController controller) {
                    _controller.complete(controller);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  buildRiderItem(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppSizes.mp_w_6),
      child: Row(
        children: [
          CircleAvatar(
            radius: AppSizes.icon_size_6,
            backgroundColor: AppColors.grayLighter,
          ),
          SizedBox(
            width: AppSizes.mp_w_2,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Christopher",
                style: AppTextStyles.bodyLargeBold.copyWith(
                  color: AppColors.black,
                ),
              ),
              SizedBox(
                height: AppSizes.mp_v_1 / 4,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    Assets.icons.star,
                    color: AppColors.warningDefault,
                  ),
                  SizedBox(
                    width: AppSizes.mp_w_1,
                  ),
                  Text(
                    "4.5",
                    style: AppTextStyles.captionRegular
                        .copyWith(color: AppColors.grayDark),
                  ),
                ],
              ),
            ],
          ),
          const Expanded(
            child: SizedBox(),
          ),
          ButtonIconPrimaryOutline(
            onTap: () {},
            isDisabled: false,
            icon: Assets.icons.chat,
          ),
          SizedBox(
            width: AppSizes.mp_w_2 * 1.2,
          ),
          ButtonIconPrimaryFill(
            onTap: () {},
            isDisabled: false,
            icon: Assets.icons.message,
          ),
          SizedBox(
            width: AppSizes.mp_w_2 * 1.2,
          ),
          ButtonIconGreyScaleFill(
              onTap: () {}, isDisabled: false, icon: Assets.icons.calling),
          SizedBox(
            width: AppSizes.mp_w_2 * 1.2,
          ),
          ButtonIconPrimaryOutline(
            onTap: () {},
            isDisabled: false,
            icon: Assets.icons.edit,
          ),
        ],
      ),
    );
  }
}
