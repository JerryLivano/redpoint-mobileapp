import 'package:project_redpoint/data/repositories/event_repository.dart';
import 'package:project_redpoint/domain/entities/event.dart';
import 'package:project_redpoint/domain/entities/supabase.dart';

class SupabaseEventRepository implements EventRepository {
  @override
  Future<List<Event>> getEvent() async {
    final responses = await Supabase()
        .getSupabase()
        .from('event')
        .select('*')
        .order('id', ascending: true);

    List<Event> events = <Event>[];

    if (responses.isNotEmpty) {
      for (final data in responses) {
        events.add(
          Event(
            image: data['image'],
          ),
        );
      }
    }

    return events;
  }
}
