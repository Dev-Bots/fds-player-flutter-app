import 'dart:io';

import 'package:dev_player_fds/Bloc/EventBloc/event_bloc.dart';
import 'package:dev_player_fds/Data/repository/repository.dart';
import 'package:dev_player_fds/Presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dev_player_fds/Data/provider/provider.dart';
import '../../Data/repository/repository.dart';
import 'package:http/http.dart' as http;

import 'package:dev_player_fds/Data/models/Account/Account.dart';
import 'package:dev_player_fds/Presentation/widgets/profile/button_widget.dart';
import 'package:dev_player_fds/Presentation/widgets/profile/profile_widget.dart';
import 'package:dev_player_fds/Presentation/widgets/profile/textfield_widget.dart';
import 'package:sticky_footer_scrollview/sticky_footer_scrollview.dart';

import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';

class SplashPage extends StatelessWidget {
  SplashPage({Key? key}) : super(key: key);

  final repo = EventRepository();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // drawer: const CustomDrawer(),
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
          leadingWidth: 20,
          // leading: BackButton(),

          // actions: const [
          //   Padding(
          //     padding: EdgeInsets.all(8.0),
          //     child: NotificationButton(),
          //   )
          // ],
          title: CustomTitle('Football Drafting System'),
          iconTheme: const IconThemeData(color: Colors.black),
        ),
        body: BlocProvider(
          // create: (context) => EventBloc(repo)..add(GetEvent(eventId: eventId)),
          create: (context) => EventBloc(),
          child: SafeArea(
            child: BlocListener<EventBloc, EventState>(
              listener: (context, state) {
                if (state is EventLoaded) {
                  // print(state.event.eventName);
                }
              },
              child: BlocBuilder<EventBloc, EventState>(
                builder: (context, state) {
                  if (state is EventLoading) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }

                  return Center(
                    child: Text('Unknown state'),
                  );
                },
              ),
            ),
          ),
        ));
  }
}
