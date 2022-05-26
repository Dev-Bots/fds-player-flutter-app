import 'package:dev_player_fds/Data/provider/provider.dart';

class EventRepository {
  final EventDataProvider eventDataProvider = EventDataProvider();

  EventRepository();

  Future getAllEvents() async {
    return eventDataProvider.getAllEvents();
  }

  Future getEvent(eventID) async {
    return await eventDataProvider.getEvent(eventID);
  }

  Future applyForEvent(eventID) async {
    return await eventDataProvider.applyForEvent(eventID);
  }
}
