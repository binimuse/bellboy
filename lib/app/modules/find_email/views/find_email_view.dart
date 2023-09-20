import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/find_email_controller.dart';

class FindEmailView extends GetView<FindEmailController> {
  const FindEmailView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FindEmailView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'FindEmailView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
