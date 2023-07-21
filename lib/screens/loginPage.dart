import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:matrimony_app/screens/otpPage.dart';

class loginPage extends StatefulWidget {
  const loginPage({Key? key}) : super(key: key);

  static String verify = "";

  @override
  State<loginPage> createState() => _loginPageState();
}

class _loginPageState extends State<loginPage> {
  final phoneController = TextEditingController();
  final countryCode = TextEditingController();
  var phone = "";

  @override
  void initState() {
    countryCode.text = '+91';
    super.initState();
  }

  @override
  void dispose() {
    phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

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
              child: Column(
                children: [
                  SizedBox(
                    height: height * 0.075,
                  ),
                  Text(
                    'Register',
                    style: TextStyle(fontSize: 38, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: height * 0.11),
                  Container(
                    width: width * 0.8,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                        borderRadius: BorderRadius.circular(10)),
                    child: TextField(
                      controller: phoneController,
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                          hintText: "Enter your 10 digit number",
                          prefixIcon: Icon(Icons.phone),
                          border: InputBorder.none),
                    ),
                  ),
                  SizedBox(
                    height: height * 0.1,
                  ),
                  Container(
                      width: width * 0.7,
                      child: ElevatedButton(
                        onPressed: () async {
                          await FirebaseAuth.instance.verifyPhoneNumber(
                            phoneNumber: "+91" + phoneController.text,
                            verificationCompleted:
                                (PhoneAuthCredential credential) {},
                            verificationFailed: (FirebaseAuthException e) {},
                            codeSent:
                                (String verificationId, int? resendToken) {
                              loginPage.verify = verificationId;
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => otpPage()));
                            },
                            codeAutoRetrievalTimeout:
                                (String verificationId) {},
                          );
                        },
                        child: Text(
                          "Sent OTP",
                          style: TextStyle(color: Colors.black87),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFFE1838A),
                        ),
                      )),
                  SizedBox(
                    height: height * 0.1,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Flexible(
                            child: Container(
                          height: 1,
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  begin: Alignment.centerRight,
                                  end: Alignment.centerLeft,
                                  colors: [Colors.grey, Colors.white])),
                        )),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          child: Text("Or"),
                        ),
                        Flexible(
                          child: Container(
                            height: 1,
                            decoration: BoxDecoration(
                                gradient: LinearGradient(
                                    begin: Alignment.centerLeft,
                                    end: Alignment.centerRight,
                                    colors: [Colors.grey, Colors.white])),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  Container(
                    height: height * 0.04,
                    width: width * 0.66,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: Colors.grey)),
                    child: Center(
                        child: Text(
                      'Sign up with Google',
                      style: TextStyle(fontSize: 14),
                    )),
                  ),
                  SizedBox(height: height * 0.02),
                  Container(
                    height: height * 0.04,
                    width: width * 0.66,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: Colors.grey)),
                    child: Center(
                        child: Text(
                      'Sign up with Email',
                      style: TextStyle(fontSize: 14),
                    )),
                  )
                ],
              ),
            ),
          ),
        )
      ],
    ));
  }
}
