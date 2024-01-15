import 'package:project_redpoint/data/repositories/event_repository.dart';
import 'package:project_redpoint/domain/entities/event.dart';
import 'package:project_redpoint/domain/usecase/no_param.dart';
import 'package:project_redpoint/domain/usecase/usecase.dart';

class GetEvent implements Usecase<List<Event>, NoParam> {
  final EventRepository eventRepository;

  GetEvent({required this.eventRepository});

  @override
  Future<List<Event>> call(NoParam params) async {
    final events = await eventRepository.getEvent();

    return events;
  }
}
