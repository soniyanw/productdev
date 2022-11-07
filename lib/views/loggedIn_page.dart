import 'package:flutter/material.dart';
import 'package:product_dev/services/service_imp.dart';
import 'package:product_dev/services/services.dart';
import 'package:product_dev/views/login_page.dart';

class Logged extends StatefulWidget {
  const Logged({Key? key}) : super(key: key);

  @override
  _LoggedState createState() => _LoggedState();
}

class _LoggedState extends State<Logged> {
  Services imp = new ServiceImp();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Padding(
          padding: EdgeInsets.only(top: 60.0),
          child: Column(
            children: [
              Center(
                child: Text(
                  'Hurray!!!',
                  style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.red,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Center(
                child: Text(
                  'You are successfully logged in',
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.red,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                height: 40.0,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 250,
                  ),
                  MaterialButton(
                      onPressed: () {
                        imp.signout();
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(builder: (context) => Login()),
                          (Route<dynamic> route) => false,
                        );
                      },
                      color: Colors.blue,
                      child: Text(
                        'Log Out ↳',
                        style: TextStyle(fontSize: 15.0, color: Colors.white),
                      ))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
