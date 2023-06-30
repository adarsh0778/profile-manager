import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_page/signup_controller.dart';
import 'package:login_page/updateprofilescreen.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignUpController());
    final _formkey = GlobalKey<FormState>();
    return SafeArea(
        child: Scaffold(
      body: Center(
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 20.0),
          child: Form(
            key: _formkey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  controller: controller.fullName,
                  decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.person_outline_outlined),
                      label: Text("Full Name"),
                      border: OutlineInputBorder()),
                ),
                const SizedBox(height: 10.0),
                TextFormField(
                  controller: controller.email,
                  decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.email_outlined),
                      label: Text("E-mail"),
                      border: OutlineInputBorder()),
                ),
                const SizedBox(height: 10.0),
                TextFormField(
                  controller: controller.password,
                  decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.fingerprint),
                      label: Text("Password"),
                      border: OutlineInputBorder()),
                ),
                const SizedBox(height: 20.0),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: () {
                        if (_formkey.currentState!.validate()) {
                          SignUpController.instance.registerUser(
                              controller.email.text.trim(),
                              controller.password.text.trim());
                        }
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const updateprofilescreen()),
                        );
                      },
                      child: Text("SIGNUP")),
                ),
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
