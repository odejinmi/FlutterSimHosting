import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../theme/app_colors.dart';
import '../../utils/strings.dart';
import 'loginscreen_controller.dart';
/// GetX Template Generator - fb.com/htngu.99
///

class loginscreenPage extends GetView<loginscreenController>{
  const loginscreenPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Row(
        children: [
          Text(login.tr),
        ],
      )),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        // child: Obx(()=>Container(child: Text(controller.obj),)),
        child: Form(
          key: controller.formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 85,),
                Image.asset("asset/logo.png"),
                const SizedBox(height: 130,),
                Text(kindlylogin.tr, style: const TextStyle(fontSize: 17),),
                Text(letconnect.tr, style: const TextStyle(fontSize: 17),),
                const SizedBox(height: 40,),
                TextFormField(
                  autofillHints: const [AutofillHints.password],
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: edittextbodersolidcolour,
                    enabledBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      borderSide: BorderSide(color: edittextbodercolour),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      borderSide: BorderSide(color: edittextbodercolour),
                    ),
                    errorBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      borderSide: BorderSide(color: edittextbodercolour),
                    ),
                    hintText: enterserverid.tr,
                  ),
                  controller: controller.passwordController,
                  onChanged: (value) {

                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return this_field_can.tr;
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 45,),
                ElevatedButton(
                  style: ButtonStyle(
                      elevation: MaterialStateProperty.all(0),
                      // foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                      // backgroundColor: MaterialStateProperty.all<Color>(
                      //   backgroundColor,
                      // ),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            // side: BorderSide(color: Colors.red)
                          ))),
                  onPressed: () {
                    TextInput.finishAutofillContext();
                    if (controller.formKey.currentState!.validate()) {
                      // _login(context);
                      controller.login({
                        'serverid': controller.passwordController.text,
                      });
                    }
                  },
                  child: Obx(()=>controller.isloading? const SpinKitCircle(
                    color: Colors.white,
                    size: 50.0,
                  ):Container(
                    alignment: Alignment.center,
                    height: 50,
                    width: Get.width,
                    child: Text(
                      login.tr.toUpperCase(),
                      style: const TextStyle(color: Colors.white),
                    ),
                  )),
                ),
                const SizedBox(height: 70,),
                SizedBox(
                  width: Get.width,
                  child: Column(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.arrow_forward_ios),
                        onPressed: () async {
                          const url = "https://hostmobilesim.com/register";
                          openbrowser(url);
                        },
                      ),
                      Text(swipeleft.tr, style: const TextStyle(fontSize: 15),),
                      const SizedBox(height: 20,),
                    ],
                  ),
                )
              ],
            ),
          ),
        )
      ),
    );
  }
}
