import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'Sing_in_view.dart';
import 'Taps_view.dart';

class StartView extends StatelessWidget {
  const StartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              MaterialButton(
                minWidth: double.infinity,
                color: Colors.deepPurple,
                onPressed: () {
                  Get.updateLocale(const Locale("ar"));
                  FirebaseAuth.instance.currentUser == null
                      ? Get.to(() => const SignInView())
                      : Get.to(() => const TapsPage());
                },
                child: Text(
                  'f'.tr,
                  style: const TextStyle(color: Colors.white),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              MaterialButton(
                minWidth: double.infinity,
                color: Colors.deepPurple,
                onPressed: () {
                  Get.updateLocale(const Locale("en"));
                  FirebaseAuth.instance.currentUser == null
                      ? Get.to(() => const SignInView())
                      : Get.to(() => const TapsPage());
                },
                child: Text(
                  'e'.tr,
                  style: const TextStyle(color: Colors.white),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
