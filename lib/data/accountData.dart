import 'package:flutter/material.dart';

class AccountData extends StatelessWidget {
  final String firstName;
  final String lastName;
  final String emailAddress;
  final String password;

  const AccountData({
    required Key key,
    required this.firstName,
    required this.lastName,
    required this.emailAddress,
    required this.password,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Account Data'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'First Name: $firstName',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 20),
            Text(
              'Last Name: $lastName',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 20),
            Text(
              'Email Address: $emailAddress',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 20),
            Text(
              'Password: $password',
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
