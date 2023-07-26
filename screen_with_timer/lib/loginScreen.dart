import 'package:flutter/material.dart';


import 'lastScreen.dart';
import 'sceenWithTimer.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    TextEditingController _textController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: const Text("PERSONNAL INFORMATION SYSTEM"),
        backgroundColor: Colors.green,
        centerTitle: true,
      ),
      body: Form(
        key: _formKey,
        child: Container(
          padding:
              const EdgeInsets.only(left: 40, top: 80, right: 40, bottom: 100),
          child: Center(
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child: TextField(
                    controller: _textController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.green),
                      ),
                      border: OutlineInputBorder(),
                      floatingLabelStyle: TextStyle(color: Colors.green),
                      labelText: 'Phone Number',
                    ),
                  ),
                ),
                Flexible(child: SizedBox(height: 40)),
                Flexible(
                  child: Container(
                    width: 105,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.black),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20))),
                      ),
                      onPressed: () {
                        if (_textController.text == "") {
                        } else {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ScreenWithTimer(
                                    phoneNumber: _textController.text)),
                          );
                        }
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('Login'),
                          const Icon(Icons.arrow_forward_rounded,
                              color: Colors.white),
                        ],
                      ),
                    ),
                  ),
                ),
                Flexible(child: SizedBox(height: 50)),
                Flexible(child: const Text("OR")),
                Flexible(child: SizedBox(height: 50)),
                Flexible(
                  child: Container(
                    width: 190,
                    child: ElevatedButton(
                      style: ButtonStyle(
                          side: MaterialStateProperty.all(BorderSide(width: 2)),
                          backgroundColor:
                              MaterialStateProperty.all(Colors.white),
                          shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)))),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LastScreen()),
                        );
                      },
                      child: const Text(
                        'Continue without login',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
