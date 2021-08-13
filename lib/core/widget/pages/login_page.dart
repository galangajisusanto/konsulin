import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:hackathon_app/core/widget/primary_button.dart';
import 'package:hackathon_app/core/widget/primary_text_form_field.dart';

class LoginPage extends StatefulWidget {
  final bool backButtonVisible;
  final Color backgroundColor;
  final Color primaryColor;
  final Color hintTextColor;
  final Color textColor;
  final Function login;
  final Function forgotPassword;
  final Function? privacyPolice;
  final Function? termOfService;
  final bool privacyTermVisible;

  const LoginPage({
    Key? key,
    this.backButtonVisible = true,
    this.backgroundColor = Colors.white,
    this.primaryColor = Colors.black,
    required this.login,
    required this.forgotPassword,
    this.hintTextColor = Colors.black45,
    this.textColor = Colors.black,
    this.privacyPolice,
    this.termOfService,
    this.privacyTermVisible = true,
  }) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool loginEnable = false;
  final formKey = GlobalKey<FormState>();
  TextEditingController emailUsernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    emailUsernameController.addListener(_checkLoginEnable);
    passwordController.addListener(_checkLoginEnable);
  }

  @override
  void dispose() {
    super.dispose();
    emailUsernameController.dispose();
    passwordController.dispose();
  }

  void _checkLoginEnable() {
    if (emailUsernameController.text.isNotEmpty &&
        passwordController.text.isNotEmpty) {
      setState(() {
        loginEnable = true;
      });
    } else {
      setState(() {
        loginEnable = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: widget.backgroundColor,
      appBar: AppBar(
        leading: widget.backButtonVisible
            ? IconButton(
                icon: Icon(Icons.arrow_back),
                color: widget.primaryColor,
                onPressed: () {
                  Navigator.of(context).pop();
                })
            : null,
        backgroundColor: Colors.white,
        title: Text(
          'Login',
          style: TextStyle(color: widget.primaryColor, fontSize: 18),
        ),
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
          child: Form(
            key: formKey,
            child: ListView(
              physics: BouncingScrollPhysics(),
              children: [
                SizedBox(
                  height: 48,
                ),
                PrimaryTextFormField(
                  hintText: 'Email or Username',
                  hintTextColor: widget.hintTextColor,
                  textColor: widget.textColor,
                  controller: emailUsernameController,
                  validator: (value) {
                    return (value!.isEmpty)
                        ? 'Email or Username cant be empty'
                        : null;
                  },
                  focusBorderColor: widget.primaryColor,
                  cursorColor: widget.primaryColor,
                ),
                SizedBox(
                  height: 48,
                ),
                PrimaryTextFormField(
                  hintText: 'Password',
                  hintTextColor: widget.hintTextColor,
                  textColor: widget.textColor,
                  controller: passwordController,
                  obscureText: true,
                  suffix: GestureDetector(
                    onTap: () {
                      widget.forgotPassword();
                    },
                    child: Text(
                      'Forgot',
                      style:
                          TextStyle(fontSize: 14, color: widget.primaryColor),
                    ),
                  ),
                  validator: (value) {
                    return (value!.isEmpty) ? 'Password cant be empty' : null;
                  },
                  focusBorderColor: widget.primaryColor,
                  cursorColor: widget.primaryColor,
                ),
                SizedBox(
                  height: 48,
                ),
                PrimaryButton(
                  isEnable: loginEnable,
                  title: "Login",
                  enableBackgroundColor: widget.primaryColor,
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      widget.login(emailUsernameController.text,
                          passwordController.text);
                    }
                  },
                ),
                SizedBox(
                  height: 16,
                ),
                Visibility(
                  visible: widget.privacyTermVisible,
                  child: RichText(
                    text: TextSpan(
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.black45,
                      ),
                      children: <TextSpan>[
                        TextSpan(text: 'By proceeding, you agree to both: '),
                        TextSpan(
                            text: 'Privacy Police',
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                // ignore: unnecessary_statements
                                widget.privacyPolice;
                              }),
                        TextSpan(text: ' & '),
                        TextSpan(
                            text: 'Terms of Service',
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                // ignore: unnecessary_statements
                                widget.termOfService;
                              }),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
