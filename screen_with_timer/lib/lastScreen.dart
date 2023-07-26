import 'package:flutter/material.dart';


class LastScreen extends StatelessWidget {
  const LastScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("PERSONNAL INFORMATION SYSTEM"),
        backgroundColor: Colors.green,
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 30,vertical: 170),
        alignment: Alignment.topCenter,
        child: Text(
          "Welcome New User!",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 48,
            color: Colors.grey[600],
          ),
        ),
      ),
    );
  }
}
