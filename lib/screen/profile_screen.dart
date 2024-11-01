import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shopping/controller/login_controller.dart';
import 'package:shopping/views/address/address_page.dart';
import 'package:shopping/views/history/history_page.dart';
import 'package:shopping/views/login/login_page.dart';
import 'package:shopping/views/notification/notification_page.dart';
import 'package:shopping/views/privacy/privacy_page.dart';
import 'package:shopping/views/setting/setting_page.dart';
import 'package:shopping/views/user/user_page.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    final box = GetStorage();

    String? token = box.read('token');
    if (token == null) {
      return LoginPage();
    }
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              GestureDetector(
                onTap: () {
                  Get.to(() => UserPage());
                },
                child: ListTile(
                  leading: CircleAvatar(
                    child: Image.asset("assets/profile/profile.avif"),
                  ),
                  title: Text(
                    "Ahmed",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Get.to(() => AddressPage());
                },
                child: ListTile(
                  //leading: Icon(Icons.location_pin),
                  title: Text(
                    "Address",
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.normal),
                  ),
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                    size: 16,
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Get.to(() => PrivacyPage());
                },
                child: ListTile(
                  //leading: Icon(Icons.privacy_tip),
                  title: Text(
                    "Privacy",
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.normal),
                  ),
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                    size: 16,
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Get.to(() => HistoryPage());
                },
                child: ListTile(
                  //leading: Icon(Icons.history),
                  title: Text(
                    "History",
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.normal),
                  ),
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                    size: 16,
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Get.to(() => NotificationPage());
                },
                child: ListTile(
                  //leading: Icon(Icons.notifications),
                  title: Text(
                    "Notification",
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.normal),
                  ),
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                    size: 16,
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Get.to(() => SettingPage());
                },
                child: ListTile(
                  //leading: Icon(Icons.settings),
                  title: Text(
                    "Setting",
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.normal),
                  ),
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                    size: 16,
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  //Get.offAll(() => LoginPage());
                  controller.logout();
                },
                child: ListTile(
                  leading: Icon(Icons.logout_outlined),
                  title: Text(
                    "Log out",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
