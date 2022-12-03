import 'package:flutter/material.dart';
import 'loginpage.dart' show LoginPage;

void main() => runApp(
      const MaterialApp(
        home: SafeArea(
          child: LoginPage(),
        ),
      ),
    );
