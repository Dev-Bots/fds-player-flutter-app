import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:dev_player_fds/Data/repository/repository.dart';

part 'event_event.dart';
part 'event_state.dart';

class EventBloc extends Bloc<EventEvent, EventState> {
  final EventRepository _eventRepository = EventRepository();
  final ClubRepository _clubRepository = ClubRepository();

  EventBloc() : super(EventsLoading()) {
    on<GetAllEvents>((event, emit) async {
      emit(EventsLoading());
      var events = await _eventRepository.getAllEvents();
      // List parsedEvents = events;
      if (events != null) {
        for (var event in events) {
          var club = await _clubRepository.getClub(event.club);
          event.club = club;
        }

        emit(EventsLoaded(events: events));
      } else {
        emit(const EventsFailed(error: "Failed to load."));
      }
    });
    on<GetEvent>((event, emit) async {
      emit(EventLoading());
      var currentEvent = await _eventRepository.getEvent(event.eventId);

      if (currentEvent != null) {
        emit(EventLoaded(event: currentEvent));
      } else {
        emit(const EventFailed(error: "Failed to load."));
      }
    });
    on<ApplyForEvent>((event, emit) async {
      emit(ApplyingForEvent());
      await _eventRepository
          .applyForEvent(event.eventId)
          .then((value) => {
                emit(AppliedForEvent()),
              })
          .catchError((error) => {
                emit(const EventFailed(error: "Failed to apply.")),
              });
    });
  }
}
