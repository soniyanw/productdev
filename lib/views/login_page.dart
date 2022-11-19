import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:product_dev/services/service_imp.dart';
import 'package:product_dev/services/services.dart';
import 'package:product_dev/views/loggedIn_page.dart';
import 'package:product_dev/views/mail_for_otp.dart';
import 'package:product_dev/views/registernow_page.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  Services imp = new ServiceImp();
  bool p = true;
  var openeye = Icons.remove_red_eye;
  var closeeye = Icons.visibility_off;
  var using = Icons.remove_red_eye;
  var enteredmail = '';
  var enteredpass = '';
  var newtext;
  var newpass;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/bgimage.jpeg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Padding(
            padding: EdgeInsets.fromLTRB(30.0, 50.0, 30.0, 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: Text(
                    'Foodzy-Dine',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 50.0,
                    ),
                  ),
                ),
                SizedBox(
                  height: 36.0,
                ),
                TextFormField(
                  onChanged: (newtext) {
                    enteredmail = newtext;
                  },
                  style: TextStyle(color: Colors.white),
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                      hintText: 'Enter your e-mail address',
                      border: OutlineInputBorder(
                        borderSide: BorderSide(width: 2, color: Colors.white),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            width: 2, color: Colors.white), //<-- SEE HERE
                      ),
                      disabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            width: 2, color: Colors.white54), //<-- SEE HERE
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            width: 4, color: Colors.white54), //<-- SEE HERE
                      ),
                      prefixIcon: Icon(
                        Icons.mail,
                        color: Colors.white,
                      ),
                      hintStyle: TextStyle(color: Colors.white)),
                ),
                SizedBox(
                  height: 20.0,
                ),
                TextFormField(
                  onChanged: (newpass) {
                    enteredpass = newpass;
                  },
                  style: TextStyle(color: Colors.white),
                  obscureText: p,
                  keyboardType: TextInputType.visiblePassword,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          width: 2, color: Colors.white), //<-- SEE HERE
                    ),
                    disabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          width: 2, color: Colors.white54), //<-- SEE HERE
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          width: 4, color: Colors.white54), //<-- SEE HERE
                    ),
                    hintText: 'Enter your Password',
                    hintStyle: TextStyle(color: Colors.white),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(width: 2, color: Colors.white),
                    ),
                    prefixIcon: Icon(
                      Icons.lock_outline_rounded,
                      color: Colors.white,
                    ),
                    suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            if (p == false) {
                              p = true;
                            } else {
                              p = false;
                            }
                            if (using == openeye) {
                              using = closeeye;
                            } else {
                              using = openeye;
                            }
                          });
                        },
                        icon: Icon(
                          using,
                          color: Colors.white,
                        )),
                  ),
                ),
                TextButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => MailOtp()));
                    },
                    child: Text(
                      'Forgot Password?',
                      style: TextStyle(
                        fontSize: 12.0,
                        color: Colors.red,
                      ),
                    )),
                SizedBox(
                  height: 10.0,
                ),
                Container(
                  width: double.infinity,
                  height: 54.0,
                  child: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.red),
                        shape: MaterialStateProperty.all(StadiumBorder())),
                    onPressed: () {
                      bool emailValid = RegExp(
                              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                          .hasMatch(enteredmail);
                      if (enteredmail == '' || enteredpass == '') {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text("Fill all the fields properly"),
                          backgroundColor: Colors.red,
                        ));
                      } else {
                        if (emailValid == true) {
                          try {
                            imp.signin(mail: enteredmail, pass: enteredpass);
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text("Welcome Back!"),
                              backgroundColor: Colors.red,
                            ));
                            Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(builder: (context) => Logged()),
                              (Route<dynamic> route) => false,
                            );
                          } on FirebaseException catch (e) {
                            print(e);
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text(e.toString()),
                              backgroundColor: Colors.red,
                            ));
                          }
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text("Enter a valid Mail-Id"),
                            backgroundColor: Colors.red,
                          ));
                        }
                      }
                    },
                    child: Text(
                      'Login',
                      style: TextStyle(color: Colors.white, fontSize: 25.0),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30.0,
                ),
                Divider(
                  color: Colors.white,
                  thickness: 1.5,
                ),
                Center(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Don\'t have an account?',
                        style: TextStyle(
                          fontSize: 12.0,
                          color: Colors.white,
                        ),
                      ),
                      TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => RegisterNow()));
                          },
                          child: Text(
                            'Register now',
                            style: TextStyle(
                              fontSize: 12.0,
                              color: Colors.red,
                            ),
                          )),
                    ],
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
