import 'dart:ffi';

import 'package:apms_project/Theme/color_theme.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final String landingImage =
      "https://t3.ftcdn.net/jpg/03/10/60/54/360_F_310605413_AmMYhRKqNtbGpOyl7PGUabsmTiu4nL6o.webp";
  late MediaQueryData queryData;

  @override
  Widget build(BuildContext context) {
    queryData = MediaQuery.of(context);

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        color: ColorTheme.whiteTheme,
        child: Stack(
          children: [
            Positioned(
              top: 0,
              child: Container(
                height: queryData.size.height * 0.41,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(1),
                ),
                child: Image(
                  width: queryData.size.width * 1.13,
                  fit: BoxFit.cover,
                  image: NetworkImage(landingImage),
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
      width: queryData.size.width,
      height: queryData.size.height * 0.7,
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
        const SizedBox(
          height: 10,
        ),
        const Text(
          "Welcome,back!",
          style: TextStyle(
            fontSize: FontTheme.headingSize,
            fontWeight: FontTheme.headingWeight,
          ),
        ),
        const Text(
          "Please login with your information",
          style: TextStyle(
            fontWeight: FontTheme.subheadingWeight,
            fontSize: FontTheme.subheadingSize,
            color: ColorTheme.grayTheme,
          ),
        ),

        // Login Form
        const SizedBox(
          height: 60,
        ),
        _buildTextField(
          "Username",
          const Icon(Icons.person),
        ),
        const SizedBox(
          height: 20,
        ),
        _buildTextField("Password", const Icon(Icons.password),
            const Icon(Icons.remove_red_eye), true),

        // Login Button
        const SizedBox(
          height: 60,
        ),
        SizedBox(
          height: 50,
          width: 140,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: ColorTheme.neogreenTheme,
              foregroundColor: ColorTheme.blackTheme,
            ),
            onPressed: () {},
            child: Text(
              "Login".toUpperCase(),
              textAlign: TextAlign.center,
              style: const TextStyle(
                  fontWeight: FontTheme.subheadingWeight,
                  fontSize: FontTheme.buttonFontSize),
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Don't have account? ",
              style: TextStyle(
                  fontSize: FontTheme.subheadingSize,
                  color: ColorTheme.grayTheme),
            ),
            GestureDetector(
              onTap: () {},
              child: const Text(
                "Register",
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

  Widget _buildTextField(String label, Widget pIcon,
      [Widget? sIcon, bool isPassWord = false]) {
    return Column(
      children: [
        TextField(
          keyboardType: TextInputType.text,
          obscureText: isPassWord,
          decoration: InputDecoration(
            filled: true,
            prefixIcon: pIcon,
            labelText: label,
            suffixIcon: sIcon,
          ),
        )
      ],
    );
  }
}
