import 'package:flutter/material.dart';
import 'homepage.dart' show HomePage;

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _AppFields();
}

class _AppFields extends State<LoginPage> {
  String firstName = '<First name>', lastName = '<Last name>';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Welcome to Flutter',
        home: Scaffold(
          appBar: AppBar(title: const Text('Login page'), centerTitle: true),
          body: Column(children: <Widget>[
            Container(
                margin: const EdgeInsets.all(20),
                width: 400,
                child: TextField(
                  textAlign: TextAlign.center,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Your first name',
                  ),
                  onChanged: (text) {
                    setState(() {
                      firstName = text;
                    });
                  },
                )),
            Container(
                margin: const EdgeInsets.all(20),
                width: 400,
                child: TextField(
                  textAlign: TextAlign.center,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Your last name',
                  ),
                  onChanged: (text) {
                    setState(() {
                      lastName = text;
                    });
                  },
                )),
            Center(
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        minimumSize: const Size(120, 50)),
                    child: const Text('Greeting'),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                HomePage(firstName, lastName)),
                      );
                    })),
          ]),
        ));
  }
}
