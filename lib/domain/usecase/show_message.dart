import 'package:project_redpoint/data/repositories/message_repository.dart';
import 'package:project_redpoint/domain/usecase/show_message_param.dart';
import 'package:project_redpoint/domain/usecase/usecase.dart';

import '../entities/message.dart';

class ShowMessage implements Usecase<List<Message>, ShowMessageParam>{
  final MessageRepository messageRepository;

  ShowMessage({required this.messageRepository});

  @override
  Future<List<Message>> call(ShowMessageParam param) async {
    final messages = await messageRepository.getMessage(param.userId);

    return messages;
  }
}