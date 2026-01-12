import 'package:e_buy/constants/Colors.dart';
import 'package:e_buy/constants/SizeBox.dart';
import 'package:e_buy/utils/widget/commonButton.dart';
import 'package:flutter/material.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';

import '../../../constants/images.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "please Inter your Email";
                  } else {
                    null;
                  }
                },
                cursorColor: PrimaryColor,
                decoration: InputDecoration(
                  hintText: 'Your Email',
                  hintStyle: TextStyle(color: Colors.grey),
                  prefixIcon: Icon(Icons.email_outlined, color: Colors.grey),
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 15,
                    horizontal: 20,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: PrimaryColor, width: 2),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: PrimaryColor, width: 2),
                  ),
                ),
              ),
              SizedBox(height: spaceBtwFields),
              TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "please Inter Password";
                  } else {
                    null;
                  }
                },
                cursorColor: PrimaryColor,
                decoration: InputDecoration(
                  hintText: 'Your Password',
                  hintStyle: TextStyle(color: Colors.grey),
                  suffixIcon: Icon(Icons.remove_red_eye, color: Colors.grey),
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 15,
                    horizontal: 20,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: PrimaryColor, width: 2),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: PrimaryColor, width: 2),
                  ),
                ),
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
                  Text(
                    "Register",
                    style: TextStyle(fontSize: 16, color: PrimaryColor),
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
