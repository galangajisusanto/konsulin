// part of chameleon_ui;
//
// class ForgotPasswordPage extends StatefulWidget {
//   final bool backButtonVisible;
//   final Color backgroundColor;
//   final Color primaryColor;
//   final Color hintTextColor;
//   final Color textColor;
//   final Function forgot;
//   final Function privacyPolice;
//   final Function termOfService;
//   final bool privacyTermVisible;
//
//   const ForgotPasswordPage({
//     Key key,
//     this.backButtonVisible = true,
//     this.backgroundColor = Colors.white,
//     this.primaryColor = Colors.black,
//     @required this.forgot,
//     this.hintTextColor = Colors.black45,
//     this.textColor = Colors.black,
//     this.privacyPolice,
//     this.termOfService,
//     this.privacyTermVisible = false,
//   })  : assert(forgot != null),
//         super(key: key);
//
//   @override
//   _ForgotPasswordPageState createState() => _ForgotPasswordPageState();
// }
//
// class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
//   bool forgotEnable = false;
//   final formKey = GlobalKey<FormState>();
//   TextEditingController emailController = TextEditingController();
//
//   @override
//   void initState() {
//     super.initState();
//     emailController.addListener(_checkForgotPasswordEnable);
//   }
//
//   @override
//   void dispose() {
//     super.dispose();
//     emailController.dispose();
//   }
//
//   void _checkForgotPasswordEnable() {
//     if (emailController.text.isNotEmpty) {
//       setState(() {
//         forgotEnable = true;
//       });
//     } else {
//       setState(() {
//         forgotEnable = false;
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
//           'Forgot Password',
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
//                 PrimaryButton(
//                   isEnable: forgotEnable,
//                   title: "Forgot",
//                   enableBackgroundColor: widget.primaryColor,
//                   onPressed: () {
//                     if (formKey.currentState.validate()) {
//                       widget.forgot(
//                         emailController.text,
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
