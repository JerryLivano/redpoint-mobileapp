import 'package:project_redpoint/domain/entities/event.dart';
import 'package:project_redpoint/domain/usecase/get_event.dart';
import 'package:project_redpoint/domain/usecase/no_param.dart';
import 'package:project_redpoint/presentation/providers/getevent_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'event_data_provider.g.dart';

@Riverpod(keepAlive: true)
class EventData extends _$EventData {
  @override
  Future<List<Event>> build() async {
    return getEvent();
  }

  Future<List<Event>> getEvent() async {
    GetEvent getEvent = ref.read(getEventProvider);
    var events = await getEvent(NoParam());
    return events;
  }
}
