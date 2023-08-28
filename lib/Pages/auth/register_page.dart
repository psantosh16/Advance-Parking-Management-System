import 'dart:io';

import 'package:apms_project/Utils/color_theme.dart';
import 'package:apms_project/Utils/responsive_util.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage>
    with WidgetsBindingObserver {
  File? file;
  ImagePicker image = ImagePicker();
  double _keyboardOffset = 0.0; // To store the keyboard offset
  final ScrollController _scrollController = ScrollController();
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeMetrics() {

    final keyboardHeight =
        // ignore: deprecated_member_use
        WidgetsBinding.instance.window.viewInsets.bottom;
    setState(() {
      if (keyboardHeight > 670) {
        _keyboardOffset = keyboardHeight / 2.55;
      } else if (keyboardHeight > 650) {
        _keyboardOffset = keyboardHeight / 2.1;
      } else {
        _keyboardOffset = keyboardHeight / 1.75;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false, // Add this line

        backgroundColor: Colors.transparent,
        body: Container(
          color: ColorTheme.whiteTheme,
          child: Stack(
            children: [
              Positioned(
                top: 0,
                child: Container(
                  height: ResponsiveUtils.screenHeight(context) * 0.4,
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
      ),
    );
  }

  Widget _buildBottom() {
    return SizedBox(
      width: ResponsiveUtils.screenWidth(context),
      height: ResponsiveUtils.screenHeight(context) * 0.76,
      child: Card(
        margin: const EdgeInsets.all(0),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(30),
            topLeft: Radius.circular(30),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.only(
              bottom: _keyboardOffset, left: 20, right: 20, top: 32),
          child: _buildForm(),
        ),
      ),
    );
  }

  Widget _buildForm() {
    return SingleChildScrollView(
      controller: _scrollController,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Get Started",
            style: TextStyle(
              fontSize: ResponsiveUtils.textScaleFactor(context) * 35,
              fontWeight: FontTheme.headingWeight,
            ),
          ),
          SizedBox(height: ResponsiveUtils.screenHeight(context) * 0.04),
          Container(
            height: 50,
            padding: const EdgeInsets.only(top: 5),
            decoration: BoxDecoration(
              color: const Color.fromARGB(131, 204, 204, 204),
              borderRadius: BorderRadius.circular(7),
            ),
            child: const TextField(
              cursorColor: Color.fromARGB(55, 97, 97, 97),
              keyboardType: TextInputType.name,
              style: TextStyle(
                fontFamily: "roboto",
                color: Color.fromARGB(255, 97, 97, 97),
                fontSize: 16,
              ),
              decoration: InputDecoration(
                hintStyle: TextStyle(
                  color: Color.fromARGB(255, 97, 97, 97),
                  fontSize: 16,
                  fontFamily: 'roboto',
                ),
                prefixIcon: Icon(
                  Icons.person,
                  color: Color.fromARGB(115, 0, 0, 0),
                ),
                hintText: 'Enter Name',
                border: InputBorder.none,
                contentPadding: EdgeInsets.all(10),
              ),
            ),
          ),
          SizedBox(height: ResponsiveUtils.screenHeight(context) * 0.02),
          Container(
            height: 50,
            padding: const EdgeInsets.only(top: 5),
            decoration: BoxDecoration(
              color: const Color.fromARGB(131, 204, 204, 204),
              borderRadius: BorderRadius.circular(7),
            ),
            child: const TextField(
              cursorColor: Color.fromARGB(55, 97, 97, 97),
              keyboardType: TextInputType.emailAddress,
              style: TextStyle(
                fontFamily: "roboto",
                color: Color.fromARGB(255, 97, 97, 97),
                fontSize: 16,
              ),
              decoration: InputDecoration(
                hintStyle: TextStyle(
                  color: Color.fromARGB(255, 97, 97, 97),
                  fontSize: 16,
                  fontFamily: 'roboto',
                ),
                prefixIcon: Icon(
                  Icons.email_rounded,
                  color: Color.fromARGB(115, 0, 0, 0),
                ),
                hintText: 'Enter Email',
                border: InputBorder.none,
                contentPadding: EdgeInsets.all(10),
              ),
            ),
          ),
          SizedBox(height: ResponsiveUtils.screenHeight(context) * 0.02),
          Container(
            height: 50,
            padding: const EdgeInsets.only(top: 5),
            decoration: BoxDecoration(
              color: const Color.fromARGB(131, 204, 204, 204),
              borderRadius: BorderRadius.circular(7),
            ),
            child: const TextField(
              cursorColor: Color.fromARGB(55, 97, 97, 97),
              keyboardType: TextInputType.phone,
              style: TextStyle(
                fontFamily: "roboto",
                color: Color.fromARGB(255, 97, 97, 97),
                fontSize: 16,
              ),
              decoration: InputDecoration(
                hintStyle: TextStyle(
                  color: Color.fromARGB(255, 97, 97, 97),
                  fontSize: 16,
                  fontFamily: 'roboto',
                ),
                prefixIcon: Icon(
                  Icons.phone,
                  color: Color.fromARGB(115, 0, 0, 0),
                ),
                hintText: 'Enter Phone',
                border: InputBorder.none,
                contentPadding: EdgeInsets.all(10),
              ),
            ),
          ),
          SizedBox(height: ResponsiveUtils.screenHeight(context) * 0.02),
          Container(
            height: 50,
            padding: const EdgeInsets.only(top: 5),
            decoration: BoxDecoration(
              color: const Color.fromARGB(131, 204, 204, 204),
              borderRadius: BorderRadius.circular(7),
            ),
            child: const TextField(
              obscureText: true,
              cursorColor: Color.fromARGB(55, 97, 97, 97),
              keyboardType: TextInputType.name,
              style: TextStyle(
                fontFamily: "roboto",
                color: Color.fromARGB(255, 97, 97, 97),
                fontSize: 16,
              ),
              decoration: InputDecoration(
                hintStyle: TextStyle(
                  color: Color.fromARGB(255, 97, 97, 97),
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
          SizedBox(height: ResponsiveUtils.screenHeight(context) * 0.02),
          Container(
            height: 50,
            padding: const EdgeInsets.only(top: 5),
            decoration: BoxDecoration(
              color: const Color.fromARGB(131, 204, 204, 204),
              borderRadius: BorderRadius.circular(7),
            ),
            child: const TextField(
              cursorColor: Color.fromARGB(55, 97, 97, 97),
              keyboardType: TextInputType.emailAddress,
              style: TextStyle(
                fontFamily: "roboto",
                color: Color.fromARGB(255, 97, 97, 97),
                fontSize: 16,
              ),
              decoration: InputDecoration(
                hintStyle: TextStyle(
                  color: Color.fromARGB(255, 97, 97, 97),
                  fontSize: 16,
                  fontFamily: 'roboto',
                ),
                prefixIcon: Icon(
                  Icons.numbers_outlined,
                  color: Color.fromARGB(115, 0, 0, 0),
                ),
                hintText: 'Primary Vehicle Number',
                border: InputBorder.none,
                contentPadding: EdgeInsets.all(10),
              ),
            ),
          ),
          SizedBox(height: ResponsiveUtils.screenHeight(context) * 0.03),
          Row(
            children: [
              SizedBox(
                height: ResponsiveUtils.screenHeight(context) * 0.06,
                width: ResponsiveUtils.screenWidth(context) * 0.4,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 206, 206, 206),
                      foregroundColor: ColorTheme.blackTheme,
                    ),
                    onPressed: () async {
                      // ignore: unused_local_variable
                      XFile? file =
                          await image.pickImage(source: ImageSource.gallery);
                    },
                    child: const Icon(
                      Icons.add_a_photo_outlined,
                      size: 25,
                    )),
              ),
              const Expanded(child: Text("")),
              SizedBox(
                  height: ResponsiveUtils.screenHeight(context) * 0.06,
                  width: ResponsiveUtils.screenWidth(context) * 0.4,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            const Color.fromARGB(255, 206, 206, 206),
                        foregroundColor: ColorTheme.blackTheme,
                      ),
                      onPressed: () async {
                        // ignore: unused_local_variable
                        XFile? file =
                            await image.pickImage(source: ImageSource.gallery);
                      },
                      child: const Icon(
                        Icons.add_card_outlined,
                        size: 25,
                      ))),
            ],
          ),
          SizedBox(height: ResponsiveUtils.screenHeight(context) * 0.03),
          SizedBox(
            height: ResponsiveUtils.screenHeight(context) * 0.06,
            width: ResponsiveUtils.screenWidth(context) * 0.4,
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
                    fontSize: FontTheme.buttonFontSize - 1.5),
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
                "Already have account? ",
                style: TextStyle(
                    fontSize: ResponsiveUtils.textScaleFactor(context) * 13.5,
                    color: const Color.fromARGB(255, 126, 126, 126)),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushReplacementNamed(context, "/login");
                },
                child: Text(
                  "Login",
                  style: TextStyle(
                      fontSize: ResponsiveUtils.textScaleFactor(context) * 15,
                      color: ColorTheme.blueTheme),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
