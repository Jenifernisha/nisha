
import 'package:email_otp/email_otp.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: EmailotpScreen(),
  ));
}

  class EmailotpScreen extends StatefulWidget {
  const EmailotpScreen ({Key? key}) : super(key: key);

  @override
  State<EmailotpScreen> createState() => _EmailotpScreenState();
  }

  class _EmailotpScreenState extends State<EmailotpScreen> {

  TextEditingController email= new TextEditingController();
  TextEditingController otp = new TextEditingController();
  EmailOTP myauth = EmailOTP();

  @override
  Widget build(BuildContext context) {
  return Scaffold(
  body: Container(
  child: Padding(padding: const EdgeInsets.all(15),
  child: Column(
  mainAxisAlignment: MainAxisAlignment.center,
  children: [
  Card(
     child: Column(
      children: [
      Padding(padding: const EdgeInsets.all(10.0),
  child: TextFormField(
  controller: email,
  decoration: const InputDecoration(hintText: "User Email")),



  ),
  ElevatedButton(onPressed:()async{

  myauth.setConfig(
  appEmail: "oisci01364@gmail.com",
  appName: "EmailOTP",
  userEmail: email.text,
  otpLength: 6,
 // otpType: OTPType.digitsOnly
  );
  if (await myauth.sendOTP() == true) {
  ScaffoldMessenger.of(context).showSnackBar(
  const SnackBar(
  content: Text("OTP has been sent",style:TextStyle(fontSize:25)),
  ));
  } else {
  ScaffoldMessenger.of(context).showSnackBar(
  const SnackBar(
  content: Text("OTP send failed"),
  ));
  }
  },
  child: const Text("Send OTP")),
  ],
  ),
  ),

  Card(
  child:Column(
  children: [
  Padding(padding: const EdgeInsets.all(8.0),
  child: TextFormField(controller: otp,decoration: const InputDecoration(hintText: "Enter OTP")),
  ),

  ElevatedButton(
  onPressed: () async {
  if (await myauth.verifyOTP(otp: otp.text) == true) {
  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
  content: Text("OTP is verified",
    style: TextStyle(fontSize:25)),
  ));
  }
  else
  {
  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
  content: Text("Invalid OTP",
    style:  TextStyle(fontSize:25)),
  ));
  }
  },
  child:const Text("Verify")),
  ],
  ),
  ),
  ],
  ),
  ),
  ),
  );
  }
  }







