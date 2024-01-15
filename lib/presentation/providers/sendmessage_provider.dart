import 'package:project_redpoint/domain/usecase/send_message.dart';
import 'package:project_redpoint/presentation/providers/message_repository_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'sendmessage_provider.g.dart';

@riverpod
SendMessage sendMessage(SendMessageRef ref) =>
    SendMessage(messageRepository: ref.read(messageRepositoryProvider));
