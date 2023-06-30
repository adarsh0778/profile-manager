import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:login_page/user_model.dart';
import 'package:login_page/user_repository.dart';
import 'authentication_repository.dart';

class SignUpController extends GetxController {
  static SignUpController get instance => Get.find();

  final email = TextEditingController();
  final password = TextEditingController();
  final fullName = TextEditingController();

  final userRepo = Get.put(UserRepository());

  void registerUser(String email, String password) {
    String? error = AuthenticationRepository.instance.createUserWithEmailAndPassword(email, password) as String;
    if (error != null){
      Get.showSnackbar(GetSnackBar(message: error.toString()));
    }
  }

  Future<void> createUser(UserModel user) async{
    await userRepo.createUser(user);
  }
}
