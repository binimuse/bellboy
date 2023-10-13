import 'package:bellboy/app/config/theme/app_assets.dart';
import 'package:bellboy/app/config/theme/app_colors.dart';
import 'package:bellboy/app/config/theme/app_sizes.dart';
import 'package:bellboy/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CurrentLocationMarker extends StatelessWidget {
  const CurrentLocationMarker({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      AppAssets.mylocation,
      width: AppSizes.icon_size_24,
      height: AppSizes.icon_size_24,
      fit: BoxFit.contain,
    );
  }
}
