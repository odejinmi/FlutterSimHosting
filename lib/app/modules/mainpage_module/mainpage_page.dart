import 'package:flutter/material.dart';
import 'package:fluttersimhosting/app/database/databasemodel.dart';
import 'package:get/get.dart';

import '../../data/provider/globalvariable.dart';
import '../../theme/app_colors.dart';
import '../../utils/strings.dart';
import 'mainpage_controller.dart';
/// GetX Template Generator - fb.com/htngu.99
///

class MainpagePage extends GetView<MainpageController> {
  const MainpagePage({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorSeenTranslucent,
      appBar: AppBar(
        title: Row(
          children: const [
            Text('Inbox'),
          ],
        ),
        actions: [
              TextButton(
                  onPressed: (){
                    controller.logout();
                  },
                  child: const Text("LOGOUT", style: TextStyle(color: Colors.white),)),
          PopupMenuButton(
            // add icon, by default "3 dot" icon
            // icon: Icon(Icons.book)
              itemBuilder: (context){
                return [
                  const PopupMenuItem<int>(
                    value: 0,
                    child: Text("API Documentation"),
                  ),

                  const PopupMenuItem<int>(
                    value: 1,
                    child: Text("Contact Us"),
                  ),

                  // PopupMenuItem<int>(
                  //   value: 2,
                  //   child: Text("Logout"),
                  // ),
                ];
              },
              onSelected:(value){
                if(value == 0){

                  const url = "https://documenter.getpostman.com/view/9781740/U16qJ3ah";
                  openbrowser(url);
                }else if(value == 1){
                  const url = "https://hostmobilesim.com/contact-us";
                  openbrowser(url);
                }
              }
          ),

        ],),
      body: Obx(()=>controller.processes.isEmpty?
      Container(
        width: Get.width,
          height: Get.height,
          color: colorNotSeenTranslucent,
          child: Center(child: Text(youhaveno.tr, style: const TextStyle(color: Colors.white),))):
      ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, position) {
          Databasemodel samuel = controller.processes[position];
          return GestureDetector(
              onTap: () {
                controller.updateseen(samuel);
              },
              child:
              Obx(() =>  Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                padding: const EdgeInsets.symmetric(horizontal: 10),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: samuel.processSeen?colorSeenTranslucent:colorNotSeenTranslucent,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    // border: Border.all(color: primarycolour.value)
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      samuel.code,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: const TextStyle(
                          color: colorPrimaryDark,
                          fontWeight: FontWeight.w700,
                          fontSize: 20.0),
                    ),
                    Text(
                      samuel.response,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 3,
                      style: const TextStyle(
                          color: colorPrimaryDark,
                          fontSize: 20.0),
                    ),
                  ],
                ),
              )));
        },
        itemCount: controller.processes.length,
      )),
    );
  }
}
