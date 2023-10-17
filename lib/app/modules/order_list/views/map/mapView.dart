// ignore_for_file: file_names

import 'dart:async';

import 'package:bellboy/app/common/widgets/app_common_annotated_region.dart';
import 'package:bellboy/app/common/widgets/layer_data/models/enums.dart';
import 'package:bellboy/app/config/theme/app_colors.dart';
import 'package:bellboy/app/config/theme/app_sizes.dart';
import 'package:bellboy/app/config/theme/app_text_styles.dart';
import 'package:bellboy/gen/assets.gen.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:widget_to_marker/widget_to_marker.dart';

import 'widget/asap/asap_marker.dart';
import 'widget/check_point_marker.dart';
import 'widget/check_point_marker_text.dart';
import 'widget/current_location_marker.dart';

class MapView extends StatefulWidget {
  const MapView({Key? key}) : super(key: key);

  @override
  State<MapView> createState() => _ScreenRealTimeLocationState();
}

class _ScreenRealTimeLocationState extends State<MapView> {
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

    asapzoomedIcon = await const CheckPointMarkerText(
      locationCheckPointStatus: LocationCheckPointStatus.ASAP,
      checkPointNumber: "3",
    ).toBitmapDescriptor();

    //TODAY
    todayIcon = await const CheckPointMarker(
      locationCheckPointStatus: LocationCheckPointStatus.TODAY,
      checkPointNumber: "4",
    ).toBitmapDescriptor();

    todayzoomedIcon = await const CheckPointMarkerText(
      locationCheckPointStatus: LocationCheckPointStatus.TODAY,
      checkPointNumber: "4",
    ).toBitmapDescriptor();

    //OtherDay
    otherDayIcon = await const CheckPointMarker(
      locationCheckPointStatus: LocationCheckPointStatus.OTHERDAY,
      checkPointNumber: "5",
    ).toBitmapDescriptor();

    otherDayzoomedIcon = await const CheckPointMarkerText(
      locationCheckPointStatus: LocationCheckPointStatus.OTHERDAY,
      checkPointNumber: "5",
    ).toBitmapDescriptor();

    //Primary
    primaryIcon = await const CheckPointMarker(
      locationCheckPointStatus: LocationCheckPointStatus.PRIMARY,
      checkPointNumber: "2",
    ).toBitmapDescriptor();

    primaryzoomedIcon = await const CheckPointMarkerText(
      locationCheckPointStatus: LocationCheckPointStatus.PRIMARY,
      checkPointNumber: "2",
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
            top: 20.0,
            left: 120.0,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(50.0),
              child: SizedBox(
                width: 35.w,
                height: 12.w,
                child: FloatingActionButton(
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
                          "Earnings",
                          style: AppTextStyles.bodyLargeBold.copyWith(
                              fontSize: AppSizes.font_16,
                              color: AppColors.grayLight),
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
