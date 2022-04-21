import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/login_bloc_cubit.dart';
import 'custom_widgets/custom_plain_button.dart';
import 'custom_widgets/custom_text_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  LoginScreenCubit? _loginScreenCubit;

  @override
  void initState() {
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      _loginScreenCubit?.clearStreams();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _loginScreenCubit = BlocProvider.of<LoginScreenCubit>(
      context,
      listen: false,
    );
    return Scaffold(
      appBar: AppBar(
        title: const Text('Validation with BloC'),
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 10,
          ),
          child: Column(
            children: [
              Expanded(child: _buildMiddleView()),
              _buildBottomButtonView()
            ],
          ),
        ),
      ),
    );
  }

  _buildMiddleView() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'Login In',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
        ),
        const SizedBox(
          height: 10,
        ),
        StreamBuilder(
            stream: _loginScreenCubit?.userNameStream,
            builder: (context, snapshot) {
              return CustomTextField(
                onChange: (text) {
                  _loginScreenCubit?.updateUserName(text);
                },
                labelText: 'Username',
                textInputType: TextInputType.emailAddress,
              );
            }),
        const SizedBox(
          height: 10,
        ),
        StreamBuilder(
            stream: _loginScreenCubit?.passwordStream,
            builder: (context, snapshot) {
              return CustomTextField(
                onChange: (text) {
                  _loginScreenCubit?.updatePassword(text);
                },
                labelText: 'Password',
                textInputType: TextInputType.text,
                isObscureText: true,
              );
            }),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }

  _buildBottomButtonView() {
    return StreamBuilder(
      stream: _loginScreenCubit?.validateForm,
      builder: (context, snapshot) {
        return CustomPlainButton(
          isEnabled: snapshot.hasData,
          btnColor: snapshot.hasData ? Colors.red : Colors.grey,
          height: 67,
          onTap: snapshot.hasData ? _loginBtnTap : null,
          label: 'Log in',
          lblColor: Colors.white,
        );
      },
    );
  }

  _loginBtnTap() {
    print('Login Button Pressed');
  }
}
