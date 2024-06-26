import 'package:bionic_tech/app/widgets/app_bar.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../controllers/auth_controller.dart';
import '../controllers/login_controller.dart';
import 'package:lottie/lottie.dart';

class LoginView extends GetView<LoginController> {
  LoginView({super.key});

  final authC = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(30),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: Get.width * 0.8,
                    height: Get.width * 0.8,
                    child: Lottie.asset(
                      "assets/lottie/login.json",
                    ),
                  ),
                  const SizedBox(height: 130),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: ElevatedButton(
                      onPressed: () => authC.login(),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.deepPurple[300],
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 50,
                            height: 50,
                            child: Image.asset(
                              "assets/images/google.png",
                            ),
                          ),
                          const SizedBox(width: 15),
                          const Text(
                            "Sign In with Google",
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const AppBarWidget(),
        ],
      ),
    );
  }
}
