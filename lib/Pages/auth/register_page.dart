import 'package:apms_project/Pages/auth/buildform.dart';
import 'package:apms_project/Utils/color_theme.dart';
import 'package:apms_project/Utils/responsive_util.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage>
    with WidgetsBindingObserver {
  double _keyboardOffset = 0.0; // To store the keyboard offset
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
      } else if (keyboardHeight < 600 && keyboardHeight > 550) {
        _keyboardOffset = keyboardHeight / 2.4;
      } else if (keyboardHeight > 610) {
        _keyboardOffset = keyboardHeight / 1.8;
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
          child: const Buildform(),
        ),
      ),
    );
  }
}

// ignore: camel_case_types, must_be_immutable