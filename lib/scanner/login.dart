import 'package:flutter/material.dart';

class LoginScanner extends StatefulWidget {
  const LoginScanner({super.key});

  @override
  State<LoginScanner> createState() => _LoginScannerState();
}

class _LoginScannerState extends State<LoginScanner> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Center(
        child: Text('This is the home screen.'),
      ),
    );
  }
}
