// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({Key? key}) : super(key: key);

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 70,
      height: 56,
      textStyle: TextStyle(
          fontSize: 20,
          color: Color.fromRGBO(30, 60, 87, 1),
          fontWeight: FontWeight.w600),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(20),
      ),
    );
    // ignore: unused_local_variable
    var code = "";
    var phone = "+91 1234567899";
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: 60),
        child: SingleChildScrollView(
          child: Column(
            // mainAxisSize: MainAxisSize.min, // Set to min
            children: [
              Text(
                "Log in",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 30,
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Align(
                  alignment: Alignment.center,
                  child: Image.asset(
                    "assets/images/logo.jpg",
                    width: 200,
                    height: 200,
                  ),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Text(
                "OTP sent to \n $phone",
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 30,
              ),

              Pinput(
                defaultPinTheme: defaultPinTheme,
                showCursor: true,
                length: 4,
                onChanged: (value) {
                  code = value;
                },
              ),

              SizedBox(
                height: 50,
              ),
              Container(
                height: 50,
                width: 280,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    textStyle: const TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontStyle: FontStyle.normal),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(25))),
                  ),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (ctx) => AlertDialog(
                        title: const Text("Your details has been submitted !"),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Container(
                              color: Colors.red,
                              padding: const EdgeInsets.all(14),
                              child: const Text(
                                "okay",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                  child: Text('Verify OTP'),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Text(
                "By signing up, you agree with our Terms \n and Conditions.",
                textAlign: TextAlign.center, // Center align text
                style: TextStyle(fontSize: 15, color: Colors.grey),
              ) // Centered text
            ],
          ),
        ),
      ),
    );
  }
}
