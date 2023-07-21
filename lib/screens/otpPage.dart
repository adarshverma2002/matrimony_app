import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:matrimony_app/screens/homePage.dart';
import 'package:pinput/pinput.dart';

class otpPage extends StatefulWidget {
  const otpPage({Key? key}) : super(key: key);

  @override
  State<otpPage> createState() => _otpPageState();
}

class _otpPageState extends State<otpPage> {
  final FirebaseAuth auth = FirebaseAuth.instance;

  final otpController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var code = "";

    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'assets/back2.jpg',
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          Center(
            child: SafeArea(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.05,
                      ),
                      Text(
                        'Please Enter Your OTP For Verification',
                        style: TextStyle(
                            fontSize: 23, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.2,
                      ),
                      Pinput(
                        controller: otpController,
                        length: 6,
                        onChanged: (value) {
                          code = value;
                        },
                        defaultPinTheme: defaultPinTheme,
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.42,
                      ),
                      Container(
                          width: MediaQuery.of(context).size.width * 0.7,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => homePage()));
                              // Create a PhoneAuthCredential with the code
                              // PhoneAuthCredential credential =
                              //     PhoneAuthProvider.credential(
                              //         verificationId: loginPage.verify,
                              //         smsCode: code);
                              //
                              // // Sign the user in (or link) with the credential
                              // await auth.signInWithCredential(credential);
                            },
                            child: Text(
                              "Verify",
                              style: TextStyle(color: Colors.black87),
                            ),
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Color(0xFFE1838A)),
                          ))
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

final defaultPinTheme = PinTheme(
  width: 60,
  height: 60,
  textStyle: TextStyle(
      fontSize: 20,
      color: Color.fromRGBO(30, 60, 87, 1),
      fontWeight: FontWeight.w600),
  decoration: BoxDecoration(
    border: Border.all(color: Colors.black87),
    borderRadius: BorderRadius.circular(20),
  ),
);
