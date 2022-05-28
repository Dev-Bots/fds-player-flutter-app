import 'dart:io';

// import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:dev_player_fds/Data/models/Account/Account.dart';
import 'package:dev_player_fds/Presentation/widgets/profile/button_widget.dart';
import 'package:dev_player_fds/Presentation/widgets/profile/profile_widget.dart';
import 'package:dev_player_fds/Presentation/widgets/profile/textfield_widget.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';

import 'package:path/path.dart';

class EditProfilePage extends StatefulWidget {
  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  // late Account user;
  late Account user = Account(
    accountID: 1,
    firstName: 'John',
    lastName: 'Doe',
    userName: 'johndoe',
  );

  // late User user;

  @override
  void initState() {
    super.initState();

    // user = UserPreferences.getUser();
    // const user = Account(

    // );
  }

  @override
  Widget build(BuildContext context) => Builder(
        builder: (context) => Scaffold(
          // appBar: buildAppBar(context),
          body: Container(
            padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 50.0),
            child: SafeArea(
              child: ListView(
                padding: EdgeInsets.symmetric(horizontal: 32),
                physics: BouncingScrollPhysics(),
                children: [
                  ProfileWidget(
                    imagePath:
                        'https://upload.wikimedia.org/wikipedia/en/8/80/St_George_SC_%28logo%29.png',
                    isEdit: true,
                    onClicked: () async {
                      final image = await ImagePicker()
                          .pickImage(source: ImageSource.gallery);

                      if (image == null) return;

                      final directory =
                          await getApplicationDocumentsDirectory();
                      final name = basename(image.path);
                      final imageFile = File('${directory.path}/$name');
                      final newImage =
                          await File(image.path).copy(imageFile.path);

                      // setState(() => user = user.copy(imagePath: newImage.path));
                    },
                  ),
                  const SizedBox(height: 24),
                  TextFieldWidget(
                      label: 'Full Name',
                      text: 'user.name',
                      // onChanged: (name) => user = user.copy(name: name),
                      onChanged: (String value) async {
                        if (value != '13') {
                          return;
                        }
                      }),
                  const SizedBox(height: 24),
                  TextFieldWidget(
                    label: 'Email',
                    text: user.address != null ? 'user.address' : '',
                    onChanged: (String value) async {
                      if (value != '13') {
                        return;
                      }
                      // onChanged: (email) => user = user.copy(email: email),
                    },
                  ),
                  const SizedBox(height: 24),
                  TextFieldWidget(
                      label: 'About',
                      text: user.address != null ? 'user.address' : '',
                      maxLines: 5,
                      onChanged: (String value) async {
                        if (value != '13') {
                          return;
                        }
                        // onChanged: (about) => user = user.copy(about: about),
                      }),
                  const SizedBox(height: 24),
                  ButtonWidget(
                    text: 'Save',
                    onClicked: () {
                      // UserPreferences.setUser(user);
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      );
}
