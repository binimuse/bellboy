// ignore_for_file: file_names, camel_case_types

import 'dart:async';

import 'package:bellboy/app/common/widgets/app_common_annotated_region.dart';
import 'package:bellboy/app/config/theme/app_colors.dart';
import 'package:bellboy/app/config/theme/app_sizes.dart';
import 'package:bellboy/app/config/theme/app_text_styles.dart';
import 'package:bellboy/app/modules/order_list/views/map/widget/2hours/twohours_marker.dart';
import 'package:bellboy/app/modules/order_list/views/map/widget/2hours/twohours_text.dart';
import 'package:bellboy/app/modules/order_list/views/map/widget/asap/asap_marker.dart';
import 'package:bellboy/app/modules/order_list/views/map/widget/asap/asap_text.dart';
import 'package:bellboy/app/modules/order_list/views/map/widget/mylocation/current_location_marker.dart';
import 'package:bellboy/app/modules/order_list/views/map/widget/otherday/otherday_marker.dart';
import 'package:bellboy/app/modules/order_list/views/map/widget/otherday/otherday_text.dart';
import 'package:bellboy/app/modules/order_list/views/map/widget/today/today_text.dart';
import 'package:bellboy/gen/assets.gen.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:widget_to_marker/widget_to_marker.dart';

import '../map/widget/today/today_marker.dart';

class orderDetailView extends StatefulWidget {
  const orderDetailView({Key? key}) : super(key: key);

  @override
  State<orderDetailView> createState() => _ScreenRealTimeLocationState();
}

class _ScreenRealTimeLocationState extends State<orderDetailView> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(9.030997, 38.748962),
    zoom: 12.2,
  );

  final double minZoom = 0.0;
  final double maxZoom = 20.0;

// Define a variable to store the current zoom level
  double currentZoom = _kGooglePlex.zoom;

  Set<Marker> markers = {};

  var isZoomLevel200 = false;

  // Define marker icons for different zoom levels for ASAP
  late BitmapDescriptor asapIcon;
  late BitmapDescriptor asapzoomedIcon;

  // Define marker icons for different zoom levels for TODAY
  late BitmapDescriptor todayIcon;
  late BitmapDescriptor todayzoomedIcon;

  // Define marker icons for different zoom levels for OtherDay
  late BitmapDescriptor otherDayIcon;
  late BitmapDescriptor otherDayzoomedIcon;

  // Define marker icons for different zoom levels for Primary
  late BitmapDescriptor primaryIcon;
  late BitmapDescriptor primaryzoomedIcon;

  Timer? markerUpdateTimer;

  @override
  void initState() {
    // Load marker icons when the widget is initialized
    loadMarkerIcons();
    super.initState();
  }

  Future<void> loadMarkerIcons() async {
    //ASAP
    asapIcon = await const ASAPMarker(
      extraMoney: true,
      isageLimit: true,
    ).toBitmapDescriptor();

    asapzoomedIcon = await const ASAPText(
      extraMoney: true,
      isAgeLimit: true,
    ).toBitmapDescriptor();

    //TODAY
    todayIcon = await const TodayMarker(
      extraMoney: false,
      isageLimit: false,
    ).toBitmapDescriptor();

    todayzoomedIcon = await const TodayText(
      extraMoney: false,
      isAgeLimit: false,
    ).toBitmapDescriptor();

    //OtherDay
    otherDayIcon = await const OtherDayMarker(
      extraMoney: false,
      isageLimit: false,
    ).toBitmapDescriptor();

    otherDayzoomedIcon = await const OtherdayText(
      extraMoney: false,
      isAgeLimit: true,
    ).toBitmapDescriptor();

    //TwoHours
    primaryIcon = await const TwoHoursMarker(
      extraMoney: true,
      isageLimit: false,
    ).toBitmapDescriptor();

    primaryzoomedIcon = await const TowhoursText(
      extraMoney: true,
      isAgeLimit: false,
    ).toBitmapDescriptor();

    // Call updateMarkers here to set the initial markers
    updateMarkers();
  }

  void updateMarkers() async {
    markers = {};

    const LatLng marker2Position =
        LatLng(9.043994490620204, 38.748997730537944);
    const LatLng marker3Position = LatLng(9.03118044977825, 38.738217553988726);
    const LatLng marker4Position =
        LatLng(9.021134765027485, 38.748725833580835);
    const LatLng marker5Position = LatLng(9.035653256641449, 38.7579873382014);
    const LatLng marker6Position = LatLng(9.012969935596415, 38.75285307892485);

    final Marker marker2 = Marker(
      markerId: const MarkerId("2"),
      position: marker2Position,
      icon: isZoomLevel200 ? primaryzoomedIcon : primaryIcon,
    );
    markers.add(marker2);

    final Marker marker3 = Marker(
      markerId: const MarkerId("3"),
      position: marker3Position,
      icon: isZoomLevel200 ? asapzoomedIcon : asapIcon,
    );
    markers.add(marker3);

    final Marker marker4 = Marker(
      markerId: const MarkerId("4"),
      position: marker4Position,
      icon: isZoomLevel200 ? todayzoomedIcon : todayIcon,
    );
    markers.add(marker4);

    final Marker marker5 = Marker(
      markerId: const MarkerId("5"),
      position: marker5Position,
      icon: isZoomLevel200 ? otherDayzoomedIcon : otherDayIcon,
    );
    markers.add(marker5);

//my location
    final Marker marker6 = Marker(
      markerId: const MarkerId("6"),
      position: marker6Position,
      icon: await const CurrentLocationMarker().toBitmapDescriptor(),
    );
    markers.add(marker6);

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return AppCommonAnnotatedRegion(
        child: Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          GoogleMap(
            mapType: MapType.normal,
            initialCameraPosition: _kGooglePlex,
            markers: markers,
            myLocationEnabled: false,
            myLocationButtonEnabled: false,
            zoomControlsEnabled: false,
            zoomGesturesEnabled: true,
            cameraTargetBounds:
                CameraTargetBounds.unbounded, // Allow camera movement anywhere

            onMapCreated: (GoogleMapController controller) {
              _controller.complete(controller);
            },
            onCameraMove: (CameraPosition position) {
              // Cancel any previous timer
              markerUpdateTimer?.cancel();

              markerUpdateTimer = Timer(const Duration(milliseconds: 100), () {
                if (position.zoom >= 13) {
                  setState(() {
                    isZoomLevel200 = true;
                    updateMarkers();
                  });
                } else {
                  setState(() {
                    isZoomLevel200 = false;
                    updateMarkers();
                  });
                }
              });
            },
          ),
          Positioned(
            top: 50.0,
            left: 10.0,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: SizedBox(
                width: 12.w,
                height: 12.w,
                child: FloatingActionButton(
                  heroTag: 1,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8.0)),
                  ),
                  backgroundColor: AppColors.whiteOff,
                  onPressed: () {
                    Get.back();
                  },
                  child: SvgPicture.asset(
                    Assets.icons.arrowleft,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: 50.0,
            left: 120.0,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(50.0),
              child: SizedBox(
                width: 35.w,
                height: 12.w,
                child: FloatingActionButton(
                  heroTag: 2,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8.0)),
                  ),
                  backgroundColor: AppColors.whiteOff,
                  onPressed: () {},
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          Assets.icons.dollarcircleline,
                          fit: BoxFit.cover,
                        ),
                        const SizedBox(
                          width: 5.0,
                        ),
                        Text(
                          "\$15.2",
                          style: AppTextStyles.bodyLargeBold.copyWith(
                              fontSize: AppSizes.font_16,
                              color: AppColors.black),
                        ),
                      ]),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 16.0,
            right: 30.0,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: SizedBox(
                width: 12.w,
                height: 12.w,
                child: FloatingActionButton(
                  heroTag: 3,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8.0)),
                  ),
                  backgroundColor: AppColors.whiteOff,
                  onPressed: () {},
                  child: SvgPicture.asset(
                    Assets.icons.gps,
                    fit: BoxFit.cover,
                    color: AppColors.black,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
