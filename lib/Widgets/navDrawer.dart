import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:share_plus/share_plus.dart';
import 'package:get/get.dart';
import 'package:vasoolraj/Authentication/authScreen.dart';
import 'package:vasoolraj/Screens/borrowerList.dart';
import 'package:vasoolraj/Widgets/widgets.dart';

class NavDrawer extends StatefulWidget {
  @override
  State<NavDrawer> createState() => _NavDrawerState();
}

class _NavDrawerState extends State<NavDrawer> {
  final _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.85,
      child: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
                child: Column(
              children: [
                Align(
                    alignment: Alignment.topRight,
                    child: NavigationArrow(
                      icon: const Icon(Icons.arrow_forward),
                      onPressed: () {
                        Get.to(() => const BorrowerList());
                      },
                    )),
                const SizedBox(
                  height: 20,
                ),
                const Center(
                    child: Text(
                  'Hello',
                  style: TextStyle(fontSize: 19),
                ))
              ],
            )),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('Log Out'),
              onTap: () {
                FirebaseAuth.instance.signOut();
                setState(() {
                  Get.to(() => const AuthScreen());
                });
              },
            ),
            Divider(),
            ListTile(
              leading: const Icon(Icons.whatsapp),
              title: const Text('Contact Us'),
              onTap: () async {
                String whatsAppSupport =
                    "whatsapp://send?phone=+919095291841&text=Hello Team Eleven, I am facing few issues with the application, please connect.  ";
                final Uri whatsAppSupporturl = Uri.parse(whatsAppSupport);

                if (await canLaunchUrl(whatsAppSupporturl)) {
                  await launchUrl(whatsAppSupporturl);
                } else {
                  Get.snackbar('Error', 'Try again later',
                      duration: const Duration(seconds: 10));
                }
              },
            ),
            Divider(),
            ListTile(
              leading: const Icon(Icons.share),
              title: const Text('Share App'),
              onTap: () {
                Share.share(
                    'Hello, Check out Eleven app, I am using Eleven to manage my borrowers interest payment data. Download Now: https://bit.ly/eleven_app');
              },
            )
          ],
        ),
      ),
    );
  }
}
