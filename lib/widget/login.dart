// ignore_for_file: non_constant_identifier_names
import "dart:io";

import 'package:flutter/material.dart';
import 'package:amplify_core/amplify_core.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_analytics_pinpoint/amplify_analytics_pinpoint.dart';
import 'package:flutter_login/flutter_login.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late SignupData _data;

  Future<String?> _onLogin(LoginData data) async {
    print(data);
  }

  Future<String?> _onSignup(SignupData data) async {
    try {
      await Amplify.Auth.signUp(
        username: data.name as String,
        password: data.password as String,
        options: SignUpOptions(
          userAttributes: {
            AuthUserAttributeKey.email: data.name as String,
          },
        ),
      );
      _data = data;
    } on AuthException catch (e) {
      print(e.message);
      return 'There was an error authenticating. Please try again.';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return FlutterLogin(
      title: "AmpAwsome",
      onLogin: _onLogin,
      onRecoverPassword: (String) => Future.value(''),
      onSignup: _onSignup,
      theme: LoginTheme(
        primaryColor: Theme.of(context).primaryColor,
      ),
      onSubmitAnimationCompleted: () {
        Navigator.of(context).pushReplacementNamed(
          '/confirm',
          arguments: _data,
        );
      },
    );
  }
}
