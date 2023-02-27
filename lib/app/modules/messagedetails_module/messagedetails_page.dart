import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../theme/app_colors.dart';
import 'messagedetails_controller.dart';
/**
 * GetX Template Generator - fb.com/htngu.99
 * */
class messagedetailsPage extends GetView<messagedetailsController> {
  const messagedetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('messagedetails Page')),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "FROM: ${controller.samuel.code}",
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              style: const TextStyle(
                  color: colorPrimaryDark,
                  fontWeight: FontWeight.w700,
                  fontSize: 20.0),
            ),
            SizedBox(height: 10,),
            Text(
              "MESSAGE: ${controller.samuel.response}",
              style: const TextStyle(
                  color: colorPrimaryDark,
                  fontSize: 15.0),
            ),
          ],
        ),
      ),
    );
  }
}
