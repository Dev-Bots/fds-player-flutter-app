import 'dart:convert';
import 'dart:io';

import 'package:dev_player_fds/Bloc/bloc.dart';
import 'package:dev_player_fds/Data/models/models.dart';
import 'package:dev_player_fds/Presentation/screens/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_image_picker/form_builder_image_picker.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:intl/intl.dart';
// import 'package:flutter_form_builder/flutter_form_builder.dart';

import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class ApiImage {
  final String imageUrl;
  final String id;
  ApiImage({
    required this.imageUrl,
    required this.id,
  });
}

class _RegisterPageState extends State<RegisterPage> {
  bool autoValidate = true;
  bool readOnly = false;
  bool showSegmentedControl = true;
  final _formKey = GlobalKey<FormBuilderState>();
  bool _ageHasError = false;
  bool _genderHasError = false;

  FormBuilderLocalizations get formBuilderLocalizations =>
      FormBuilderLocalizations.of(context);

  InputDecoration formDecoration(String labelText, Icon icon) =>
      InputDecoration(
        labelText: labelText,
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
        focusedErrorBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.red),
        ),
        errorBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.red),
        ),
      );

  var genderOptions = ['Male', 'Female'];

  var footOptions = ['Right', 'Left'];

  var educationLevelOptions = [
    'High School',
    'Degree',
    'Middle School',
    'Vocational'
  ];

  var positionOptions = ['Goalkeeper', 'Defender', 'Midfielder', 'Striker'];

  void _onChanged(dynamic val) => debugPrint(val.toString());

  @override
  Widget build(BuildContext context) {
    formBuilderLocalizations;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0,
        title: const Padding(
          padding: EdgeInsets.only(left: 40),
          child: Text(
            'Register an account',
            style: TextStyle(color: Colors.black),
          ),
        ),
        // actions: const [
        //   Padding(
        //     padding: EdgeInsets.all(15.0),
        //     child: LogoutButton(),
        //   )
        // ],
      ),
      body: BlocProvider(
        create: (context) => AuthBloc(),
        child: BlocBuilder<AuthBloc, AuthState>(
          builder: (context, state) {
            return Scaffold(
              body: SafeArea(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.width * 0.07),
                    child: Column(
                      children: <Widget>[
                        SizedBox(height: 20.0),
                        FormBuilder(
                          key: _formKey,
                          autovalidateMode: AutovalidateMode.disabled,
                          child: Column(
                            children: <Widget>[
                              // Profile Image
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal:
                                        MediaQuery.of(context).size.width *
                                            0.23),
                                child: Container(
                                  child: FormBuilderImagePicker(
                                    name: 'profile_image',
                                    displayCustomType: (obj) =>
                                        obj is ApiImage ? obj.imageUrl : obj,
                                    decoration: const InputDecoration(
                                        border: OutlineInputBorder(),
                                        labelText: 'Pick your profile picture'),
                                    maxImages: 1,
                                    // initialValue: [
                                    //   'https://images.pexels.com/photos/7078045/pexels-photo-7078045.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260',
                                    //   ApiImage(
                                    //     id: 'whatever',
                                    //     imageUrl:
                                    //         'https://images.pexels.com/photos/8311418/pexels-photo-8311418.jpeg?auto=compress&cs=tinysrgb&dpr=3&h=750&w=1260',
                                    //   ),
                                    // ],
                                  ),
                                ),
                              ),

                              //Username
                              const SizedBox(height: 20.0),
                              FormBuilderTextField(
                                name: 'username',
                                decoration: formDecoration(
                                    'Username', Icon(Icons.person)),
                                onChanged: _onChanged,
                                // valueTransformer: (text) => num.tryParse(text),
                                validator: FormBuilderValidators.compose([
                                  FormBuilderValidators.required(),
                                  FormBuilderValidators.minLength(3),
                                  FormBuilderValidators.maxLength(20),
                                  FormBuilderValidators.match(
                                      r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{8,}$'),
                                ]),
                              ),

                              //Password
                              const SizedBox(height: 20.0),
                              FormBuilderTextField(
                                name: 'password',
                                obscureText: true,
                                decoration: formDecoration(
                                    'Password', Icon(Icons.lock)),
                                onChanged: _onChanged,
                                // valueTransformer: (text) => num.tryParse(text),
                                validator: FormBuilderValidators.compose([
                                  FormBuilderValidators.required(),
                                  FormBuilderValidators.minLength(8),
                                  FormBuilderValidators.maxLength(20),
                                  FormBuilderValidators.match(
                                      r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{8,}$'),
                                ]),
                              ),

                              //Confirm Password
                              const SizedBox(height: 20.0),
                              FormBuilderTextField(
                                name: 'confirm_password',
                                obscureText: true,
                                decoration: formDecoration(
                                    'Confirm Password', Icon(Icons.lock)),
                                onChanged: _onChanged,
                                // valueTransformer: (text) => num.tryParse(text),
                                validator: FormBuilderValidators.compose([
                                  FormBuilderValidators.required(),
                                  FormBuilderValidators.minLength(8),
                                  FormBuilderValidators.maxLength(20),
                                  FormBuilderValidators.match(
                                      r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{8,}$'),
                                ]),
                              ),

                              // First Name
                              const SizedBox(height: 20.0),
                              FormBuilderTextField(
                                name: 'first_name',
                                decoration: formDecoration(
                                    'First Name', Icon(Icons.person)),
                                onChanged: _onChanged,
                                // valueTransformer: (text) => num.tryParse(text),
                                validator: FormBuilderValidators.compose([
                                  FormBuilderValidators.required(),
                                  FormBuilderValidators.minLength(3),
                                  FormBuilderValidators.maxLength(20),
                                  FormBuilderValidators.match(r'^[a-zA-Z]+$'),
                                ]),
                                keyboardType: TextInputType.name,
                              ),

                              // Last Name
                              const SizedBox(height: 20.0),
                              FormBuilderTextField(
                                  name: 'last_name',
                                  decoration: formDecoration(
                                      'Last Name', Icon(Icons.person)),
                                  onChanged: _onChanged,
                                  // valueTransformer: (text) => num.tryParse(text),
                                  validator: FormBuilderValidators.compose([
                                    FormBuilderValidators.required(),
                                    FormBuilderValidators.minLength(3),
                                    FormBuilderValidators.maxLength(20),
                                    FormBuilderValidators.match(r'^[a-zA-Z]+$'),
                                  ]),
                                  keyboardType: TextInputType.name),

                              // Phone Number
                              const SizedBox(height: 20.0),
                              FormBuilderTextField(
                                  name: 'phone_number',
                                  decoration: formDecoration(
                                      'Phone Number', Icon(Icons.phone)),
                                  onChanged: _onChanged,
                                  // valueTransformer: (text) => num.tryParse(text),
                                  validator: FormBuilderValidators.compose([
                                    FormBuilderValidators.required(),
                                    FormBuilderValidators.minLength(10),
                                    FormBuilderValidators.numeric(),
                                    FormBuilderValidators.match(r'^[0-9]+$'),
                                  ]),
                                  keyboardType: TextInputType.phone),

                              const SizedBox(height: 20.0),
                              FormBuilderTextField(
                                  name: 'address',
                                  decoration: formDecoration(
                                      'Address', Icon(Icons.home_work_sharp)),
                                  onChanged: _onChanged,
                                  // valueTransformer: (text) => num.tryParse(text),
                                  validator: FormBuilderValidators.compose([
                                    // FormBuilderValidators.required(),

                                    FormBuilderValidators.match(
                                        r'^[a-zA-Z0-9]+$'),
                                  ]),
                                  keyboardType: TextInputType.text),

                              const SizedBox(height: 20.0),
                              FormBuilderTextField(
                                  name: 'overview',
                                  decoration: formDecoration(
                                      'Overview', Icon(Icons.description)),
                                  onChanged: _onChanged,
                                  // valueTransformer: (text) => num.tryParsce(text),
                                  validator: FormBuilderValidators.compose([
                                    FormBuilderValidators.match(
                                        r'^[a-zA-Z0-9]+$'),
                                  ]),
                                  keyboardType: TextInputType.multiline),

                              // GENDER
                              const SizedBox(height: 20.0),
                              SizedBox(height: 10.0),
                              FormBuilderDropdown(
                                name: 'gender',
                                decoration: formDecoration(
                                    'Select Gender', Icon(Icons.man)),
                                // initialValue: 'Male',
                                allowClear: true,

                                validator: FormBuilderValidators.compose(
                                    [FormBuilderValidators.required()]),
                                items: genderOptions
                                    .map((gender) => DropdownMenuItem(
                                          value: gender,
                                          child: Text('$gender'),
                                        ))
                                    .toList(),
                              ),

                              // Birthdate
                              const SizedBox(height: 20.0),
                              FormBuilderDateTimePicker(
                                name: 'dob',
                                onChanged: _onChanged,
                                inputType: InputType.date,
                                decoration: formDecoration(
                                    'Birth Date', Icon(Icons.calendar_today)),
                                format: DateFormat('yyyy-MM-dd'),
                                // initialValue: DateTime.now(),
                                // enabled: true,
                              ),

                              //Birth Certificate
                              const SizedBox(height: 30.0),
                              Padding(
                                padding: EdgeInsets.fromLTRB(10, 0, 170, 0),
                                child: Container(
                                  child: FormBuilderImagePicker(
                                    name: 'birth_certificate',
                                    displayCustomType: (obj) =>
                                        obj is ApiImage ? obj.imageUrl : obj,
                                    decoration: const InputDecoration(
                                      border: OutlineInputBorder(),
                                      labelText: 'Upload birth certificate',
                                      helperText: "You can't edit this later!",
                                    ),
                                    maxImages: 1,

                                    // initialValue: [
                                    //   'https://images.pexels.com/photos/7078045/pexels-photo-7078045.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260',
                                    //   ApiImage(
                                    //     id: 'whatever',
                                    //     imageUrl:
                                    //         'https://images.pexels.com/photos/8311418/pexels-photo-8311418.jpeg?auto=compress&cs=tinysrgb&dpr=3&h=750&w=1260',
                                    //   ),
                                    // ],
                                  ),
                                ),
                              ),

                              // Video Url
                              const SizedBox(height: 20.0),
                              FormBuilderTextField(
                                name: 'video',
                                decoration: formDecoration(
                                    'Video Url', Icon(Icons.video_library)),
                                onChanged: _onChanged,
                                // valueTransformer: (text) => num.tryParse(text),
                                validator: FormBuilderValidators.compose([
                                  FormBuilderValidators.minLength(10),
                                  FormBuilderValidators.url(),
                                ]),
                                keyboardType: TextInputType.url,
                              ),

                              // Education Level
                              const SizedBox(height: 20.0),
                              FormBuilderDropdown(
                                name: 'education_level',
                                decoration: formDecoration(
                                    'Education Level', Icon(Icons.school)),
                                allowClear: true,
                                items: educationLevelOptions
                                    .map((educationLevel) => DropdownMenuItem(
                                          value: educationLevel,
                                          child: Text('$educationLevel'),
                                        ))
                                    .toList(),
                              ),

                              //Highest Education Evidence
                              const SizedBox(height: 30.0),
                              Padding(
                                padding: EdgeInsets.fromLTRB(10, 0, 170, 0),
                                child: Container(
                                  child: FormBuilderImagePicker(
                                    name: 'highest_education_evidence',
                                    displayCustomType: (obj) =>
                                        obj is ApiImage ? obj.imageUrl : obj,
                                    decoration: const InputDecoration(
                                      border: OutlineInputBorder(),
                                      labelText: 'Upload Education Evidence',
                                      helperText: "You can't edit this later!",
                                    ),
                                    maxImages: 1,

                                    // initialValue: [
                                    //   'https://images.pexels.com/photos/7078045/pexels-photo-7078045.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260',
                                    //   ApiImage(
                                    //     id: 'whatever',
                                    //     imageUrl:
                                    //         'https://images.pexels.com/photos/8311418/pexels-photo-8311418.jpeg?auto=compress&cs=tinysrgb&dpr=3&h=750&w=1260',
                                    //   ),
                                    // ],
                                  ),
                                ),
                              ),

                              // Foot
                              const SizedBox(height: 20.0),
                              FormBuilderDropdown(
                                name: 'foot',
                                decoration: formDecoration('Preferred Foot',
                                    Icon(Icons.run_circle_outlined)),
                                allowClear: true,
                                items: footOptions
                                    .map((feet) => DropdownMenuItem(
                                          value: feet,
                                          child: Text('$feet'),
                                        ))
                                    .toList(),
                              ),

                              // Weight
                              const SizedBox(height: 20.0),
                              FormBuilderTextField(
                                name: 'weight',
                                decoration: formDecoration(
                                    'Weight', Icon(Icons.accessibility)),
                                onChanged: _onChanged,
                                // valueTransformer: (text) => num.tryParsce(text),
                                validator: FormBuilderValidators.compose([
                                  FormBuilderValidators.min(0),
                                  FormBuilderValidators.max(300),
                                  FormBuilderValidators.numeric(),
                                ]),
                                keyboardType: TextInputType.number,
                              ),

                              // Height
                              const SizedBox(height: 20.0),
                              FormBuilderTextField(
                                name: 'height',
                                decoration: formDecoration(
                                    'Height', Icon(Icons.accessibility)),
                                onChanged: _onChanged,
                                // valueTransformer: (text) => num.tryParsce(text),
                                validator: FormBuilderValidators.compose([
                                  FormBuilderValidators.min(0),
                                  FormBuilderValidators.max(10),
                                  FormBuilderValidators.numeric(),
                                ]),
                                keyboardType: TextInputType.number,
                              ),
                              // Position 1
                              const SizedBox(height: 20.0),
                              FormBuilderDropdown(
                                name: 'playing_possition1',
                                decoration: formDecoration('Preferred Position',
                                    Icon(Icons.fitness_center)),
                                allowClear: true,
                                items: positionOptions
                                    .map((position) => DropdownMenuItem(
                                          value: position,
                                          child: Text('$position'),
                                        ))
                                    .toList(),
                              ),
                              // Position 2
                              const SizedBox(height: 20.0),
                              FormBuilderDropdown(
                                name: 'playing_possition2',
                                decoration: formDecoration('Preferred Position',
                                    Icon(Icons.fitness_center)),
                                allowClear: true,
                                items: positionOptions
                                    .map((position) => DropdownMenuItem(
                                          value: position,
                                          child: Text('$position'),
                                        ))
                                    .toList(),
                              ),
                            ],
                          ),
                        ),

                        const SizedBox(height: 10),
                        // I have read and agreed
                        FormBuilderCheckbox(
                          name: 'accept_terms',
                          initialValue: false,
                          onChanged: _onChanged,
                          title: RichText(
                            text: const TextSpan(
                              children: [
                                TextSpan(
                                  text: 'I have read and agree to the ',
                                  style: TextStyle(color: Colors.black),
                                ),
                                TextSpan(
                                  text: 'Terms and Conditions',
                                  style: TextStyle(color: Colors.blue),
                                ),
                              ],
                            ),
                          ),
                          validator: FormBuilderValidators.equal(
                            true,
                            errorText:
                                'You must accept terms and conditions to continue',
                          ),
                        ),

                        const SizedBox(height: 5),
                        Row(
                          children: <Widget>[
                            Expanded(
                              child: ElevatedButton(
                                style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Colors.black),
                                  foregroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Colors.white),
                                ),
                                onPressed: () {
                                  File proPic = File(_formKey.currentState!
                                      .fields['profile_image']!.value[0].path);

                                  // http.MultipartFile proPicFile =
                                  //     http.MultipartFile.fromFile(
                                  //   'profile_image',
                                  //   proPic.path,
                                  //   filename: proPic.path.split('/').last,
                                  //   contentType: MediaType.parse('image/jpeg'),
                                  // );

                                  // File birthCert = File(_formKey.currentState!
                                  //     .fields['birth_certificate']!.value[0].path);

                                  // var request = http.MultipartRequest(
                                  //     'POST',
                                  //     Uri.parse(
                                  //         'http://10.0.2.2:8000/api/players/'));
                                  // request.files.add(http.MultipartFile.fromBytes(
                                  //     'profile_picture',
                                  //     proPic.readAsBytesSync()));

                                  // request.send().then((response) {
                                  //   print(response.statusCode);
                                  // });

                                  _formKey.currentState!.save();

                                  print(_formKey
                                      .currentState!.fields['gender']!.value);
                                  // print(proPic);

                                  final authBloc =
                                      BlocProvider.of<AuthBloc>(context);

                                  More more = More(
                                    overview: 'JOOOLLLOOOO',
                                    gender: 'MALE',
                                    dob: '2022-01-01',
                                    // video: '',
                                    birthCertificate: proPic,
                                    educationLevel: 'University',
                                    highestEducationEvidence: proPic,
                                    foot: 'RIGHT',
                                    weight: 150.0,
                                    height: 1.70,
                                    playingPossition1: 'GK',
                                    playingPossition2: 'GK',
                                  );

                                  Account account = Account(
                                    // firstName: firstNAmeTextController.text,
                                    // lastName: lastNameTextController.text,
                                    // email: emailTextController.text,
                                    // phoneNumber: phoneNumberTextController.text,
                                    // address: addressTextController.text,
                                    // password: passwordTextController.text,

                                    userName: 'trial',
                                    profilePicture: jsonEncode(proPic),
                                    firstName: 'Biruk',
                                    lastName: 'Tesfaye',
                                    phoneNumber: '0911165659',
                                    address: 'Addis Ababa. Ethiopia',
                                    password: 'pass',
                                    more: more,
                                  );
                                  print(account.toJson());

                                  authBloc.add(Register(account: account));

                                  //  _formKey.currentState!.reset();

                                  // if (_formKey.currentState!.validate()) {
                                  //   print(_formKey.currentState!.value);

                                  // } else {
                                  //   print("validation failed");
                                  // }
                                },
                                child: const Text("Register Account"),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
