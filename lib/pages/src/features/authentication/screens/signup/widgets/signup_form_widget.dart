import 'package:flutter/material.dart';
import 'package:food_delivery/pages/src/features/authentication/models/user_model.dart';
import 'package:get/get.dart';
// import 'package:login_app/src/constants/sizes.dart';
// import 'package:login_app/src/features/authentication/controllers/signup_controller.dart';
// import 'package:login_app/src/features/authentication/models/user_model.dart';

import '../../../../../constants/colors.dart';
import '../../../../../constants/sizes.dart';
import '../../../../../constants/text_strings.dart';
import '../../../controllers/signup_controller.dart';

class SignupFormWidget extends StatefulWidget {
  const SignupFormWidget({
    super.key,
  });

  @override
  State<SignupFormWidget> createState() => _SignupFormWidgetState();
}

class _SignupFormWidgetState extends State<SignupFormWidget> {
  _MyFormState() {
    _selectedVal = _userTypeList[0];
  }

  final _userTypeList = ["Student", "Faculty", "Alumni"];
  String? _selectedVal = "Student";

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignUpController());
    final formKey = GlobalKey<FormState>();
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: formHeight - 10),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: defaultSize - 20),
              TextFormField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your full name.';
                  } else {
                    return null;
                  }
                },
                controller: controller.fullName,
                decoration: const InputDecoration(
                    labelText: "Full Name",
                    prefixIcon: Icon(
                      Icons.person_outline_outlined,
                      color: secondaryColor,
                    ),
                    border: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(width: 1.0, color: secondaryColor)),
                    labelStyle: TextStyle(color: secondaryColor)),
              ),
              const SizedBox(height: defaultSize - 20),
              TextFormField(
                validator: (value) {
                  if (value!.isEmpty || !value.contains('@')) {
                    return 'Please enter your email address.';
                  } else {
                    return null;
                  }
                },
                controller: controller.email,
                decoration: const InputDecoration(
                    labelText: "Email",
                    prefixIcon: Icon(
                      Icons.email_outlined,
                      color: secondaryColor,
                    ),
                    border: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(width: 1.0, color: secondaryColor)),
                    labelStyle: TextStyle(color: secondaryColor)),
              ),
              const SizedBox(height: defaultSize - 20),
              TextFormField(
                validator: (value) {
                  if (value!.isEmpty || value.length < 10) {
                    return 'Please enter your phoneNo. correctly.';
                  } else {
                    return null;
                  }
                },
                controller: controller.phoneNo,
                decoration: const InputDecoration(
                    labelText: "Phone No.",
                    prefixIcon: Icon(
                      Icons.numbers,
                      color: secondaryColor,
                    ),
                    border: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(width: 1.0, color: secondaryColor)),
                    labelStyle: TextStyle(color: secondaryColor)),
              ),
              const SizedBox(height: defaultSize - 20),
              TextFormField(
                obscureText: true,
                validator: (value) {
                  if (value!.isEmpty || value.length < 6) {
                    return 'Password length should of atleast 6 characters.';
                  } else {
                    return null;
                  }
                },
                controller: controller.password,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.fingerprint),
                  labelText: "Password",
                  hintText: "Password",
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(width: 1.0, color: secondaryColor)),
                  labelStyle: TextStyle(color: secondaryColor),
                  suffixIcon: IconButton(
                    onPressed: null,
                    icon: Icon(Icons.remove_red_eye_sharp),
                  ),
                ),
              ),
              const SizedBox(height: defaultSize),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    if (formKey.currentState?.validate() ?? false) {
                      final user = UserModel(
                        email: controller.email.text.trim(),
                        password: controller.password.text.trim(),
                        fullName: controller.fullName.text.trim(),
                        phoneNo: controller.phoneNo.text.trim(),
                      );
                      SignUpController.instance.createUser(user);
                    }
                  },
                  child: Text(signup.toUpperCase()),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
