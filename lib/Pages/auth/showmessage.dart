import 'package:flutter/material.dart';

void showmessage(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      content: Center(
        child: Container(
          padding:
              const EdgeInsets.only(left: 15, right: 15, top: 10, bottom: 10),
          decoration: BoxDecoration(
              color: const Color.fromARGB(255, 134, 134, 134),
              borderRadius: BorderRadius.circular(7)),
          child: Text(
            message,
            textAlign: TextAlign.center,
            style: const TextStyle(
                color: Color.fromARGB(255, 255, 255, 255), fontSize: 13.5),
          ),
        ),
      ),
      duration: const Duration(seconds: 2),
    ),
  );
}

void loading(context) {
  showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: const Center(
            child: CircularProgressIndicator(),
          ),
        );
      });
}

void dialogue(context, title, content) {
  showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(title),
          content: Text(content),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text("Ok"))
          ],
        );
      });
}
