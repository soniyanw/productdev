import 'package:flutter/material.dart';

class Admin extends StatefulWidget {
  const Admin({Key? key}) : super(key: key);

  @override
  State<Admin> createState() => _AdminState();
}

class _AdminState extends State<Admin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Your Orders"),
        backgroundColor: Colors.red,
      ),
      body: Container(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            color: Colors.red,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "2 Biriyani\n\nTo:\n\nNo.6\nGandhi Road\nNorth Avenue\nChennai-600005\n\nTime to be delivered: 8:00pm",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: MaterialButton(
                    onPressed: () {},
                    color: Colors.white,
                    child: Text("Ok"),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
