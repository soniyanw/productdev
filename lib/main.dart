import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:product_dev/views/login_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(
    MaterialApp(
      home: Login(),
    ),
  );
}
