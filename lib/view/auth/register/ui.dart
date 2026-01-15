import 'package:e_buy/constants/Colors.dart';
import 'package:e_buy/constants/SizeBox.dart';
import 'package:e_buy/utils/widget/TextField.dart';
import 'package:e_buy/utils/widget/commonButton.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:get/get.dart';
import '../../../constants/images.dart';
import '../../../controller/Register Controller/Register Controller.dart';
import '../../../model/Register Model/RegisterModel.dart';

class RegistrationScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final controller = Get.put(registerController());



  RegistrationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BgColor,
      // Obx ব্যবহার করে লোডিং স্টেট হ্যান্ডেল করা হয়েছে
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        return SingleChildScrollView( // কিবোর্ড আসলে যেন 'Bottom Overflow' না হয়
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(height: 40),
                  Center(child: Image.asset(logo1, height: 150, width: 200)),
                  const Text("Let's Get Started", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                  const Text('sign up to continue'),
                  const SizedBox(height: spaceBtwSection),

                  // Name Field
                  Textfields(
                    validator: (value) => (value == null || value.isEmpty) ? "Enter your full name" : null,
                    HintText: "Name",
                    Controller: controller.NameC,
                    prefixIcon: const Icon(Icons.person, color: Colors.grey),
                  ),
                  const SizedBox(height: spaceBtwFields),

                  // Email Field
                  Textfields(
                    validator: (value) => (value == null || !value.contains('@')) ? "Enter valid email" : null,
                    HintText: "Email",
                    Controller: controller.EmailC,
                    prefixIcon: const Icon(Icons.email, color: Colors.grey),
                  ),
                  const SizedBox(height: spaceBtwFields),

                  // Phone Field
                  Textfields(
                    validator: (value) => (value == null || value.isEmpty) ? "Enter phone number" : null,
                    HintText: "Phone",
                    Controller: controller.PhoneC,
                    prefixIcon: const Icon(Icons.phone, color: Colors.grey),
                  ),
                  const SizedBox(height: spaceBtwFields),

                  // Address Field
                  Textfields(
                    validator: (value) => (value == null || value.isEmpty) ? "Enter address" : null,
                    HintText: "Address",
                    Controller: controller.AddressC,
                    prefixIcon: const Icon(Icons.map, color: Colors.grey),
                  ),
                  const SizedBox(height: spaceBtwFields),

                  // Password Field
                  Textfields(
                    validator: (value) => (value == null || value.length < 6) ? "Password must be 6+ chars" : null,
                    HintText: "Password",
                    Controller: controller.PasswordC,
                    prefixIcon: const Icon(Icons.lock, color: Colors.grey),
                  ),

                  const SizedBox(height: spaceBtwSection),

                  CommonButton(
                    onTap: () {
                      if (_formKey.currentState!.validate()) {
                        controller.userRegister();
                      }
                    },
                    child: const Text("SignUp", style: TextStyle(fontSize: 16, color: Colors.white)),
                  ),

                  const SizedBox(height: spaceBtwSection),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Have an account..? ", style: TextStyle(fontSize: 16)),
                      InkWell(
                        onTap: () => Get.back(),
                        child:  Text("Sign In", style: TextStyle(fontSize: 16, color: PrimaryColor, fontWeight: FontWeight.bold)),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}

