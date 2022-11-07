import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:product_dev/services/service_imp.dart';
import 'package:product_dev/services/services.dart';
import 'package:product_dev/views/loggedIn_page.dart';

class RegisterNow extends StatefulWidget {
  const RegisterNow({Key? key}) : super(key: key);

  @override
  _RegisterNowState createState() => _RegisterNowState();
}

class _RegisterNowState extends State<RegisterNow> {
  Services imp = new ServiceImp();
  bool p = true;
  bool p1 = true;
  var openeye = Icons.remove_red_eye;
  var closeeye = Icons.visibility_off;
  var using = Icons.remove_red_eye;
  var using1 = Icons.remove_red_eye;

  var enteredmail1 = '';
  var enteredpass1 = '';
  var newtext1;
  var newpass1;
  var enteredpass2 = '';
  var newpass2;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("New Registration"),
        ),
        body: Padding(
          padding: EdgeInsets.fromLTRB(30.0, 50.0, 30.0, 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              SizedBox(
                height: 24,
              ),
              TextFormField(
                onChanged: (newtext1) {
                  enteredmail1 = newtext1;
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
              TextFormField(
                onChanged: (newpass1) {
                  enteredpass1 = newpass1;
                },
                obscureText: p,
                keyboardType: TextInputType.visiblePassword,
                decoration: InputDecoration(
                  hintText: 'Enter your Password',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.lock_outline_rounded),
                  suffixIcon: IconButton(
                      onPressed: () {
                        if (using == openeye) {
                          using = closeeye;
                        } else {
                          using = openeye;
                        }
                        setState(() {
                          if (p == false) {
                            p = true;
                          } else {
                            p = false;
                          }
                        });
                      },
                      icon: Icon(using)),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              TextFormField(
                onChanged: (newpass2) {
                  enteredpass2 = newpass2;
                },
                keyboardType: TextInputType.visiblePassword,
                obscureText: p1,
                decoration: InputDecoration(
                  hintText: 'Confirm Password',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.lock_outline_rounded),
                  suffixIcon: IconButton(
                      onPressed: () {
                        if (using1 == openeye) {
                          using1 = closeeye;
                        } else {
                          using1 = openeye;
                        }
                        setState(() {
                          if (p1 == false) {
                            p1 = true;
                          } else {
                            p1 = false;
                          }
                        });
                      },
                      icon: Icon(using1)),
                ),
              ),
              SizedBox(
                height: 48.0,
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
                        .hasMatch(enteredmail1);
                    if (enteredmail1 == '' ||
                        enteredpass1 == '' ||
                        enteredpass2 == '') {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text("Fill all the fields properly"),
                        backgroundColor: Colors.blue,
                      ));
                    } else {
                      if (emailValid == true) {
                        if (enteredpass2 == enteredpass1) {
                          try {
                            imp.signup(
                                mail: enteredmail1,
                                pass: enteredpass1,
                                name: "unknown");
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text("Registered Successfully"),
                              backgroundColor: Colors.blue,
                            ));
                            Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Logged()),
                                (Route<dynamic> route) => false);
                          } on FirebaseException catch (e) {
                            print(e);
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text(e.toString()),
                              backgroundColor: Colors.blue,
                            ));
                          }
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text("Passwords do not match"),
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
                    'Register',
                    style: TextStyle(color: Colors.white, fontSize: 25.0),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
