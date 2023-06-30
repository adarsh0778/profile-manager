import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_page/profilecontroller.dart';
import 'package:login_page/user_model.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class updateprofilescreen extends StatelessWidget {
  const updateprofilescreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProfileController());
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () => Get.back(),
            icon: const Icon(LineAwesomeIcons.angle_left)),
        title: Text("Edit Profile"),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(30.0),
          child: FutureBuilder(
            future: controller.getUserData(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.hasData) {
                  UserModel userData = snapshot.data as UserModel;
                  final fullName =
                      TextEditingController(text: userData.fullName);
                  final email = TextEditingController(text: userData.email);
                  final password =
                      TextEditingController(text: userData.password);

                  return Column(
                    children: [
                      Stack(children: [
                        SizedBox(
                          width: 120,
                          height: 120,
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(100),
                              child: const Image(
                                image: AssetImage("assets/images/yash.jpg"))
                                ),
                        ),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: Container(
                            width: 35,
                            height: 35,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                color: Color(0xFFFFE400)),
                            child: const Icon(LineAwesomeIcons.camera,
                                color: Colors.black, size: 20),
                          ),
                        ),
                      ]),
                      const SizedBox(height: 50),
                      Form(
                          child: Column(
                        children: [
                          TextFormField(
                            controller: fullName,
                            decoration: const InputDecoration(
                                label: Text("Full Name"),
                                prefixIcon: Icon(LineAwesomeIcons.user)),
                          ),
                          const SizedBox(height: 10.0),
                          TextFormField(
                            controller: email,
                            decoration: const InputDecoration(
                                label: Text("E-mail"),
                                prefixIcon: Icon(LineAwesomeIcons.envelope_1)),
                          ),
                          const SizedBox(height: 10.0),
                          TextFormField(
                            controller: password,
                            obscureText: true,
                            decoration: const InputDecoration(
                              label: Text("Password"),
                              prefixIcon: Icon(Icons.fingerprint),
                            ),
                          ),

                          const SizedBox(height: 30.0),
                          ////-form submit button
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: () async {
                                final userData = UserModel(
                                  fullName: fullName.text.trim(),
                                  email: email.text.trim(),
                                  password: password.text.trim(),
                                );
                                await controller.updateRecord(userData);
                              },
                              style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                      Colors.redAccent.withOpacity(0.1),
                                  elevation: 0,
                                  foregroundColor: Colors.red,
                                  shape: const StadiumBorder(),
                                  side: BorderSide.none),
                              child: const Text("Delete"),
                            ),
                          )
                        ],
                      ))
                    ],
                  );
                } else if (snapshot.hasError) {
                  return Center(child: Text(snapshot.error.toString()));
                } else {
                  return const Center(child: Text('Something went wrong'));
                }
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            },
          ),
        ),
      ),
    );
  }
}
