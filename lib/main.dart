// ignore_for_file: non_constant_identifier_names

import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'app/Services/graphql_conf.dart';

import 'app/routes/app_pages.dart';

GraphQLConfiguration graphQLConfiguration = GraphQLConfiguration();
void main() async {
  //for status  bar color

  runApp(App());
}

Sizer App() {
  return Sizer(
    builder:
        (BuildContext context, Orientation orientation, DeviceType deviceType) {
      return GraphQLProvider(
        client: graphQLConfiguration.client,
        child: CacheProvider(
          child: MaterialApp(
            builder: BotToastInit(),
            debugShowCheckedModeBanner: false,
            navigatorObservers: [BotToastNavigatorObserver()],
            home: GetMaterialApp(
              theme: ThemeData(
                primaryColor: Colors.white,
              ),
              themeMode: ThemeMode.light,
              title: "BellBoy Rider",
              initialRoute: AppPages.INITIAL,
              getPages: AppPages.routes,
              debugShowCheckedModeBanner: false,
            ),
          ),
        ),
      );
    },
  );
}
