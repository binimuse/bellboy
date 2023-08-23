import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/on_bording_controller.dart';

class OnBordingView extends GetView<OnBordingController> {
  const OnBordingView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('OnBordingView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'OnBordingView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
