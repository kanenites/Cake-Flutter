import 'package:flutter/material.dart';
import 'dart:convert';

void main() {
  runApp(BirthdayCakeApp());
}

class BirthdayCakeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Birthday Cake',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BirthdayCake(),
    );
  }
}

class BirthdayCake extends StatefulWidget {
  @override
  _BirthdayCakeState createState() => _BirthdayCakeState();
}

class _BirthdayCakeState extends State<BirthdayCake> {
  String birthDate = '01/01/2000';
  bool isEncoded = false;

  void toggleEncoding() {
    setState(() {
      isEncoded = !isEncoded;
      if (isEncoded) {
        // Encode birthdate to base64
        birthDate = base64.encode(utf8.encode(birthDate));
      } else {
        // Decode base64 to birthdate
        birthDate = utf8.decode(base64.decode(birthDate));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Birthday Cake'),
      ),
      body: Stack(
        children: [
          // Background cake image
          Positioned.fill(
            child: Image.asset(
              'images/cake_image.jpg', // Replace with your cake image
              fit: BoxFit.cover,
            ),
          ),
          // Content
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  '$birthDate',
                  style: TextStyle(
                      fontSize: 18,
                      color: Color(0xff3894d9),
                      backgroundColor: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: toggleEncoding,
                  child: Text(
                    isEncoded ? 'Decode Birthdate' : 'Encode Birthdate',
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
