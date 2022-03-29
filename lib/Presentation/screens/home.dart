
import 'package:dev_player_fds/Data/models/models.dart';
import 'package:dev_player_fds/Presentation/widgets/widgets.dart';

import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const CustomDrawer(),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        leadingWidth: 20,
        // leading: BackButton(),

        actions: const [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: NotificationButton(),
          )
        ],
        title: CustomTitle('Football Drafting System'),
        iconTheme: const IconThemeData(color: Colors.black),
      ),

      body: SafeArea(
          child: Column(
        children: [
          SearchBar(),
          Expanded(
            child: ListView.builder(
                scrollDirection: Axis.vertical,
                padding: const EdgeInsets.all(20),
                // itemCount: jobList.length,
                itemCount: 5,
                itemBuilder: (context, index) {
                  return EventTile('', '');
                }),
          ),
        ],
      )),

      // child: Column(
      //   children: [
      //     Expanded(
      //       child: SizedBox(
      //         height: 200,
      //         child: ListView.builder(
      //             scrollDirection: Axis.vertical,
      //             padding: const EdgeInsets.all(20),
      //             // itemCount: jobList.length,
      //             itemCount: 5,
      //             itemBuilder: (context, index) {
      //               // return FadeAnimation(
      //               //     (1.0 + index) / 4, jobComponent(job: jobList[index]));
      //               return JobComponent('', '');
      //             }),
      //       ),
      //     ),
      //   ],
      // ),
    );
  }
}
class NotificationButton extends StatelessWidget {
  const NotificationButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
        iconSize: 30,
        onPressed: () {},
        icon: const Icon(
          Icons.notifications_none,
          // color: Colors.grey.shade400,
          color: Colors.black,
        ));
  }
}