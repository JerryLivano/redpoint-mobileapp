import 'package:project_redpoint/data/repositories/message_repository.dart';
import 'package:project_redpoint/data/supabase/supabase_message_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'message_repository_provider.g.dart';

@riverpod
MessageRepository messageRepository(MessageRepositoryRef ref) =>
    SupabaseMessageRepository();
