// import 'package:dev_player_fds/Data/provider/provider.dart';
// import 'package:dev_player_fds/Data/repository/repository.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:http/http.dart' as http;

// class LoginScreen extends StatelessWidget {
//   final repo = AccountRepository(
//       accountDataProvider: AccountDataProvider(httpClient: http.Client()));

//   final emailTextController = TextEditingController();
//   final passwordTextController = TextEditingController();
//   final formKey = GlobalKey<FormState>();

//   @override
//   Widget build(BuildContext context) {
//     final inputFieldStyle = InputDecoration(
//       border: OutlineInputBorder(),
//     );

//     return BlocProvider(
//       create: (context) => Bloc(accountRepository: repo),
//       child: Scaffold(
//         body: SafeArea(
//           child: SingleChildScrollView(
//             child: Container(
//               child: Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 16.0),
//                 child: Form(
//                   key: formKey,
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       const SizedBox(height: 20.0),
//                       const BankImage(),
//                       const SizedBox(height: 20.0),
//                       EmailField(emailTextController: emailTextController),
//                       const SizedBox(height: 20.0),
//                       PasswordField(
//                           passwordTextController: passwordTextController,
//                           inputFieldStyle: inputFieldStyle),
//                       const SizedBox(height: 30.0),
//                       StateCheckBloc(
//                           formKey: formKey,
//                           emailTextController: emailTextController,
//                           passwordTextController: passwordTextController),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// class StateCheckBloc extends StatelessWidget {
//   StateCheckBloc({
//     Key? key,
//     required this.emailTextController,
//     required this.passwordTextController,
//     required this.formKey,
//   }) : super(key: key);

//   final TextEditingController emailTextController;
//   final TextEditingController passwordTextController;
//   final GlobalKey<FormState> formKey;

//   @override
//   Widget build(BuildContext context) {
//     BlocProvider.of<LoginBloc>(context).state;
//     return BlocConsumer<LoginBloc, LoginState>(
//       listener: (context, loginState) {
//         // if (loginState is ) {
//         //   Navigator.of(context).pushNamed('/userhome');
//         // }
//         if (loginState is LoginLoading) {
//           final snackBar = SnackBar(content: Text("Login in progress"));

//           // ScaffoldMessenger.of(context).showSnackBar(snackBar);
//           CircularProgressIndicator();
//         }

//         if (loginState is LoggingSuccess) {
//           // buttonChild = Text(authState.errorMsg);
//           String role = loginState.user.role;
//           Navigator.of(context)
//               .pushNamed(RouteGenerator.HomePage, arguments: role);
//         }

//         if (loginState is LoginFailure) {
//           // buttonChild = Text(authState.errorMsg);

//           final snackBar = SnackBar(content: Text(loginState.error));

//           ScaffoldMessenger.of(context).showSnackBar(snackBar);
//         }
//       },
//       builder: (ctx, authState) {
//         Widget buttonChild = Text("Login");

//         return LoginButton(
//             formKey: formKey,
//             emailTextController: emailTextController,
//             passwordTextController: passwordTextController,
//             buttonChild: buttonChild);
//       },
//     );
//   }
// }

// class BankImage extends StatelessWidget {
//   const BankImage({
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: 400,
//       height: MediaQuery.of(context).size.height / 3,
//       // decoration: BoxDecoration(color: Colors.black),
//       child: Image.asset('assets/images/bankingforLogin.jpg'),
//     );
//   }
// }

// // class PasswordField extends StatelessWidget {
// //   const PasswordField({
// //     Key? key,
// //     required this.passwordTextController,
// //     required this.inputFieldStyle,
// //   }) : super(key: key);

// //   final TextEditingController passwordTextController;
// //   final InputDecoration inputFieldStyle;

// //   @override
// //   Widget build(BuildContext context) {
// //     return PasswordField(
// //         passwordTextController: passwordTextController,
// //         inputFieldStyle: inputFieldStyle);
// //   }
// // }

// class LoginButton extends StatelessWidget {
//   const LoginButton({
//     Key? key,
//     required this.formKey,
//     required this.emailTextController,
//     required this.passwordTextController,
//     required this.buttonChild,
//   }) : super(key: key);

//   final TextEditingController emailTextController;
//   final TextEditingController passwordTextController;
//   final Widget buttonChild;
//   final GlobalKey<FormState> formKey;

//   @override
//   Widget build(BuildContext context) {
//     return ElevatedButton(
//       onPressed: () {
//         // use the information provided
//         final authBloc = BlocProvider.of<LoginBloc>(context);

//         authBloc.add(LoginButtonPressed(
//             email: emailTextController.text,
//             password: passwordTextController.text));
//       },
//       child: buttonChild,
//     );
//   }
// }

// class EmailField extends StatelessWidget with InputValidationMixin {
//   const EmailField({
//     Key? key,
//     required this.emailTextController,
//   }) : super(key: key);

//   final TextEditingController emailTextController;

//   @override
//   Widget build(BuildContext context) {
//     return TextFormField(
//       controller: emailTextController,
//       decoration: const InputDecoration(
//         icon: Icon(Icons.email),
//         hintText: "Email",
//       ),
//     );
//   }
// }

// class PasswordField extends StatelessWidget with InputValidationMixin {
//   const PasswordField({
//     Key? key,
//     required this.passwordTextController,
//     required this.inputFieldStyle,
//   }) : super(key: key);

//   final TextEditingController passwordTextController;
//   final InputDecoration inputFieldStyle;

//   @override
//   Widget build(BuildContext context) {
//     return TextFormField(
//       obscureText: true,
//       controller: passwordTextController,
//       decoration: const InputDecoration(
//         icon: Icon(Icons.security),
//         hintText: "Password",
//       ),
//     );
//   }
// }
