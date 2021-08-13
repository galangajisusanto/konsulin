// part of chameleon_ui;
//
// class SignUpPage extends StatefulWidget {
//   final bool backButtonVisible;
//   final Color backgroundColor;
//   final Color primaryColor;
//   final Color hintTextColor;
//   final Color textColor;
//   final Function signUp;
//   final Function privacyPolice;
//   final Function termOfService;
//   final bool privacyTermVisible;
//
//   const SignUpPage({
//     Key key,
//     this.backButtonVisible = true,
//     this.backgroundColor = Colors.white,
//     this.primaryColor = Colors.black,
//     @required this.signUp,
//     this.hintTextColor = Colors.black45,
//     this.textColor = Colors.black,
//     this.privacyPolice,
//     this.termOfService,
//     this.privacyTermVisible = true,
//   })  : assert(signUp != null),
//         super(key: key);
//
//   @override
//   _SignUpPage createState() => _SignUpPage();
// }
//
// class _SignUpPage extends State<SignUpPage> {
//   bool signUpEnable = false;
//   bool obscurePassword = true;
//   String suffixPasswordTitle = "Show";
//   final formKey = GlobalKey<FormState>();
//   TextEditingController nameController = TextEditingController();
//   TextEditingController emailController = TextEditingController();
//   TextEditingController passwordController = TextEditingController();
//
//   @override
//   void initState() {
//     super.initState();
//     nameController.addListener(_checkSignupEnable);
//     emailController.addListener(_checkSignupEnable);
//     passwordController.addListener(_checkSignupEnable);
//   }
//
//   @override
//   void dispose() {
//     super.dispose();
//     nameController.dispose();
//     emailController.dispose();
//     passwordController.dispose();
//   }
//
//   void _checkSignupEnable() {
//     if (nameController.text.isNotEmpty &&
//         passwordController.text.isNotEmpty &&
//         emailController.text.isNotEmpty) {
//       setState(() {
//         signUpEnable = true;
//       });
//     } else {
//       setState(() {
//         signUpEnable = false;
//       });
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: widget.backgroundColor,
//       appBar: AppBar(
//         leading: widget.backButtonVisible
//             ? IconButton(
//                 icon: Icon(Icons.arrow_back),
//                 color: widget.primaryColor,
//                 onPressed: () {
//                   Navigator.of(context).pop();
//                 })
//             : null,
//         backgroundColor: Colors.white,
//         title: Text(
//           'Sign Up',
//           style: TextStyle(color: widget.primaryColor, fontSize: 18),
//         ),
//       ),
//       body: SafeArea(
//         child: Container(
//           padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
//           child: Form(
//             key: formKey,
//             child: ListView(
//               physics: BouncingScrollPhysics(),
//               children: [
//                 SizedBox(
//                   height: 36,
//                 ),
//                 PrimaryTextFormField(
//                   hintText: 'First & Last Name',
//                   hintTextColor: widget.hintTextColor,
//                   textColor: widget.textColor,
//                   keyboardType: TextInputType.text,
//                   controller: nameController,
//                   validator: (String value) {
//                     return (value.isEmpty)
//                         ? 'First & last cant be empty'
//                         : null;
//                   },
//                   focusBorderColor: widget.primaryColor,
//                   cursorColor: widget.primaryColor,
//                 ),
//                 SizedBox(
//                   height: 48,
//                 ),
//                 PrimaryTextFormField(
//                   hintText: 'Email Address',
//                   hintTextColor: widget.hintTextColor,
//                   textColor: widget.textColor,
//                   controller: emailController,
//                   validator: (String value) {
//                     return (value.isEmpty)
//                         ? 'Email address cant be empty'
//                         : null;
//                   },
//                   focusBorderColor: widget.primaryColor,
//                   cursorColor: widget.primaryColor,
//                 ),
//                 SizedBox(
//                   height: 48,
//                 ),
//                 PrimaryTextFormField(
//                   hintText: 'Password',
//                   hintTextColor: widget.hintTextColor,
//                   textColor: widget.textColor,
//                   controller: passwordController,
//                   obscureText: obscurePassword,
//                   suffix: GestureDetector(
//                     onTap: () {
//                       // ignore: unnecessary_statements
//                       obscurePassword = !obscurePassword;
//                       if (obscurePassword) {
//                         setState(() {
//                           suffixPasswordTitle = "Show";
//                         });
//                       } else {
//                         setState(() {
//                           suffixPasswordTitle = "Hide";
//                         });
//                       }
//                     },
//                     child: Text(
//                       suffixPasswordTitle,
//                       style:
//                           TextStyle(fontSize: 14, color: widget.primaryColor),
//                     ),
//                   ),
//                   validator: (String value) {
//                     return (value.isEmpty) ? 'Password cant be empty' : null;
//                   },
//                   focusBorderColor: widget.primaryColor,
//                   cursorColor: widget.primaryColor,
//                 ),
//                 SizedBox(
//                   height: 48,
//                 ),
//                 PrimaryButton(
//                   isEnable: signUpEnable,
//                   title: "Sign Up",
//                   enableBackgroundColor: widget.primaryColor,
//                   onPressed: () {
//                     if (formKey.currentState.validate()) {
//                       widget.signUp(
//                         nameController.text,
//                         emailController.text,
//                         passwordController.text,
//                       );
//                     }
//                   },
//                 ),
//                 SizedBox(
//                   height: 16,
//                 ),
//                 Visibility(
//                   visible: widget.privacyTermVisible,
//                   child: RichText(
//                     text: TextSpan(
//                       style: TextStyle(
//                         fontSize: 12,
//                         color: Colors.black45,
//                       ),
//                       children: <TextSpan>[
//                         TextSpan(text: 'By proceeding, you agree to both: '),
//                         TextSpan(
//                             text: 'Privacy Police',
//                             recognizer: TapGestureRecognizer()
//                               ..onTap = () {
//                                 // ignore: unnecessary_statements
//                                 widget.privacyPolice;
//                               }),
//                         TextSpan(text: ' & '),
//                         TextSpan(
//                             text: 'Terms of Service',
//                             recognizer: TapGestureRecognizer()
//                               ..onTap = () {
//                                 // ignore: unnecessary_statements
//                                 widget.termOfService;
//                               }),
//                       ],
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
