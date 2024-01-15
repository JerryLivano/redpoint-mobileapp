import 'package:project_redpoint/data/repositories/event_repository.dart';
import 'package:project_redpoint/data/supabase/supabase_event_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'event_repository_provider.g.dart';

@riverpod
EventRepository eventRepository(EventRepositoryRef ref) =>
    SupabaseEventRepository();
