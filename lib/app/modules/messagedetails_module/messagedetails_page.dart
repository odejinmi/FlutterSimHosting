import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'messagedetails_controller.dart';
/**
 * GetX Template Generator - fb.com/htngu.99
 * */

class messagedetailsPage extends GetView<messagedetailsController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('messagedetails Page')),
      body: Container(
        child: Obx(()=>Container(child: Text(controller.obj),)),
      ),
    );
  }
}
