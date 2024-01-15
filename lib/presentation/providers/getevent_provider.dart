import 'package:project_redpoint/domain/usecase/get_event.dart';
import 'package:project_redpoint/presentation/providers/event_repository_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'getevent_provider.g.dart';

@riverpod
GetEvent getEvent(GetEventRef ref) =>
    GetEvent(eventRepository: ref.read(eventRepositoryProvider));
