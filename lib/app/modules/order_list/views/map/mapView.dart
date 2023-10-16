// ignore_for_file: file_names

import 'dart:async';

import 'package:bellboy/app/common/widgets/app_common_annotated_region.dart';
import 'package:bellboy/app/common/widgets/layer_data/models/enums.dart';
import 'package:bellboy/app/config/theme/app_colors.dart';
import 'package:bellboy/app/config/theme/app_sizes.dart';
import 'package:bellboy/app/config/theme/app_text_styles.dart';
import 'package:bellboy/gen/assets.gen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:widget_to_marker/widget_to_marker.dart';

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

  initMarkers() async {
    markers = {};

    markers.add(
      Marker(
        markerId: const MarkerId("1"),
        position: const LatLng(9.050959034031933, 38.744761824707986),
        icon: await const CheckPointMarker(
          locationCheckPointStatus: LocationCheckPointStatus.ASAP,
          checkPointNumber: "1",
        ).toBitmapDescriptor(),
      ),
    );

    markers.add(
      Marker(
        markerId: const MarkerId("2"),
        position: const LatLng(9.043994490620204, 38.748997730537944),
        icon: await const CheckPointMarker(
          locationCheckPointStatus: LocationCheckPointStatus.PRIMARY,
          checkPointNumber: "2",
        ).toBitmapDescriptor(),
      ),
    );

    isZoomLevel200
        ? markers.add(
            Marker(
              markerId: const MarkerId("3"),
              position: const LatLng(9.03118044977825, 38.738217553988726),
              icon: await const CheckPointMarkerText(
                locationCheckPointStatus: LocationCheckPointStatus.OTHERDAY,
                checkPointNumber: "3",
              ).toBitmapDescriptor(),
            ),
          )
        : markers.add(
            Marker(
              markerId: const MarkerId("3"),
              position: const LatLng(9.03118044977825, 38.738217553988726),
              icon: await const CheckPointMarker(
                locationCheckPointStatus: LocationCheckPointStatus.OTHERDAY,
                checkPointNumber: "3",
              ).toBitmapDescriptor(),
            ),
          );

    markers.add(
      Marker(
        markerId: const MarkerId("4"),
        position: const LatLng(9.021134765027485, 38.748725833580835),
        icon: await const CheckPointMarker(
          locationCheckPointStatus: LocationCheckPointStatus.TODAY,
          checkPointNumber: "4",
        ).toBitmapDescriptor(),
      ),
    );

    markers.add(
      Marker(
        markerId: const MarkerId("5"),
        position: const LatLng(9.008494480553173, 38.743958724707674),
        icon: await const CheckPointMarker(
          locationCheckPointStatus: LocationCheckPointStatus.TODAY,
          checkPointNumber: "5",
        ).toBitmapDescriptor(),
      ),
    );

    markers.add(
      Marker(
        markerId: const MarkerId("5"),
        position: const LatLng(9.035653256641449, 38.7579873382014),
        icon: await const CheckPointMarker(
          locationCheckPointStatus: LocationCheckPointStatus.OTHERDAY,
          checkPointNumber: "5",
        ).toBitmapDescriptor(),
      ),
    );
//my location
    markers.add(
      Marker(
        markerId: const MarkerId("6"),
        position: const LatLng(9.012969935596415, 38.75285307892485),
        icon: await const CurrentLocationMarker().toBitmapDescriptor(),
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
              if (position.zoom >= 14) {
                isZoomLevel200 = true;
              } else {
                isZoomLevel200 = false;
              }

              currentZoom = position.zoom;

              setState(() {
                initMarkers();
              });

              // Update the current zoom level
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
                        SizedBox(
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
