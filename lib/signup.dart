import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final TextEditingController _newUsernameController = TextEditingController();
  final TextEditingController _newPasswordController = TextEditingController();

  String signupMessage = ''; 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Signup Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _newUsernameController,
              decoration: InputDecoration(labelText: 'New Username'),
            ),
            TextField(
              controller: _newPasswordController,
              obscureText: true,
              decoration: InputDecoration(labelText: 'New Password'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                String newUsername = _newUsernameController.text;
                String newPassword = _newPasswordController.text;

                // Check if the username already exists
                if (await usernameExists(newUsername)) {
                  setState(() {
                    signupMessage = 'Username already exists. Try another one.';
                  });
                } else {
                  // Add signup logic here
                  // For simplicity, let's consider it successful always

                  // Save the username to shared preferences
                  saveUsernameToPrefs(newUsername);

                  // Save the password to shared preferences (for simplicity, you might want to encrypt it in a real-world scenario)
                  savePasswordToPrefs(newPassword);

                  // Navigate to the login page
                  Navigator.pop(context);
                }
              },
              child: Text('Signup'),
            ),
            SizedBox(height: 10),
            Text(signupMessage, style: TextStyle(color: Colors.red)), // Display signup status
          ],
        ),
      ),
    );
  }

  Future<bool> usernameExists(String username) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final savedUsername = prefs.getString('username');
    return savedUsername == username;
  }

  Future<void> saveUsernameToPrefs(String newUsername) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('username', newUsername);
  }

  Future<void> savePasswordToPrefs(String newPassword) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('password', newPassword);
  }
}