// ignore_for_file: use_build_context_synchronously, unused_local_variable, body_might_complete_normally_nullable, avoid_print

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import '../controller/Sign_in_controller.dart';
import 'Register.dart';
import 'Taps_view.dart';

class SignInViewBody extends StatefulWidget {
  const SignInViewBody({super.key});

  @override
  State<SignInViewBody> createState() => _SignInViewBodyState();
  
}

class _SignInViewBodyState extends State<SignInViewBody> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  SigiIn controller = Get.put(SigiIn());
  bool _obscureText = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
              Colors.deepPurple,
              Colors.deepPurpleAccent,
              Colors.white
            ])),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Form(
              key: formState,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "s".tr,
                    style: const TextStyle(
                        color: Colors.black26,
                        fontSize: 50,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value == "") {
                        return "can't to be empty";
                      }
                    },
                    controller: email,
                    decoration: InputDecoration(
                        labelText: 'm'.tr,
                        hintText: 'n'.tr,
                        enabledBorder: const OutlineInputBorder(),
                        focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide(
                          color: Colors.blue,
                          width: 3,
                        ))),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value == "") {
                        return "can't to be empty";
                      }
                    },
                    controller: password,
                    obscureText: _obscureText,
                    decoration: InputDecoration(
                      labelText: 'p'.tr,
                      hintText: 'y'.tr,
                      enabledBorder: const OutlineInputBorder(),
                      focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(
                        color: Colors.blue,
                        width: 3,
                      )),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _obscureText
                              ? Icons.visibility
                              : Icons.visibility_off,
                        ),
                        onPressed: () {
                          setState(() {
                            _obscureText = !_obscureText;
                          });
                        },
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  MaterialButton(
                    onPressed: () async {
                      if (formState.currentState!.validate()) {
                        try {
                          
                          final credential = await FirebaseAuth.instance
                              .signInWithEmailAndPassword(
                            email: email.text,
                            password: password.text,
                          );
                          // Navigate to TapsPage upon successful sign-in
                          Get.to(() => const TapsPage());
                        } on FirebaseAuthException catch (e) {
                          // Show error dialog for different authentication errors
                          String errorMessage = '';
                          if (e.code == 'user-not-found') {
                            errorMessage = 'No user found for that email.';
                          } else if (e.code == 'wrong-password') {
                            errorMessage =
                                'Wrong password provided for that user.';
                          } 
                          else {
                            errorMessage = 'An error occurred: ${e.message}';
                          }
                          AwesomeDialog(
                            context: context,
                            dialogType: DialogType.error,
                            title: 'Error',
                            desc: errorMessage,
                            btnOkText: 'OK',
                            btnOkOnPress: () {},
                          ).show();
                        } catch (e) {
                          // Show generic error dialog for other exceptions
                          AwesomeDialog(
                            context: context,
                            dialogType: DialogType.error,
                            title: 'Error',
                            desc:
                                'An unexpected error occurred. Please try again later.',
                            btnOkText: 'OK',
                            btnOkOnPress: () {},
                          ).show();
                          print(e);
                        }
                      } else {
                        print("Form not valid");
                      }
                    },
                    color: Colors.black26,
                    child: Text(
                      "s".tr,
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  MaterialButton(
                    onPressed: () {
                      Get.to(() => const Register());
                    },
                    color: Colors.black26,
                    child: Text(
                      "re".tr,
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                 
                  const SizedBox(
                    width: 30,
                  ),
                 MaterialButton(
                  
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                  color: Colors.deepPurple,
                  onPressed: ()async{
                  controller.signInWithGoogle();
                 },
                 child: Row(children: [
                  Text("sg".tr,style:const TextStyle(color: Colors.white),),
                const  Spacer(),
                 const Icon(Icons.g_mobiledata_rounded,color: Colors.deepOrange,)

                 ],),)
                  
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
