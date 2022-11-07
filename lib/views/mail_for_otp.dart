import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:product_dev/services/service_imp.dart';
import 'package:product_dev/services/services.dart';
import 'package:product_dev/views/login_page.dart';

class MailOtp extends StatefulWidget {
  const MailOtp({Key? key}) : super(key: key);

  @override
  _MailOtpState createState() => _MailOtpState();
}

class _MailOtpState extends State<MailOtp> {
  Services imp = new ServiceImp();

  var enteredmail = '';
  var newtext;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Reset Password"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.fromLTRB(30.0, 50.0, 30.0, 0),
          child: Column(
            children: [
              SizedBox(
                height: 48.0,
              ),
              TextFormField(
                onChanged: (newtext2) {
                  enteredmail = newtext2;
                },
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  hintText: 'Enter your e-mail address',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.mail),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Container(
                width: double.infinity,
                height: 54.0,
                child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.blue),
                      shape: MaterialStateProperty.all(StadiumBorder())),
                  onPressed: () {
                    bool emailValid = RegExp(
                            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                        .hasMatch(enteredmail);

                    if (enteredmail == '') {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text("Fill the field properly"),
                        backgroundColor: Colors.blue,
                      ));
                    } else {
                      if (emailValid == true) {
                        try {
                          imp.resetPass(email: enteredmail);
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text("Reset link is sent to your mail"),
                            backgroundColor: Colors.blue,
                          ));
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Login()),
                          );
                        } on FirebaseException catch (e) {
                          print(e);
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text(e.toString()),
                            backgroundColor: Colors.blue,
                          ));
                        }
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text("Enter a valid Mail-Id"),
                          backgroundColor: Colors.blue,
                        ));
                      }
                    }
                  },
                  child: Text(
                    'Reset Password',
                    style: TextStyle(color: Colors.white, fontSize: 25.0),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
