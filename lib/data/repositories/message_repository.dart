import 'package:project_redpoint/domain/entities/message.dart';

abstract interface class MessageRepository {
  Future<List<Message>> getMessage(int userId);
  Future<void> addMessage(String message, int userId, String role);
}