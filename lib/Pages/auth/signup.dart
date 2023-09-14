import 'dart:io';

import 'package:apms_project/Pages/auth/showmessage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

import '../Screens/screen_page.dart';

Future<void> signup(context, name, email, phone, password, vehical, imageurl,
    uniquefilename) async {
  if (name == "" ||
      email == "" ||
      phone == "" ||
      password == "" ||
      vehical == "") {
    dialogue(context, "Error", "fill all the deatails ");
  } else if (imageurl == "") {
    dialogue(context, "Upload image", "upload your profile picture");
  } else {
    loading(context);
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      await FirebaseFirestore.instance
          .collection("users")
          .doc(FirebaseAuth.instance.currentUser?.uid)
          .set({
        "name": name,
        "email": email,
        "useid": FirebaseAuth.instance.currentUser?.uid,
        "phone": phone,
        "password": password,
        "vehical": vehical,
        "imageurl": imageurl,
        "uniquefilename": uniquefilename,
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        dialogue(context, "Error", "The password provided is too weak !");
      } else if (e.code == 'email-already-in-use') {
        dialogue(context, "Error", "Email already exists !");
      }
    } catch (e) {
      rethrow;
    }
    Navigator.of(context).pop();
    dialogue(context, "Success", "Registration Successful");
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const ScreenPage()));
  }
}

Future<String> uploadimage(context) async {
  FocusScope.of(context).requestFocus(FocusNode());

  PermissionStatus camerastatus = await Permission.camera.request();
  ImagePicker image = ImagePicker();
  String imageurl = "";
  String uniquefilename = DateTime.now().millisecondsSinceEpoch.toString();
  if (camerastatus.isGranted == true) {
    XFile? file = await image.pickImage(source: ImageSource.gallery);
    // ignore: use_build_context_synchronously
    loading(context);
    Reference referenceimagetoupload =
        FirebaseStorage.instance.ref().child('profiles').child(uniquefilename);
    UploadTask uploadTask = referenceimagetoupload.putFile(File(file!.path));
    uploadTask.whenComplete(() async {
      try {
        imageurl = await referenceimagetoupload.getDownloadURL();
      } catch (onError) {
        // ignore: avoid_print
        print("Error");
      }

      // ignore: use_build_context_synchronously
      Navigator.of(context).pop();
      // ignore: use_build_context_synchronously
      showmessage(context, "Profile Picture added Successfully!");
    });

    return imageurl;
  } else {
    dialogue(context, "Permission required",
        "allow camera permission to proceed further");
    return imageurl;
  }
}
