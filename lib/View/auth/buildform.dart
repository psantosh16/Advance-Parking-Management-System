import 'package:apms_project/View/auth/signup.dart';
import 'package:flutter/material.dart';
import '../../Utils/color_theme.dart';
import '../../Utils/responsive_util.dart';

class Buildform extends StatefulWidget {
  const Buildform({super.key});

  @override
  State<Buildform> createState() => _BuildformState();
}

class _BuildformState extends State<Buildform> {
  String uniquefilename = DateTime.now().millisecondsSinceEpoch.toString();
  final ScrollController _scrollController = ScrollController();
  String namecontroller = "",
      emailcontroller = "",
      phonecontroller = "",
      passcontroller = "",
      vehicalcontroller = "",
      imageurl = "";
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
              color: ColorTheme.textfield,
              borderRadius: BorderRadius.circular(7),
            ),
            child: TextField(
              onChanged: (value) => namecontroller = value,
              cursorColor: const Color.fromARGB(55, 97, 97, 97),
              keyboardType: TextInputType.name,
              style: const TextStyle(
                color: ColorTheme.nearBlack,
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
              color: ColorTheme.textfield,
              borderRadius: BorderRadius.circular(7),
            ),
            child: TextField(
              onChanged: (value) => emailcontroller = value,
              cursorColor: const Color.fromARGB(55, 97, 97, 97),
              keyboardType: TextInputType.emailAddress,
              style: const TextStyle(
                fontFamily: "roboto",
                color: ColorTheme.nearBlack,
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
              color: ColorTheme.textfield,
              borderRadius: BorderRadius.circular(7),
            ),
            child: TextField(
              onChanged: (value) => phonecontroller = value,
              cursorColor: const Color.fromARGB(55, 97, 97, 97),
              keyboardType: TextInputType.phone,
              style: const TextStyle(
                fontFamily: "roboto",
                color: ColorTheme.nearBlack,
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
              color: ColorTheme.textfield,
              borderRadius: BorderRadius.circular(7),
            ),
            child: TextField(
              onChanged: (value) => passcontroller = value,
              obscureText: true,
              cursorColor: const Color.fromARGB(55, 97, 97, 97),
              keyboardType: TextInputType.name,
              style: const TextStyle(
                fontFamily: "roboto",
                color: ColorTheme.nearBlack,
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
          SizedBox(height: ResponsiveUtils.screenHeight(context) * 0.02),
          Container(
            height: 50,
            padding: const EdgeInsets.only(top: 5),
            decoration: BoxDecoration(
              color: ColorTheme.textfield,
              borderRadius: BorderRadius.circular(7),
            ),
            child: TextField(
              onChanged: (value) => vehicalcontroller = value,
              cursorColor: const Color.fromARGB(55, 97, 97, 97),
              keyboardType: TextInputType.name,
              style: const TextStyle(
                fontFamily: "roboto",
                color: ColorTheme.nearBlack,
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
                      backgroundColor: const Color.fromARGB(131, 255, 255, 255),
                      foregroundColor: ColorTheme.blackTheme,
                    ),
                    onPressed: () async {
                      imageurl = await uploadimage(context);
                      print("imageurl :${imageurl}");
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
                            const Color.fromARGB(131, 255, 255, 255),
                        foregroundColor: ColorTheme.blackTheme,
                      ),
                      onPressed: () async {
                        // ignore: unused_local_variable
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
                signup(
                    context,
                    namecontroller,
                    emailcontroller,
                    phonecontroller,
                    passcontroller,
                    vehicalcontroller,
                    imageurl,
                    uniquefilename);
                // Navigator.pushReplacementNamed(context, "/screen"
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
