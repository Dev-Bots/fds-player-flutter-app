import 'package:dev_player_fds/Bloc/EventBloc/event_bloc.dart';
import 'package:dev_player_fds/Data/repository/repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dev_player_fds/Data/provider/provider.dart';
import '../../Data/repository/repository.dart';
import 'package:http/http.dart' as http;

class Demi extends StatelessWidget {
  Demi({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => EventBloc()..add(GetAllEvents()),
        child: BlocBuilder<EventBloc, EventState>(
          builder: (context, state) {
            if (state is EventsLoading) {
              return Center(
                  child: Column(
                children: const [
                  CircularProgressIndicator(),
                  Text('Loading...'),
                ],
              ));
            }
            if (state is EventsLoaded) {
              return Column(
                children: [
                  SizedBox(
                    width: double.infinity,
                    height: 300,
                    child: Card(
                      elevation: 2,
                      child: ElevatedButton(
                        onPressed: () {
                          BlocProvider.of<EventBloc>(context)
                              .add(GetAllEvents());
                        },
                        child: const Text('Get Event'),
                      ),
                    ),
                  ),
                  ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: state.events.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(state.events[index].startingDate),
                        subtitle: Text(state.events[index].description),
                      );
                    },
                  ),
                ],
              );
            } else {
              print('Heeeeeeeeeeeeeeeeeeeeeere $state');
              return Center(
                  child: Column(
                children: const [
                  Text('Failed to load events'),
                ],
              ));
            }
          },
        ));
  }
}
