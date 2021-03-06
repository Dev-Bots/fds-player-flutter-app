import 'package:flutter/material.dart';

class BackButton extends StatelessWidget {
  const BackButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
        padding: EdgeInsets.only(left: 20),
        onPressed: () {},
        icon: Icon(
          Icons.arrow_back_ios,
          color: Colors.grey.shade600,
        ));
  }
}
