// part of chameleon_ui;
//
// class AuthenticationPage extends StatefulWidget {
//   final bool backButtonVisible;
//   final Color backgroundColor;
//   final Color primaryColor;
//   final Color hintTextColor;
//   final Color textColor;
//   final Function authenticate;
//   final Function resendCode;
//   final String email;
//
//   const AuthenticationPage({
//     Key key,
//     this.backButtonVisible = true,
//     this.backgroundColor = Colors.white,
//     this.primaryColor = Colors.black,
//     @required this.authenticate,
//     this.hintTextColor = Colors.black45,
//     this.textColor = Colors.black,
//     this.resendCode,
//     this.email = "",
//   })  : assert(authenticate != null),
//         assert(email != null),
//         super(key: key);
//
//   @override
//   _AuthenticationPageState createState() => _AuthenticationPageState();
// }
//
// class _AuthenticationPageState extends State<AuthenticationPage> {
//   bool authenticationEnable = false;
//   final formKey = GlobalKey<FormState>();
//   TextEditingController code1Controller = TextEditingController();
//   TextEditingController code2Controller = TextEditingController();
//   TextEditingController code3Controller = TextEditingController();
//   TextEditingController code4Controller = TextEditingController();
//   TextEditingController code5Controller = TextEditingController();
//   TextEditingController code6Controller = TextEditingController();
//
//   @override
//   void initState() {
//     super.initState();
//     code1Controller.addListener(_checkForgotPasswordEnable);
//     code2Controller.addListener(_checkForgotPasswordEnable);
//     code3Controller.addListener(_checkForgotPasswordEnable);
//     code4Controller.addListener(_checkForgotPasswordEnable);
//     code5Controller.addListener(_checkForgotPasswordEnable);
//     code6Controller.addListener(_checkForgotPasswordEnable);
//   }
//
//   @override
//   void dispose() {
//     super.dispose();
//     code1Controller.dispose();
//     code2Controller.dispose();
//     code3Controller.dispose();
//     code4Controller.dispose();
//     code5Controller.dispose();
//     code6Controller.dispose();
//   }
//
//   void _checkForgotPasswordEnable() {
//     if (code1Controller.text.isNotEmpty &&
//         code2Controller.text.isNotEmpty &&
//         code3Controller.text.isNotEmpty &&
//         code4Controller.text.isNotEmpty &&
//         code5Controller.text.isNotEmpty &&
//         code6Controller.text.isNotEmpty) {
//       setState(() {
//         authenticationEnable = true;
//       });
//     } else {
//       setState(() {
//         authenticationEnable = false;
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
//           'Authentication',
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
//                 Text(
//                   "Input 6-digit verification code that have been sent via email to",
//                   style: TextStyle(
//                     fontSize: 14,
//                     color: Colors.black45,
//                   ),
//                   textAlign: TextAlign.center,
//                 ),
//                 SizedBox(
//                   height: 12,
//                 ),
//                 Text(
//                   widget.email,
//                   style: TextStyle(
//                     fontSize: 14,
//                     color: Colors.black45,
//                     fontWeight: FontWeight.bold,
//                   ),
//                   textAlign: TextAlign.center,
//                 ),
//                 SizedBox(
//                   height: 48,
//                 ),
//                 Row(
//                   children: [
//                     Expanded(
//                       child: SecondaryTextFormField(
//                         keyboardType: TextInputType.number,
//                         textColor: widget.textColor,
//                         controller: code1Controller,
//                         validator: (String value) {
//                           return (value.isEmpty) ? 'Code cant be empty' : null;
//                         },
//                         focusBorderColor: widget.primaryColor,
//                         cursorColor: widget.primaryColor,
//                         style: TextStyle(
//                           fontSize: 20,
//                           color: widget.primaryColor,
//                         ),
//                         contentPadding: 8,
//                         textAlign: TextAlign.center,
//                       ),
//                     ),
//                     SizedBox(width: 8),
//                     Expanded(
//                       child: SecondaryTextFormField(
//                         keyboardType: TextInputType.number,
//                         textColor: widget.textColor,
//                         controller: code2Controller,
//                         validator: (String value) {
//                           return (value.isEmpty) ? 'Code cant be empty' : null;
//                         },
//                         focusBorderColor: widget.primaryColor,
//                         cursorColor: widget.primaryColor,
//                         style: TextStyle(
//                           fontSize: 20,
//                           color: widget.primaryColor,
//                         ),
//                         contentPadding: 8,
//                         textAlign: TextAlign.center,
//                       ),
//                     ),
//                     SizedBox(width: 8),
//                     Expanded(
//                       child: SecondaryTextFormField(
//                         keyboardType: TextInputType.number,
//                         textColor: widget.textColor,
//                         controller: code3Controller,
//                         validator: (String value) {
//                           return (value.isEmpty) ? 'Code cant be empty' : null;
//                         },
//                         focusBorderColor: widget.primaryColor,
//                         cursorColor: widget.primaryColor,
//                         style: TextStyle(
//                           fontSize: 20,
//                           color: widget.primaryColor,
//                         ),
//                         contentPadding: 8,
//                         textAlign: TextAlign.center,
//                       ),
//                     ),
//                     SizedBox(width: 8),
//                     Expanded(
//                       child: SecondaryTextFormField(
//                         keyboardType: TextInputType.number,
//                         textColor: widget.textColor,
//                         controller: code4Controller,
//                         validator: (String value) {
//                           return (value.isEmpty) ? 'Code cant be empty' : null;
//                         },
//                         focusBorderColor: widget.primaryColor,
//                         cursorColor: widget.primaryColor,
//                         style: TextStyle(
//                           fontSize: 20,
//                           color: widget.primaryColor,
//                         ),
//                         contentPadding: 8,
//                         textAlign: TextAlign.center,
//                       ),
//                     ),
//                     SizedBox(width: 8),
//                     Expanded(
//                       child: SecondaryTextFormField(
//                         keyboardType: TextInputType.number,
//                         textColor: widget.textColor,
//                         controller: code5Controller,
//                         validator: (String value) {
//                           return (value.isEmpty) ? 'Code cant be empty' : null;
//                         },
//                         focusBorderColor: widget.primaryColor,
//                         cursorColor: widget.primaryColor,
//                         style: TextStyle(
//                           fontSize: 20,
//                           color: widget.primaryColor,
//                         ),
//                         contentPadding: 8,
//                         textAlign: TextAlign.center,
//                       ),
//                     ),
//                     SizedBox(width: 8),
//                     Expanded(
//                       child: SecondaryTextFormField(
//                         keyboardType: TextInputType.number,
//                         textColor: widget.textColor,
//                         controller: code6Controller,
//                         validator: (String value) {
//                           return (value.isEmpty) ? 'Code cant be empty' : null;
//                         },
//                         focusBorderColor: widget.primaryColor,
//                         cursorColor: widget.primaryColor,
//                         style: TextStyle(
//                           fontSize: 20,
//                           color: widget.primaryColor,
//                         ),
//                         contentPadding: 8,
//                         textAlign: TextAlign.center,
//                       ),
//                     ),
//                   ],
//                 ),
//                 SizedBox(
//                   height: 48,
//                 ),
//                 PrimaryButton(
//                   isEnable: authenticationEnable,
//                   title: "Authenticate",
//                   enableBackgroundColor: widget.primaryColor,
//                   onPressed: () {
//                     if (formKey.currentState.validate()) {
//                       widget.authenticate(
//                         "${code1Controller.text}${code2Controller.text}${code3Controller.text}${code4Controller.text}${code5Controller.text}${code6Controller.text}",
//                       );
//                     }
//                   },
//                 ),
//                 SizedBox(
//                   height: 16,
//                 ),
//                 Text(
//                   "Haven't received the code?",
//                   style: TextStyle(
//                     fontSize: 14,
//                     color: Colors.black45,
//                   ),
//                   textAlign: TextAlign.center,
//                 ),
//                 SizedBox(
//                   height: 12,
//                 ),
//                 InkWell(
//                   onTap: widget.resendCode,
//                   splashColor: Colors.transparent,
//                   highlightColor: Colors.transparent,
//                   child: Text(
//                     "RESEND CODE",
//                     style: TextStyle(
//                       fontSize: 14,
//                       color: Colors.black45,
//                       fontWeight: FontWeight.bold,
//                     ),
//                     textAlign: TextAlign.center,
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
