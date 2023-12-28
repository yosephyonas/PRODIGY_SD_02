import 'package:flutter/material.dart';
import 'package:guessing_game/GuessingGamePage.dart';
import 'package:guessing_game/signup.dart';
import 'package:shared_preferences/shared_preferences.dart';


class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _usernameController,
              decoration: const InputDecoration(labelText: 'Username'),
            ),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: const InputDecoration(labelText: 'Password'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                String username = _usernameController.text;
                String password = _passwordController.text;

                BuildContext currentContext = context; // Store the context

                if (await authenticateUser(username, password)) {
                  saveUsernameToPrefs(username);
                  savePasswordToPrefs(password);

                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => GuessingGamePage(),
                    ),
                  );
                  print('Login Successful!');
                } else {
                  print('Login Failed. Invalid credentials.');
                }
              },
              child: const Text('Login'),
            ),
            const SizedBox(height: 10),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        SignupPage(), 
                  ),
                );
              },
              child: const Text('Create an account'),
            ),
          ],
        ),
      ),
    );
  }

  Future<bool> authenticateUser(String username, String password) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final savedUsername = prefs.getString('username');
    final savedPassword = prefs.getString('password');

    return (savedUsername == username && savedPassword == password);
  }

  Future<void> saveUsernameToPrefs(String username) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('username', username);
  }

  Future<void> savePasswordToPrefs(String password) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('password', password);
  }
}
