import 'package:alisons_flutter_test/controller/auth_controller.dart';
import 'package:alisons_flutter_test/services/api_services.dart';
import 'package:alisons_flutter_test/view/home_view/home_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginView extends StatelessWidget {
  final AuthController authController = Get.put(AuthController(ApiServices()));
  final TextEditingController emailPhoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Login',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 100,
                width: 100,
                margin: const EdgeInsets.only(bottom: 32),
                decoration: const BoxDecoration(
                  color: Colors.blueAccent,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.person,
                  size: 60,
                  color: Colors.white,
                ),
              ),
              TextField(
                controller: emailPhoneController,
                decoration: InputDecoration(
                  labelText: 'Email or Phone',
                  filled: true,
                  fillColor: Colors.white,
                  prefixIcon: Icon(Icons.email_rounded, color: Colors.blue),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: passwordController,
                decoration: InputDecoration(
                  labelText: 'Password',
                  filled: true,
                  fillColor: Colors.white,
                  prefixIcon: Icon(Icons.lock_rounded, color: Colors.blue),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),
                obscureText: true,
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: () async {
                  final success = await authController.login(
                    emailPhoneController.text,
                    passwordController.text,
                  );
                  if (success) {
                    Get.off(() => HomeView());
                  } else {
                    Get.snackbar(
                      'Error',
                      'Login failed. Please try again.',
                      snackPosition: SnackPosition.BOTTOM,
                      backgroundColor: Colors.redAccent,
                      colorText: Colors.white,
                      margin: const EdgeInsets.all(16),
                      borderRadius: 8,
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueAccent,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  elevation: 5,
                ),
                child: const Text(
                  'Login',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
