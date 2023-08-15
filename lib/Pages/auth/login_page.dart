import 'package:apms_project/Utils/color_theme.dart';
import 'package:apms_project/Utils/responsive_util.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
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
    );
  }

  Widget _buildBottom() {
    return SizedBox(
      width: ResponsiveUtils.screenWidth(context),
      height: ResponsiveUtils.screenHeight(context) * 0.7,
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
        const TextField(
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            filled: true,
            hintText: "Please enter valid Email",
            prefixIcon: Icon(Icons.email_rounded),
            labelText: "Email",
          ),
        ),
        SizedBox(
          height: ResponsiveUtils.screenHeight(context) * 0.02,
        ),
        const TextField(
          keyboardType: TextInputType.text,
          obscureText: true,
          decoration: InputDecoration(
            filled: true,
            hintText: "Please enter valid Password",
            prefixIcon: Icon(Icons.password),
            labelText: "Password",
            suffixIcon: Icon(Icons.remove_red_eye),
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
            onPressed: () {
              Navigator.pushReplacementNamed(context, "/screen");
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
                  fontSize: ResponsiveUtils.textScaleFactor(context)*16,
                  color: ColorTheme.grayTheme),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushReplacementNamed(context, "/register");
              },
              child:  Text(
                "Register",
                style: TextStyle(
                    fontSize: ResponsiveUtils.textScaleFactor(context)*16,
                    color: ColorTheme.blueTheme),
              ),
            )
          ],
        )
      ],
    );
  }
}
