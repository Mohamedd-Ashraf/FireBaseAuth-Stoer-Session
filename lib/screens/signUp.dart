import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../components/CustomButton.dart';
import '../components/CustomTextFormField.dart';
import '../dataprovider/remote/firebase_auth_helper.dart';
import 'home.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController userNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 15.0),
          child: Column(
            children: [
              Form(
                key: formKey,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Create new account",
                        style: TextStyle(
                            color: Colors.deepPurple,
                            fontSize: 40,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomTextFormField(
                          textController: userNameController,
                          hintText: "username",
                          errorText: " Please enter your name ",
                          icons: Icons.person),
                      CustomTextFormField(
                          textController: emailController,
                          hintText: "email",
                          errorText: " Please enter your email ",
                          icons: Icons.mail),
                      CustomTextFormField(
                          textController: passwordController,
                          hintText: "password",
                          errorText: " Please enter your password ",
                          icons: Icons.lock),
                      CustomButton(text: "Sign Up", onTapAction: signUpAction),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }

  void signUpAction() async {
    // if (formKey.currentState!.validate()) {
    // showDialog(
    //     context: context,
    //     builder: (context) {
    //       return Center(child: const CircularProgressIndicator());
    //     });
    // }
    await FireBaseHelper()
        .SignUp(userNameController.text.toString(),
            passwordController.text.toString(), emailController.text.toString())
        .then((value) => {
              if (value is User)
                {
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => Home())),
                }
              else if (value is String)
                {
                  // Navigator.of(context).pop(),
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text(value),
                    backgroundColor: Colors.red,
                  ))
                }
            });
  }
}
