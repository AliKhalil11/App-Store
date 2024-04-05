// ignore_for_file: unused_local_variable, use_build_context_synchronously, unnecessary_string_interpolations, body_might_complete_normally_nullable, avoid_print

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'Taps_view.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  bool _obscureText = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        child: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                Colors.deepPurple,
                Colors.deepPurpleAccent,
                Colors.white
              ])),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Form(
              key: formState,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "ss".tr,
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
                          _obscureText ? Icons.visibility : Icons.visibility_off,
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
                              .createUserWithEmailAndPassword(
                            email: email.text,
                            password: password.text,
                          );
                          // Show success dialog
                          AwesomeDialog(
                            context: context,
                            dialogType: DialogType.success,
                            title: 'Success',
                            desc: 'User created successfully!',
                            btnOkText: 'OK',
                            btnOkOnPress: () {
                              Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                    builder: (_) => const TapsPage()),
                              );
                            },
                          ).show();
                        } on FirebaseAuthException catch (e) {
                          // Show error dialog
                          String errorMessage = '';
                          if (e.code == 'weak-password') {
                            errorMessage = 'The password provided is too weak.';
                          } else if (e.code == 'email-already-in-use') {
                            errorMessage =
                                'The account already exists for that email.';
                          } else {
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
                          // Show generic error dialog
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
                      "ss".tr,
                      style: const TextStyle(color: Colors.white),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
