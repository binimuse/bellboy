import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/find_password_controller.dart';

class FindPasswordView extends GetView<FindPasswordController> {
  const FindPasswordView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FindPasswordView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'FindPasswordView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
