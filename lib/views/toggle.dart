import 'package:flutter/material.dart';
import 'package:product_dev/views/register_admin.dart';
import 'package:product_dev/views/registernow_page.dart';

class Toggle extends StatefulWidget {
  const Toggle({Key? key}) : super(key: key);

  @override
  State<Toggle> createState() => _ToggleState();
}

class _ToggleState extends State<Toggle> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MaterialButton(
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => RegisterNow()),
                    (Route<dynamic> route) => true);
              },
              child: Text("Register as User"),
              color: Colors.red,
            ),
            MaterialButton(
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => RegisterAdmin()),
                    (Route<dynamic> route) => true);
              },
              child: Text("Register as Admin"),
              color: Colors.red,
            )
          ],
        ),
      ),
    );
  }
}
