import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sightfinal/constants/routes.dart';
import 'package:sightfinal/screens/auth_ui/login/login.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _buildSignOutButton(context),
            SizedBox(height: 20),
            _buildChangePasswordButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildSignOutButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Fluttertoast.showToast(
          msg: "You've been signed out",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
        );
        Routes.instance.push(widget: Login(), context: context);
      },
      child: Text('Sign Out'),
    );
  }

  Widget _buildChangePasswordButton() {
    return ElevatedButton(
      onPressed: () {
        Fluttertoast.showToast(
          msg: "Password reset email sent",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
        );
      },
      child: Text('Change Password'),
    );
  }
}
