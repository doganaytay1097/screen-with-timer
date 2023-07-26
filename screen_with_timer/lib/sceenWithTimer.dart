import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'lastScreen.dart';




class ScreenWithTimer extends StatefulWidget {
  String? phoneNumber;
  ScreenWithTimer({this.phoneNumber});

  @override
  State<ScreenWithTimer> createState() => _ScreenWithTimerState();
}

class _ScreenWithTimerState extends State<ScreenWithTimer> {
  final _textEditingController = TextEditingController();
  late int seconds;
  late Timer timer;
  Color mainColor = Colors.black;
  Color buttonColor = Colors.grey;
  Color borderColor = Colors.grey;
  String resend = "Continue";
  int permission = 0;

  @override
  void initState() {
    super.initState();

    seconds = 20;
    timer = Timer.periodic(const Duration(seconds: 1), tick);
  }

  void tick(Timer time) {
    setState(() {
      if (seconds > 1) {
        seconds--;
      } else {
        seconds = 0;
        mainColor = Colors.red;
        borderColor = Colors.grey;
        buttonColor = Colors.black;
        resend = "Resend";
        permission = 2;
      }
    });
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: const Text("PERSONNAL INFORMATION SYSTEM"),
        backgroundColor: Colors.green,
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Container(
        padding: const EdgeInsets.all(80),
        alignment: Alignment.center,
        child: Column(
          children: [
            Text(
              "Please enter the verification code sent to your mobile phone number with ${widget.phoneNumber}",
            ),
            const SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.alarm, color: mainColor),
                const Padding(padding: EdgeInsets.symmetric(horizontal: 2)),
                Text("$seconds", style: TextStyle(color: mainColor)),
              ],
            ),
            const Flexible(child: SizedBox(height: 40)),
            Container(
              child: TextField(
                controller: _textEditingController,
                onChanged: (String value) {
                  int charachterCount = value.length;
                  if (seconds > 0) {
                    if (charachterCount < 6) {
                      setState(() {
                        borderColor = Colors.red;
                        buttonColor = Colors.grey;
                        permission = 0;
                      });
                    } else {
                      setState(() {
                        borderColor = Colors.green;
                        buttonColor = Colors.black;
                        permission = 1;
                      });
                    }
                  }
                },
                maxLength: 6,
                keyboardType: TextInputType.number,
                decoration:  InputDecoration(

                  border: const OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: borderColor),
                  ),
                  floatingLabelStyle:  TextStyle(color: borderColor),
                  labelText: 'SMS CODE',
                ),
              ),
            ),
            const Flexible(child: SizedBox(height: 60)),
            Container(
              width: 130,
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(buttonColor) ,
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20))),
                ),
                onPressed: () {
                  if (permission == 0) {
                    null;
                  } else if (permission == 1) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const LastScreen()),
                    );
                  } else {
                    setState(() {
                      mainColor = Colors.black;
                      seconds = 20;
                      resend = "Continue";
                      buttonColor = Colors.grey;
                      _textEditingController.clear();
                    });
                  }
                },
                child: Text("$resend"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}