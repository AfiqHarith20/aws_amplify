import 'package:aws_amplify/screens/confirm.dart';
import 'package:aws_amplify/screens/entry.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AWS AMP Apps',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      onGenerateRoute: (settings) {
        if (settings.name == '/confirm') {
          return PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) =>
                ConfirmScreen(data: settings.arguments as LoginData),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) => child,
          );
        }
        return MaterialPageRoute(
          builder: (context) => EntryScreen(),
        );
      },
    );
  }
}
