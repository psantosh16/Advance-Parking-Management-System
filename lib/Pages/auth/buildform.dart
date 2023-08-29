import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../Utils/color_theme.dart';
import '../../Utils/responsive_util.dart';
// ignore: must_be_immutable
class Buildform extends StatelessWidget {
  Buildform({super.key});
  File? file;
  ImagePicker image = ImagePicker();
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
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
