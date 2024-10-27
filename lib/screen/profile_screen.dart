import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping/delivering_status/delivering_tab.dart';
import 'package:shopping/delivering_status/preparing_tab.dart';
import 'package:shopping/delivering_status/recieving_tab.dart';
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
    // return DefaultTabController(
    //   length: 3,
    //   child: Scaffold(
    //     body: Container(
    //       //color: Colors.amber,
    //       child: Padding(
    //         padding: const EdgeInsets.only(top: 80),
    //         child: Column(
    //           children: [
    //             Row(
    //               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    //               children: [
    //                 Column(
    //                   children: [
    //                     GestureDetector(
    //                       onTap: () {
    //                         Get.to(() => const UserPage());
    //                       },
    //                       child: CircleAvatar(
    //                         radius: 24,
    //                         child: Image.asset('assets/profile/profile.avif'),
    //                       ),
    //                     ),
    //                     const Text("Ahmed"),
    //                   ],
    //                 ),
    //                 Column(
    //                   children: [
    //                     GestureDetector(
    //                       onTap: () {
    //                         Get.to(() => const HistoryPage());
    //                       },
    //                       child: CircleAvatar(
    //                         radius: 24,
    //                         child: Image.asset('assets/icons/history_icon.png'),
    //                       ),
    //                     ),
    //                     const Text("History")
    //                   ],
    //                 ),
    //                 Column(
    //                   children: [
    //                     GestureDetector(
    //                       onTap: () {
    //                         Get.to(() => const SettingPage());
    //                       },
    //                       child: CircleAvatar(
    //                         radius: 24,
    //                         child: Image.asset('assets/icons/setting_icon.png'),
    //                       ),
    //                     ),
    //                     const Text("Setting")
    //                   ],
    //                 ),
    //               ],
    //             ),
    //             const SizedBox(height: 20),
    //             Row(
    //               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    //               children: [
    //                 GestureDetector(
    //                   onTap: () {
    //                     Get.to(() => const AddressPage());
    //                   },
    //                   child: Column(
    //                     children: [
    //                       CircleAvatar(
    //                         radius: 24,
    //                         child: Image.asset('assets/icons/map_icon.png'),
    //                       ),
    //                       const Text("Address")
    //                     ],
    //                   ),
    //                 ),
    //                 Column(
    //                   children: [
    //                     GestureDetector(
    //                       onTap: () {
    //                         Get.to(() => const PrivacyPage());
    //                       },
    //                       child: CircleAvatar(
    //                         radius: 24,
    //                         child: Image.asset('assets/icons/policy_icon.png'),
    //                       ),
    //                     ),
    //                     const Text("Privacy")
    //                   ],
    //                 ),
    //                 Column(
    //                   children: [
    //                     GestureDetector(
    //                       onTap: () {
    //                         Get.to(() => const NotificationPage());
    //                       },
    //                       child: CircleAvatar(
    //                         radius: 24,
    //                         child: Image.asset('assets/icons/notify_icon.png'),
    //                       ),
    //                     ),
    //                     const Text("Notifications")
    //                   ],
    //                 ),
    //                 Column(
    //                   children: [
    //                     GestureDetector(
    //                       onTap: () {
    //                         Get.to(() => const LoginPage());
    //                       },
    //                       child: CircleAvatar(
    //                         radius: 24,
    //                         child: Image.asset('assets/icons/logout_icon.png'),
    //                       ),
    //                     ),
    //                     const Text("LogOut")
    //                   ],
    //                 ),
    //               ],
    //             ),
    //             const SizedBox(height: 40),
    //             const Padding(
    //               padding: EdgeInsets.only(left: 40),
    //               child: Row(
    //                 mainAxisAlignment: MainAxisAlignment.start,
    //                 children: [
    //                   Text(
    //                     "Delivery Status",
    //                     style: TextStyle(
    //                       fontWeight: FontWeight.bold,
    //                       fontSize: 16,
    //                     ),
    //                   ),
    //                 ],
    //               ),
    //             ),
    //             ButtonsTabBar(
    //               radius: 12,
    //               backgroundColor: Colors.blue,
    //               unselectedBackgroundColor: Colors.grey,
    //               borderColor: Colors.black,
    //               labelStyle: const TextStyle(
    //                 color: Colors.white,
    //                 fontWeight: FontWeight.bold,
    //               ),
    //               unselectedLabelStyle: const TextStyle(
    //                 color: Colors.black,
    //                 fontWeight: FontWeight.bold,
    //               ),
    //               contentPadding: const EdgeInsets.symmetric(horizontal: 10),
    //               tabs: const [
    //                 Tab(
    //                     icon: Icon(Icons.delivery_dining),
    //                     child: Text("Preparing",
    //                         style: TextStyle(color: Colors.white))),
    //                 Tab(
    //                     icon: Icon(Icons.abc),
    //                     child: Text("Delivering",
    //                         style: TextStyle(color: Colors.white))),
    //                 Tab(
    //                     icon: Icon(Icons.receipt),
    //                     child: Text("Recieved",
    //                         style: TextStyle(color: Colors.white))),
    //               ],
    //             ),
    //             const Expanded(
    //               child: TabBarView(
    //                 children: [
    //                   Padding(
    //                     padding: EdgeInsets.only(top: 12),
    //                     child: Preparing(),
    //                   ),
    //                   Padding(
    //                     padding: EdgeInsets.only(top: 10),
    //                     child: Delivering(),
    //                   ),
    //                   Padding(
    //                     padding: EdgeInsets.only(top: 10),
    //                     child: Recieved(),
    //                   ),
    //                 ],
    //               ),
    //             ),
    //           ],
    //         ),
    //       ),
    //     ),
    //   ),
    // );

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
                  Get.offAll(() => LoginPage());
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
