import 'package:project_redpoint/data/repositories/message_repository.dart';
import 'package:project_redpoint/domain/entities/message.dart';
import 'package:project_redpoint/domain/entities/supabase.dart';

class SupabaseMessageRepository implements MessageRepository {
  @override
  Future<List<Message>> getMessage(int userId) async {
    final responses = await Supabase()
        .getSupabase()
        .from('message')
        .select('*')
        .eq('user_id', userId)
        .order('id', ascending: true);

    List<Message> messages = <Message>[];

    if (responses.isNotEmpty) {
      for (final data in responses) {
        messages.add(
          Message(
            message: data['message'].toString(),
            isUser: data['isUser'] as bool,
            userId: data['user_id'] as int
          ),
        );
      }
    }

    return messages;
  }
  
  @override
  Future<void> addMessage(String message, int userId, String role) async {
    if (role == 'user'){
      await Supabase().getSupabase().from('message').insert({'message': message, 'isUser': true, 'userId': userId});
    } else {
      await Supabase().getSupabase().from('message').insert({'message': message, 'isUser': false, 'userId': userId});
    }

    return;
  }
}
