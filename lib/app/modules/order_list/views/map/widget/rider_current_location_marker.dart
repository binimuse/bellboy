import 'package:bellboy/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RiderCurrentLocationMarker extends StatelessWidget {
  const RiderCurrentLocationMarker({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(Assets.icons.location);
  }
}
