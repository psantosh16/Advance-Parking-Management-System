// ignore_for_file: use_build_context_synchronously

import 'package:apms_project/Pages/auth/showmessage.dart';
import 'package:apms_project/Utils/color_theme.dart';
import 'package:apms_project/Utils/responsive_util.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String email = "", pass = "";
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Container(
          color: ColorTheme.whiteTheme,
          child: Stack(
            children: [
              Positioned(
                top: 0,
                child: SizedBox(
                  height: ResponsiveUtils.screenHeight(context) * 0.4,
                  child: Image(
                    width: ResponsiveUtils.screenWidth(context) * 1.3,
                    fit: BoxFit.cover,
                    image: const AssetImage("assets/images/landing_page.webp"),
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                child: _buildBottom(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBottom() {
    return SizedBox(
      width: ResponsiveUtils.screenWidth(context),
      height: ResponsiveUtils.screenHeight(context) * 0.65,
      child: Card(
        margin: const EdgeInsets.all(0),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(30),
            topLeft: Radius.circular(30),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: _buildForm(),
        ),
      ),
    );
  }

  Widget _buildForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // Greeting Text
        SizedBox(
          height: ResponsiveUtils.screenHeight(context) * 0.01,
        ),
        Text(
          "Welcome,back!",
          style: TextStyle(
            fontSize: ResponsiveUtils.textScaleFactor(context) * 35,
            fontWeight: FontTheme.headingWeight,
          ),
        ),
        Text(
          "Please login with your information",
          style: TextStyle(
            fontWeight: FontTheme.subheadingWeight,
            fontSize: ResponsiveUtils.textScaleFactor(context) * 14,
            color: ColorTheme.grayTheme,
          ),
        ),

        // Login Form
        SizedBox(
          height: ResponsiveUtils.screenHeight(context) * 0.06,
        ),
        Container(
          height: 50,
          padding: const EdgeInsets.only(top: 5),
          decoration: BoxDecoration(
            color: ColorTheme.textfield,
            borderRadius: BorderRadius.circular(7),
          ),
          child: TextField(
            onChanged: (value) => email = value,
            cursorColor: const Color.fromARGB(55, 97, 97, 97),
            keyboardType: TextInputType.emailAddress,
            style: const TextStyle(
              color: ColorTheme.nearBlack,
              fontWeight: FontWeight.bold,
              fontFamily: "roboto",
              fontSize: 16,
            ),
            decoration: const InputDecoration(
              hintStyle: TextStyle(
                color: ColorTheme.nearBlack,
                fontWeight: FontWeight.bold,
                fontSize: 16,
                fontFamily: 'roboto',
              ),
              prefixIcon: Icon(
                Icons.person,
                color: Color.fromARGB(115, 0, 0, 0),
              ),
              hintText: 'Enter Email',
              border: InputBorder.none,
              contentPadding: EdgeInsets.all(10),
            ),
          ),
        ),
        SizedBox(
          height: ResponsiveUtils.screenHeight(context) * 0.02,
        ),
        Container(
          height: 50,
          padding: const EdgeInsets.only(top: 5),
          decoration: BoxDecoration(
            color: ColorTheme.textfield,
            borderRadius: BorderRadius.circular(7),
          ),
          child: TextField(
            onChanged: (value) => pass = value,
            obscureText: true,
            cursorColor: const Color.fromARGB(55, 97, 97, 97),
            keyboardType: TextInputType.name,
            style: const TextStyle(
              fontFamily: "roboto",
              color: ColorTheme.nearBlack,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
            decoration: const InputDecoration(
              hintStyle: TextStyle(
                color: ColorTheme.nearBlack,
                fontWeight: FontWeight.bold,
                fontSize: 16,
                fontFamily: 'roboto',
              ),
              prefixIcon: Icon(
                Icons.password_rounded,
                color: Color.fromARGB(115, 0, 0, 0),
              ),
              suffixIcon: Icon(
                Icons.remove_red_eye_rounded,
                color: Color.fromARGB(115, 0, 0, 0),
              ),
              hintText: 'Enter Password',
              border: InputBorder.none,
              contentPadding: EdgeInsets.all(10),
            ),
          ),
        ),

        // Login Button
        SizedBox(
          height: ResponsiveUtils.screenHeight(context) * 0.06,
        ),
        SizedBox(
          height: ResponsiveUtils.screenHeight(context) * 0.06,
          width: ResponsiveUtils.screenWidth(context) * 0.35,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: ColorTheme.neogreenTheme,
              foregroundColor: ColorTheme.blackTheme,
            ),
            onPressed: () async {
              if (email == "" || pass == "") {
                dialogue(context, "Error", "Please fill all the details");
              } else {
                loading(context);
                try {
                  await FirebaseAuth.instance
                      .signInWithEmailAndPassword(email: email, password: pass);
                  Navigator.pop(context);
                  await Navigator.pushReplacementNamed(context, "/screen");
                  dialogue(context, "Success", "Login Successful");
                } on FirebaseAuthException catch (e) {
                  if (e.code == 'user-not-found') {
                    dialogue(context, "error", "no user found");
                  } else if (e.code == 'wrong-password') {
                    dialogue(context, "error", "wrong password");
                  }
                }
              }
            },
            child: Text(
              "Login".toUpperCase(),
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize:
                      ResponsiveUtils.screenWidth(context) > 600 ? 18 : 16),
            ),
          ),
        ),
        SizedBox(
          height: ResponsiveUtils.screenHeight(context) * 0.02,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Don't have account? ",
              style: TextStyle(
                  fontSize: ResponsiveUtils.textScaleFactor(context) * 16,
                  color: ColorTheme.grayTheme),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushReplacementNamed(context, "/register");
              },
              child: Text(
                "Register",
                style: TextStyle(
                    fontSize: ResponsiveUtils.textScaleFactor(context) * 16,
                    color: ColorTheme.blueTheme),
              ),
            )
          ],
        )
      ],
    );
  }
}
