import 'package:apms_project/Utils/color_theme.dart';
import 'package:apms_project/Utils/responsive_util.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  late MediaQueryData mediaQuery;

  @override
  Widget build(BuildContext context) {
    mediaQuery = MediaQuery.of(context);
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        color: ColorTheme.whiteTheme,
        child: Stack(
          children: [
            Positioned(
              top: 0,
              child: Container(
                height: ResponsiveUtils.screenHeight(context)*0.4,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(1),
                ),
                child: Image(
                  width: ResponsiveUtils.screenWidth(context),
                  fit: BoxFit.cover,
                  image: const AssetImage("assets/images/landing_page4.jpeg"),
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
      height: ResponsiveUtils.screenHeight(context)*0.74,
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
        const Text(
          "Get Started",
          style: TextStyle(
            fontSize: FontTheme.headingSize,
            fontWeight: FontTheme.headingWeight,
          ),
        ),
        SizedBox(height: mediaQuery.size.width * 0.08),
        const TextField(
          keyboardType: TextInputType.text,
          decoration: InputDecoration(
            prefixIcon: Icon(Icons.person),
            labelText: "Name",
            hintText: "Please enter your full-name",
            filled: true,
          ),
        ),
        SizedBox(height: mediaQuery.size.width * 0.04),
        const TextField(
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            prefixIcon: Icon(Icons.email_rounded),
            labelText: "Email",
            hintText: "Please Enter your Email Address",
            filled: true,
          ),
        ),
        SizedBox(height: mediaQuery.size.width * 0.04),
        const TextField(
          keyboardType: TextInputType.phone,
          decoration: InputDecoration(
            prefixIcon: Icon(Icons.phone),
            labelText: "Phone",
            hintText: "Ex. 98XXXXXXXX",
            filled: true,
          ),
        ),
        SizedBox(height: mediaQuery.size.width * 0.04),
        const TextField(
          obscureText: true,
          enableSuggestions: false,
          decoration: InputDecoration(
            prefixIcon: Icon(Icons.password_rounded),
            labelText: "Password",
            hintText: "Enter Password",
            filled: true,
            suffixIcon: Icon(Icons.remove_red_eye_rounded),
          ),
        ),
        SizedBox(height: mediaQuery.size.width * 0.18),
        SizedBox(
          height: 40,
          width: 130,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: ColorTheme.neogreenTheme,
              foregroundColor: ColorTheme.blackTheme,
            ),
            onPressed: () {
              Navigator.pushReplacementNamed(context, "/screen");
            },
            child: Text(
              "Register".toUpperCase(),
              textAlign: TextAlign.center,
              style: const TextStyle(
                  fontWeight: FontTheme.subheadingWeight,
                  fontSize: FontTheme.buttonFontSize),
            ),
          ),
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Already have account? ",
              style: TextStyle(
                  fontSize: FontTheme.subheadingSize,
                  color: ColorTheme.grayTheme),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushReplacementNamed(context, "/login");
              },
              child: const Text(
                "Login",
                style: TextStyle(
                    fontSize: FontTheme.subheadingSize,
                    color: ColorTheme.blueTheme),
              ),
            )
          ],
        )
      ],
    );
  }
}
