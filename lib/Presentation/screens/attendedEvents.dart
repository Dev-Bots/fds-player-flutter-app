import 'package:dev_player_fds/Data/models/models.dart';
import 'package:dev_player_fds/Data/provider/provider.dart';
import 'package:dev_player_fds/Presentation/widgets/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';

import '../../Bloc/bloc.dart';
import '../../Data/repository/repository.dart';

class AttendedEventsPage extends StatelessWidget {
  AttendedEventsPage({Key? key}) : super(key: key);

  // final repo = EventRepository(eventDataProvider: EventDataProvider());

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
            child: SomeActionButton(),
          )
        ],
        title: CustomTitle('Attended Events'),
        iconTheme: const IconThemeData(color: Colors.black),
      ),

      body: Center(
        child: Text('Attended Events'),
      ),

      // body: BlocProvider(
      //   create: (context) => EventBloc(repo)..add(GetAllEvents()),
      //   child: BlocBuilder<EventBloc, EventState>(
      //     builder: (context, state) {
      //       if (state is EventsLoading) {
      //         return Center(
      //           child: CircularProgressIndicator(),
      //         );
      //       } else if (state is EventsLoaded) {
      //         return SafeArea(
      //             child: Column(
      //           children: [
      //             const SearchBar(),
      //             Expanded(
      //               child: EventList(),
      //             )
      //           ],
      //         ));
      //       } else {
      //         return const Center(
      //           child: Text('Failed to load events'),
      //         );
      //       }
      //     },
      //   ),
      // ),

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

class SomeActionButton extends StatelessWidget {
  const SomeActionButton({
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
