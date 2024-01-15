import 'package:project_redpoint/domain/entities/message.dart';
import 'package:project_redpoint/domain/usecase/send_message.dart';
import 'package:project_redpoint/domain/usecase/send_message_param.dart';
import 'package:project_redpoint/domain/usecase/show_message.dart';
import 'package:project_redpoint/domain/usecase/show_message_param.dart';
import 'package:project_redpoint/presentation/providers/sendmessage_provider.dart';
import 'package:project_redpoint/presentation/providers/showmessage_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'message_data_provider.g.dart';

@Riverpod(keepAlive: true)
class MessageData extends _$MessageData {
  @override
  Future<List<Message>?> build() async => null;

  Future<List<Message>> showMessage(int userId) async {
    ShowMessage showMessage = ref.read(showMessageProvider);
    var messages = await showMessage(ShowMessageParam(userId: userId));
    return messages;
  }

  Future<void> sendMessage(String message, int userId, String role) async {
    SendMessage sendMessage = ref.read(sendMessageProvider);
    await sendMessage(SendMessageParam(message: message, userId: userId, role: role));
    await showMessage(userId);
  }
}
