// import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:dev_player_fds/Bloc/bloc.dart';
import 'package:dev_player_fds/Data/repository/repository.dart';
import 'package:dev_player_fds/Presentation/validation/validation.dart';
import 'package:dev_player_fds/Presentation/widgets/profile/button_widget.dart';
import 'package:dev_player_fds/Presentation/widgets/profile/numbers_widget.dart';
import 'package:dev_player_fds/Presentation/widgets/profile/profile_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../Data/models/models.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final formKey = GlobalKey<FormState>();

  final firstNameTextController = TextEditingController();
  final lastNameTextController = TextEditingController();
  final dobTextController = TextEditingController();
  final addressTextController = TextEditingController();
  final passwordTextController = TextEditingController();
  final emailTextController = TextEditingController(text: 'Hey');
  final phoneNumberTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0,
        actions: const [
          Padding(
            padding: EdgeInsets.all(15.0),
            child: LogoutButton(),
          )
        ],
      ),
      body: BlocBuilder<AccountBloc, AccountState>(
        builder: (context, state) {
          return BlocBuilder<AccountBloc, AccountState>(
            builder: (context, state) {
              if (state is AccountLoading) {
                return Center(
                  child: CircularProgressIndicator(color: Colors.black),
                );
              } else if (state is AccountLoaded) {
                return ListView(
                  physics: const BouncingScrollPhysics(),
                  children: [
                    SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                    ProfileWidget(
                      imagePath:
                          'https://media.istockphoto.com/photos/male-lion-resting-on-a-rock-picture-id1333977253?b=1&k=20&m=1333977253&s=170667a&w=0&h=q_EqYl_GqFCR1XmF_AK91YRFDapwAClOoc2fZbsnmr4=',
                      onClicked: () async {
                        await Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (context) => ProfilePage()),
                        );
                        setState(() {});
                      },
                    ),
                    const SizedBox(height: 24),
                    buildName(),
                    const SizedBox(height: 24),
                    // Center(child: buildUpgradeButton()),
                    // const SizedBox(height: 24),
                    NumbersWidget(),
                    // const SizedBox(height: 24),
                    buildEditForm(),
                  ],
                );
              } else if (state is AccountFailed) {
                return Center(
                  child: Text('Error'),
                );
              } else {
                return Center(
                  child: Text('Unknown state'),
                );
              }
            },
          );
        },
      ),
    );
  }

  Widget buildName() => Column(
        children: [
          Text(
            'user.name',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
          ),
          const SizedBox(height: 4),
          Text(
            'user.email',
            style: TextStyle(color: Colors.grey),
          )
        ],
      );

  Widget buildUpgradeButton() => ButtonWidget(
        text: 'Upgrade To PRO',
        onClicked: () {},
      );

  Widget buildEditForm() {
    inputFieldStyle(String hinText, Icon icon) => FormDecoration(hinText, icon);

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SingleChildScrollView(
            child: Container(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Form(
                  key: formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: 20.0),
                      // RegisterImage(),
                      SizedBox(height: 20.0),
                      EditFirstName(
                        firstNameTextController: firstNameTextController,
                        inputFieldStyle: inputFieldStyle(
                            'First Name',
                            Icon(
                              Icons.person,
                              color: Colors.black,
                            )),
                      ),

                      EditLastName(
                          lastNameTextController: lastNameTextController,
                          inputFieldStyle: inputFieldStyle('Lastee',
                              Icon(Icons.person, color: Colors.grey))),
                      EditDOB(
                          dobTextController: dobTextController,
                          inputFieldStyle: inputFieldStyle('DOB',
                              Icon(Icons.calendar_today, color: Colors.grey))),
                      EditAddress(
                          addressTextController: addressTextController,
                          inputFieldStyle: inputFieldStyle('Address',
                              Icon(Icons.location_on, color: Colors.grey))),
                      EditEmail(
                        emailTextController: emailTextController,
                        inputFieldStyle: inputFieldStyle(
                            'Email', Icon(Icons.email, color: Colors.grey)),
                      ),
                      EditPhoneNumber(
                          phoneNumberTextController: phoneNumberTextController,
                          inputFieldStyle: inputFieldStyle('Phone Number',
                              Icon(Icons.phone, color: Colors.grey))),

                      SizedBox(height: 30.0),
                      EditStateCheckBloc(
                        firstNameTextController: firstNameTextController,
                        lastNameTextController: lastNameTextController,
                        dobTextController: dobTextController,
                        addressTextController: addressTextController,
                        passwordTextController: passwordTextController,
                        emailTextController: emailTextController,
                        phoneNumberTextController: phoneNumberTextController,
                        formKey: formKey,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  InputDecoration FormDecoration(String hintText, Icon icon) => InputDecoration(
        hintText: hintText,
        // hintStyle: TextStyle(color: Colors.grey),
        icon: icon,

        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
        ),
        // focusedBorder: const UnderlineInputBorder(
        //   borderSide: BorderSide(color: Colors.black),
        // ),
        focusColor: Colors.black,
        iconColor: Colors.black,
        focusedErrorBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.red),
        ),
        errorBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.red),
        ),
      );
  // return InputDecoration(
  //   focusColor: Colors.black,
  //   fillColor: Colors.black,
  //   focusedBorder: OutlineInputBorder(
  //     borderSide: BorderSide(color: Colors.black),
  //   ),
  //   filled: true,
  //   enabledBorder: OutlineInputBorder(
  //     borderSide: BorderSide(color: Colors.black, width: 20),
  //   ),
  //   border: OutlineInputBorder(
  //     // borderRadius: BorderRadius.circular(10),
  //     borderSide: BorderSide(color: Colors.black, width: 20),
  //   ),
  //   iconColor: Colors.black,
  //   labelText: '',
  //   labelStyle: TextStyle(color: Colors.white),
  //   hintText: hintText,
  //   hintStyle: TextStyle(color: Colors.white),
  // );
}

// ======================= Fieds ==========================

class EditFirstName extends StatelessWidget with InputValidationMixin {
  const EditFirstName({
    Key? key,
    required this.firstNameTextController,
    required this.inputFieldStyle,
  }) : super(key: key);

  final TextEditingController firstNameTextController;
  final InputDecoration inputFieldStyle;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enabled: false,
      controller: firstNameTextController,
      validator: (name) {
        if (isValidName(name!))
          return null;
        else
          return 'Invalid Input';
      },
      decoration: inputFieldStyle,
    );
  }
}

class EditLastName extends StatelessWidget with InputValidationMixin {
  const EditLastName({
    Key? key,
    required this.lastNameTextController,
    required this.inputFieldStyle,
  }) : super(key: key);

  final TextEditingController lastNameTextController;
  final InputDecoration inputFieldStyle;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: lastNameTextController,
      validator: (name) {
        if (isValidName(name!))
          return null;
        else
          return 'Invalid Input';
      },
      decoration: inputFieldStyle,
      // decoration: InputDecoration(
      //   icon: Icon(Icons.person_outlined),
      //   hintText: "Last Name",
      // ),
    );
  }
}

class EditDOB extends StatelessWidget with InputValidationMixin {
  const EditDOB({
    Key? key,
    required this.dobTextController,
    required this.inputFieldStyle,
  }) : super(key: key);

  final TextEditingController dobTextController;
  final InputDecoration inputFieldStyle;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: dobTextController,
      validator: (date) {
        if (isDateValid(date!)) {
          return null;
        } else {
          return 'Invalid Input';
        }
      },
      decoration: const InputDecoration(
          icon: Icon(Icons.date_range), hintText: "Date of Birth"),
    );
  }
}

class EditAddress extends StatelessWidget with InputValidationMixin {
  const EditAddress({
    Key? key,
    required this.addressTextController,
    required this.inputFieldStyle,
  }) : super(key: key);

  final TextEditingController addressTextController;
  final InputDecoration inputFieldStyle;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: addressTextController,
      decoration: InputDecoration(
        icon: Icon(Icons.home),
        hintText: "Address",
      ),
    );
  }
}

class EditPhoneNumber extends StatelessWidget with InputValidationMixin {
  const EditPhoneNumber({
    Key? key,
    required this.phoneNumberTextController,
    required this.inputFieldStyle,
  }) : super(key: key);

  final TextEditingController phoneNumberTextController;
  final InputDecoration inputFieldStyle;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: phoneNumberTextController,
      validator: (phoneNumber) {
        if (isValidName(phoneNumber!))
          return null;
        else
          return 'Invalid Phone Number';
      },
      decoration: InputDecoration(
        icon: Icon(Icons.phone),
        hintText: "Phone Number",
      ),
    );
  }
}

class EditEmail extends StatelessWidget with InputValidationMixin {
  const EditEmail({
    Key? key,
    required this.emailTextController,
    required this.inputFieldStyle,
  }) : super(key: key);

  final TextEditingController emailTextController;
  final InputDecoration inputFieldStyle;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: emailTextController,
      validator: (email) {
        if (isEmailValid(email!))
          return null;
        else
          return 'Invalid Input';
      },
      decoration: InputDecoration(
        icon: Icon(Icons.email),
        hintText: "Email",
      ),
    );
  }
}

// ====================== EditStateCheckBloc ===========================

class EditStateCheckBloc extends StatelessWidget {
  const EditStateCheckBloc({
    Key? key,
    required this.firstNameTextController,
    required this.lastNameTextController,
    required this.dobTextController,
    required this.addressTextController,
    required this.passwordTextController,
    required this.emailTextController,
    required this.phoneNumberTextController,
    required this.formKey,
  }) : super(key: key);

  final TextEditingController firstNameTextController;
  final TextEditingController lastNameTextController;
  final TextEditingController dobTextController;
  final TextEditingController addressTextController;
  final TextEditingController passwordTextController;
  final TextEditingController emailTextController;
  final TextEditingController phoneNumberTextController;

  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context) {
    final repo = AuthRepository();
    return BlocProvider(
      create: (context) => AuthBloc(),
      child: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, registerState) {
          // if (loginState is ) {
          //   Navigator.of(context).pushNamed('/userhome');
          // }
          if (registerState is Registering) {
            // final snackBar = SnackBar(content: Text(registerState.message));
            final snackBar = SnackBar(content: Text('Supposed to be sth...'));
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
            // ScaffoldMessenger.of(context).showSnackBar(snackBar);
            // CircularProgressIndicator();
          }
          // final snackBar = SnackBar(
          //   content: Text(authState.message),
          //   duration: Duration(seconds: 5),
          // );
          // ScaffoldMessenger.of(context).showSnackBar(snackBar);
          if (registerState is Registered) {
            firstNameTextController.clear();
            lastNameTextController.clear();
            dobTextController.clear();
            addressTextController.clear();
            passwordTextController.clear();
            emailTextController.clear();
            phoneNumberTextController.clear();

            // Navigator.push(
            //     context,
            //     MaterialPageRoute(
            //         builder: (_) => OTP(tempPassword: registerState.message)));

            // buttonChild = Text(authState.errorMsg);
            // String role = authState.user.role;
            // Navigator.of(context)
            //     .pushNamed(RouteGenerator.HomePage, arguments: role);
          }

          if (registerState is RegisterFailed) {
            // buttonChild = Text(authState.errorMsg);

            final snackBar = SnackBar(content: Text(registerState.error));

            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          }
        },
        builder: (ctx, authState) {
          return EditButton(
            firstNameTextController: firstNameTextController,
            lastNameTextController: lastNameTextController,
            dobTextController: dobTextController,
            addressTextController: addressTextController,
            passwordTextController: passwordTextController,
            emailTextController: emailTextController,
            phoneNumberTextController: phoneNumberTextController,
            formKey: formKey,
          );
        },
      ),
    );
  }
}

// ======================== Register Button ===============================

class EditButton extends StatelessWidget {
  const EditButton({
    Key? key,
    required this.firstNameTextController,
    required this.lastNameTextController,
    required this.dobTextController,
    required this.addressTextController,
    required this.passwordTextController,
    required this.emailTextController,
    required this.phoneNumberTextController,
    required this.formKey,
  }) : super(key: key);

  final TextEditingController firstNameTextController;
  final TextEditingController lastNameTextController;
  final TextEditingController dobTextController;
  final TextEditingController addressTextController;
  final TextEditingController passwordTextController;
  final TextEditingController emailTextController;
  final TextEditingController phoneNumberTextController;

  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(Colors.black),
        foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
      ),
      onPressed: () {
        // if (formKey.currentState!.validate()) {
        //   final authBloc = BlocProvider.of<AuthBloc>(context);
        //   More more = More(
        //     overview: addressTextController.text,
        //   );
        //   Account account = Account(
        //     // firstName: firstNAmeTextController.text,
        //     // lastName: lastNameTextController.text,
        //     // email: emailTextController.text,
        //     // phoneNumber: phoneNumberTextController.text,
        //     // address: addressTextController.text,
        //     // password: passwordTextController.text,

        //     firstName: 'Biruk',
        //     lastName: 'Tesfaye',
        //     email: 'biruk@gmail.com',
        //     phoneNumber: '0911165659',
        //     address: 'Addis Ababa. Ethiopia',
        //     password: passwordTextController.text,
        //     more: more,
        //   );
        //   print(account.toString());
        //   authBloc.add(Register(account: account));
        // }

        final authBloc = BlocProvider.of<AuthBloc>(context);

        More more = More(
          overview: 'JOOOLLLOOOO',
          gender: 'MALE',
          dob: '2022-01-01',
          video: '',
          // birthCertificate: '',
          educationLevel: '',
          // highestEducationEvidence: '',
          foot: '',
          weight: 150.0,
          height: 1.70,
          playingPossition1: '',
          playingPossition2: '',
        );

        Account account = Account(
          // firstName: firstNAmeTextController.text,
          // lastName: lastNameTextController.text,
          // email: emailTextController.text,
          // phoneNumber: phoneNumberTextController.text,
          // address: addressTextController.text,
          // password: passwordTextController.text,

          userName: 'biruk',
          // profilePicture: "http://127.0.0.1:8000/assests/images/profile_pictures/pexels-pixabay-161154.jpg",
          firstName: 'Biruk',
          lastName: 'Tesfaye',
          phoneNumber: '0911165659',
          address: 'Addis Ababa. Ethiopia',
          password: 'pass',
          more: more,
        );
        // print(account.toString());
        // print(account.more?.overview);
        authBloc.add(Register(account: account));
      },
      child: const Text("Edit Account"),
    );
  }
}

// ======================= Logout Button ========================

class LogoutButton extends StatelessWidget {
  const LogoutButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthBloc(),
      child: BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state) {
          return ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
              foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
            ),
            onPressed: () {
              final authBloc = BlocProvider.of<AuthBloc>(context);

              authBloc.add(Logout());
            },
            child: const Text("Logout"),
          );
        },
      ),
    );
  }
}
