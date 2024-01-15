import 'package:project_redpoint/data/repositories/message_repository.dart';
import 'package:project_redpoint/domain/usecase/send_message_param.dart';
import 'package:project_redpoint/domain/usecase/usecase.dart';

class SendMessage implements Usecase<void, SendMessageParam> {
  final MessageRepository messageRepository;

  SendMessage({required this.messageRepository});

  @override
  Future<void> call(SendMessageParam params) async {
    await messageRepository.addMessage(params.message, params.userId, params.role);

    return;
  }
  
}