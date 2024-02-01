import 'package:bimo_app/global_widget/bottom_menu.dart';
import 'package:bimo_app/global_widget/global_button.dart';
import 'package:bimo_app/global_widget/input_decoration.dart';
import 'package:bimo_app/utils/color_utils.dart';
import 'package:bimo_app/utils/text_theme_utils.dart';
import 'package:flutter/scheduler.dart';

import 'package:flutter_iconly/flutter_iconly.dart';
import '../bloc/login_bloc.dart';
import '../bloc/login_state.dart';
import '../../../injection_container.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  // final String id;

  const LoginPage({
    super.key,
    // required this.id,
  });

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  LoginBloc loginBloc = sl<LoginBloc>();

  final _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  bool _obsecureText = true;
  late String username, password;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    loginBloc.dispose();
  }

  Widget emailTextInput() {
    return TextFormField(
      decoration: globalInputDecoration.copyWith(
        hintText: "Tambahkan Username",
      ),
      autovalidateMode: AutovalidateMode.onUserInteraction,
      keyboardType: TextInputType.name,
      onSaved: (username) {
        this.username = username!;
      },
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Username tidak boleh kosong';
        }
        return null;
      },
    );
  }

  Widget passwordTextInput() {
    return TextFormField(
      obscureText: _obsecureText,
      decoration: globalInputDecoration.copyWith(
        hintText: "Tambahkan Password",
        suffixIcon: IconButton(
          icon: Icon(_obsecureText ? IconlyLight.hide : IconlyLight.show),
          color: Colors.grey,
          onPressed: () {
            setState(() {
              _obsecureText = !_obsecureText;
            });
          },
        ),
      ),
      autovalidateMode: AutovalidateMode.onUserInteraction,
      keyboardType: TextInputType.text,
      maxLines: 1,
      onSaved: (password) {
        this.password = password!;
      },
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Password tidak boleh kosong';
        }
        return null;
      },
    );
  }

  void login() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      SubmitLoginState submitLoginState = await loginBloc.submitLogin(username: username, password: password);
      if (submitLoginState is SubmitLoginClientError) {
        _showSnackbar(submitLoginState.message);
      } else if (submitLoginState is SubmitLoginSuccess) {
        navigate();
      }
    }
  }

  void navigate() {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (BuildContext context) => const BottomMenu()));
    });
  }

  void _showSnackbar(String value) {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(value),
        duration: const Duration(seconds: 1),
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 120, left: 30, right: 30, bottom: 40),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 0, left: 30, right: 30),
                  child: Image.asset(
                    'assets/logo_filkom.png',
                    fit: BoxFit.fitWidth,
                  ),
                ),
                const SizedBox(height: 60),
                Text("Username", style: CustomTextTheme.body2.copyWith(color: CustomColors.blackMamba)),
                const SizedBox(height: 10),
                emailTextInput(),
                const SizedBox(height: 25),
                Text("Password", style: CustomTextTheme.body2.copyWith(color: CustomColors.blackMamba)),
                const SizedBox(height: 10),
                passwordTextInput(),
                const SizedBox(height: 30),
                SizedBox(
                  width: double.infinity,
                  child: StreamBuilder<SubmitLoginState>(
                    initialData: loginBloc.submitInitialLoginState,
                    stream: loginBloc.submitLoginState,
                    builder: (context, snapshot) {
                      return GlobalButton(
                        onPressed: login,
                        text: "LOGIN",
                        loading: snapshot.data is SubmitLoginLoading,
                      );
                    },
                  ),
                ),
                const SizedBox(height: 100),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
