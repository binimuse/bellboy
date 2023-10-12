import 'package:bellboy/app/config/theme/app_sizes.dart';
import 'package:bellboy/gen/assets.gen.dart';
import 'package:flutter/material.dart';

class RiderCurrentLocationMarker extends StatelessWidget {
  const RiderCurrentLocationMarker({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Image(
      fit: BoxFit.cover,
      image: AssetImage(Assets.icons.location),
      height: AppSizes.icon_size_28,
      width: AppSizes.icon_size_28,
    );
  }
}
