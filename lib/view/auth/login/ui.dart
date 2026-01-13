import 'package:e_buy/constants/Colors.dart';
import 'package:e_buy/constants/SizeBox.dart';
import 'package:e_buy/utils/widget/commonButton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../constants/images.dart';
import '../../../utils/widget/TextField.dart';
import '../register/ui.dart';

class LoginScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController EmailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BgColor,
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Center(child: Image.asset(logo1, height: 150, width: 200)),
              Text("Welcome to ShoshojBuy", style: TextStyle(fontSize: 24)),
              Text('sign in to continue'),
              SizedBox(height: 15),
              Textfields(
                validator: (value) {if (value == null || value.isEmpty) {
                  return "Email cannot be empty";
                }
                if (!GetUtils.isEmail(value)) {
                  return "Enter a valid email";
                }
                return null;},
                HintText: 'Email',
                Controller: EmailController, suffixIcon: Icon(Icons.email, color: Colors.grey),
              ),
              SizedBox(height: spaceBtwFields),
              Textfields(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Password cannot be empty";
                  }
                  if (value.length < 6) {
                    return "Password must be at least 6 characters";
                  }
                  return null;
                },
                HintText: "Password",
                Controller: passwordController, suffixIcon: Icon(Icons.remove_red_eye, color: Colors.grey),
              ),
              SizedBox(height: spaceBtwItem),
              CommonButton(
                child: Text("Login", style: TextStyle(fontSize: 16)),
                onTap: () {
                  if (_formKey.currentState!.validate()) ;
                },
              ),
              SizedBox(height: spaceBtwSection),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("OR"),
                  SizedBox(height: spaceBtwItem),
                ],
              ),
              Image.asset(googleLogin),
              Image.asset(facebookLogin),
              Text(
                "forgot password?",
                style: TextStyle(fontSize: 16, color: PrimaryColor),
              ),
              SizedBox(height: spaceBtwItem),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Dont have account ?", style: TextStyle(fontSize: 16)),
                  InkWell(
                    onTap: () {
                      Get.to(()=>RegistrationScreen());
                    },
                    child: Text(
                      "Register",
                      style: TextStyle(fontSize: 16, color: PrimaryColor),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
