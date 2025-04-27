import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:movie_and_tv_show/common/helper/message/displayMessage.dart';
import 'package:movie_and_tv_show/common/helper/navigation/AppNavigatior.dart';
import 'package:movie_and_tv_show/core/configs/theme/app_colors.dart';
import 'package:movie_and_tv_show/data/auth/models/signin_req_params.dart';
import 'package:movie_and_tv_show/presentation/auth/pages/signup.dart';
import 'package:movie_and_tv_show/presentation/home/pages/home.dart';
import 'package:reactive_button/reactive_button.dart';

import '../../../domain/auth/usecases/signin.dart';
import '../../../service_locator.dart';

class SigninPage extends StatelessWidget {
  SigninPage({super.key});

  final TextEditingController _emailCon = TextEditingController();
  final TextEditingController _passwordCon = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: SafeArea(
          minimum: const EdgeInsets.only(top: 100, right: 16, left: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _signinText(),
              const SizedBox(height: 30),
              _emailField(),
              const SizedBox(height: 20),
              _passwordField(),
              const SizedBox(height: 60),
              _signinButton(context),
              const SizedBox(height: 20),
              _signupText(context)
            ],
          )),
    );
  }

  Widget _signinText() {
    return const Text(
      'Sign In',
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
    );
  }

  Widget _emailField() {
    return  TextField(
      controller: _emailCon,
      decoration: InputDecoration(hintText: 'Enter Your Email'),
    );
  }

  Widget _passwordField() {
    return  TextField(
      controller: _passwordCon,
      decoration: InputDecoration(hintText: 'Enter Password'),
    );
  }

  Widget _signinButton(BuildContext context) {
    return ReactiveButton(
      title: 'Sign In',
      activeColor: AppColors.primary,
      onPressed: () async => sl<SigninUseCase>().call(
        params: SigninReqParams(
            email: _emailCon.text,
            password: _passwordCon.text
        )
      ),
      onSuccess: () {
        AppNavigator.pushAndRemove(context, const HomePage());
      },
      onFailure: (error) {
        DisplayMessage.errorMessage(error, context);
      },
    );
  }

  Widget _signupText(BuildContext context) {
    return Text.rich(TextSpan(children: [
      const TextSpan(text: "Don't you have account?"),
      TextSpan(
        text: ' Sign Up',
        recognizer: TapGestureRecognizer()
          ..onTap = () {
            AppNavigator.push(context, SignupPage());
          },
        style: const TextStyle(color: Colors.blue),
      )
    ]));
  }
}
