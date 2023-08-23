// ignore_for_file: non_constant_identifier_names

import 'package:bellboy/app/config/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'app/Services/graphql_conf.dart';
import 'app/routes/app_pages.dart';

GraphQLConfiguration graphQLConfiguration = GraphQLConfiguration();
void main() async {
  //for status  bar color
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: AppColors.whiteOff,
    ),
  );
  runApp(App());
}

Sizer App() {
  return Sizer(
    builder:
        (BuildContext context, Orientation orientation, DeviceType deviceType) {
      return GraphQLProvider(
        client: graphQLConfiguration.client,
        child: CacheProvider(
          child: GetMaterialApp(
            ///to take system theme
            themeMode: ThemeMode.light,
            title: "BellBoy Rider",
            initialRoute: AppPages.INITIAL,
            debugShowCheckedModeBanner: false,
            getPages: AppPages.routes,
            defaultTransition: Transition.native,
          ),
        ),
      );
    },
  );
}
