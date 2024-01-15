import 'package:project_redpoint/domain/entities/event.dart';

abstract interface class EventRepository {
  Future <List<Event>> getEvent();
}