// ignore_for_file: unused_local_variable

import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:image_picker/image_picker.dart';
import 'Sing_in_view.dart';

class ProfilView extends StatefulWidget {
  const ProfilView({super.key});

  @override
  State<ProfilView> createState() => _ProfilViewState();
}

class _ProfilViewState extends State<ProfilView> {
  // SigiIn controller = Get.put(SigiIn());

  File? file;
  getImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? photo = await picker.pickImage(source: ImageSource.camera);
    if (photo != null) {
      file = File(photo.path);
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: const Text(""),
          title: Text(
            "d".tr,
            style: const TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.deepPurpleAccent,
          iconTheme: const IconThemeData(color: Colors.white),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 80,
                  child: Stack(children: [
                    if (file != null)
                      ClipRRect(
                          borderRadius: BorderRadius.circular(80),
                          child: Image.file(
                            file!,
                            width: double.infinity,
                            height: double.infinity,
                            fit: BoxFit.fill,
                          )),
                    Positioned(
                      bottom: 5,
                      right: 100,
                      child: CircleAvatar(
                        radius: 30,
                        child: IconButton(
                          onPressed: () async {
                            await getImage();
                          },
                          icon: const Icon(Icons.camera_alt_outlined),
                        ),
                      ),
                    )
                  ]),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text("User name : Ali Khalil"),
                const SizedBox(
                  height: 10,
                ),
                const Text("My email: Ali.Khalil.374757@gmail.com"),
                const SizedBox(
                  height: 10,
                ),
                MaterialButton(
                  color: Colors.deepPurple,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  onPressed: () async {
                    GoogleSignIn googleSignIn = GoogleSignIn();

                    googleSignIn.disconnect();

                    await FirebaseAuth.instance.signOut();

                    Get.off(() => const SignInView());
                  },
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.output_rounded,
                        color: Colors.white,
                      ),
                      Spacer(),
                      Text(
                        'Sign out',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                MaterialButton(
                  color: Colors.deepPurple,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  onPressed: () async {
                    await FirebaseAuth.instance.signOut();
                    Get.off(() => const SignInView());
                  },
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.delete,
                        color: Colors.white,
                      ),
                      Spacer(),
                      Text(
                        'Delete Account',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
