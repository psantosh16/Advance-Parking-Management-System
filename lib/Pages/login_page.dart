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
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // Container(
        //   width: queryData.size.width * 0.2,
        //   height: 8,
        //   decoration: const BoxDecoration(
        //     color: ColorTheme.grayTheme,
        //     borderRadius: BorderRadius.all(
        //       Radius.circular(12),
        //     ),
        //   ),
        // ),
        Text(
          "Welcome,back!",
          style: TextStyle(
            fontSize: FontTheme.headingSize,
            fontWeight: FontTheme.headingWeight,
          ),
        ),
        Text(
          "Please login with your information",
          style: TextStyle(
            fontWeight: FontTheme.subheadingWeight,
            fontSize: FontTheme.subheadingSize,
            color: ColorTheme.grayTheme,
          ),
        ),

      ],
    );
  }
}
