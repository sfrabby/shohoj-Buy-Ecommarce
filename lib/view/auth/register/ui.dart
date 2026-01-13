import 'package:e_buy/constants/Colors.dart';
import 'package:e_buy/constants/SizeBox.dart';
import 'package:e_buy/utils/widget/TextField.dart';
import 'package:e_buy/utils/widget/commonButton.dart';
import 'package:flutter/material.dart';

import '../../../constants/images.dart';

class RegistrationScreen extends StatelessWidget {
  final TextEditingController NameC = TextEditingController();
  final TextEditingController EmailC = TextEditingController();
  final TextEditingController AddressC = TextEditingController();
  final TextEditingController PasswordC = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  RegistrationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BgColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsetsGeometry.all(20),
            child: Form(
              key: _formKey,

              child: Column(
                children: [
                  Center(child: Image.asset(logo1, height: 150, width: 200)),
                  Text("Let's Get Started", style: TextStyle(fontSize: 24)),
                  Text('sign up to continue'),
                  SizedBox(height: spaceBtwSection),
                  Textfields(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return " Enter your full name..";
                      }
                      return null;
                    },
                    HintText: " Name",
                    Controller: NameC,
                    prefixIcon: Icon(Icons.person, color: Colors.grey),
                  ),
                  SizedBox(height: spaceBtwFields),
                  Textfields(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter email address..";
                      }
                      return null;
                    },
                    HintText: "Email",
                    Controller: EmailC,
                    prefixIcon: Icon(Icons.email, color: Colors.grey),
                  ),
                  SizedBox(height: spaceBtwFields,),
                  Textfields(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter phone number..";
                      }
                      return null;
                    },
                    HintText: "Phone",
                    Controller: EmailC,
                    prefixIcon: Icon(Icons.phone, color: Colors.grey),
                  ),
                  SizedBox(height: spaceBtwFields,),
                  Textfields(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter address..";
                      }
                      return null;
                    },
                    HintText: "Address",
                    Controller: AddressC,
                    prefixIcon: Icon(Icons.map, color: Colors.grey),
                  ),
                  SizedBox(height: spaceBtwFields,),
                  Textfields(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter password..";
                      }
                      return null;
                    },
                    HintText: "Password",
                    Controller: AddressC,
                    prefixIcon: Icon(Icons.password  , color: Colors.grey),
                  ),


                  SizedBox(height: spaceBtwSection,),
                  CommonButton(child: Text("SignUp", style: TextStyle(fontSize: 16),), onTap: (){
                    if(_formKey.currentState!.validate()){}
                  }),
                  SizedBox(height: spaceBtwSection,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Have an account..?", style: TextStyle(fontSize: 16),),
                      Text("Sign In", style: TextStyle(fontSize: 16, color: PrimaryColor),)
                    ],
                  )




                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
